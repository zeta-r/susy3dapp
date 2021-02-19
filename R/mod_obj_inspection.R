#' obj_inspection UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList fluidRow selectInput plotOutput
#' @importFrom shiny actionButton textOutput h3 HTML
mod_obj_inspection_ui <- function(id) {
  ns <- NS(id)

  obj <- fetch_obj()
  obj_list <- sort(unique(obj[["name"]]))

  tagList(
    shiny::sidebarLayout(
      shiny::sidebarPanel(
        fluidRow(
          col_5(
            checkboxGroupInput(
              ns("obj"),
              HTML("Select an object<br>(3D-rendered if single)"),
              choices = obj_list,
              selected = "1 Cent (USD)",
              width = "100%"
            )
          ),
          col_7(rgl::rglwidgetOutput(ns("obj_3d"),
                                     width = "100%", height = "300px")),
          col_12(DT::DTOutput(ns("obj_tbl")))
        )
      ),
      shiny::mainPanel(
        h3(textOutput(ns("caption"))),
        fluidRow(
          col_12(actionButton(ns("update"),
                              "Click here to update",
                              class = "btn-primary btn-lg",
                              icon = icon("refresh"),
                              width = "100%"
          ), align = "center")
        ),
        tabsetPanel(
          tabPanel("Population",
            col_12(plotly::plotlyOutput(ns("age")))
          ),
          tabPanel("Events",
                   col_4(plotly::plotlyOutput(ns("death"))),
                   col_4(plotly::plotlyOutput(ns("hospitalised"))),
                   col_4(plotly::plotlyOutput(ns("complication")))
          ),
          tabPanel("Geometric associations",
                   col_12(plotly::plotlyOutput(ns("hosp_vol_area"))),
                   col_6(plotly::plotlyOutput(ns("hosp_area"))),
                   col_6(plotly::plotlyOutput(ns("hosp_vol")))
          )
        )
      )
    )
  )
}

#' obj_inspection Server Functions
#'
#' @noRd
#'
#' @importFrom shiny moduleServer reactive renderText
#' @import ggplot2
mod_obj_inspection_server <- function(id) {

  ssr <- fetch_ssr() %>%
    dplyr::select(
      .data[["gender"]], .data[["ageOfChild"]], .data[["hospitalised"]],
      .data[["complication"]], .data[["img3d"]], .data[["death"]]
    )

  obj <- fetch_obj() %>%
    dplyr::mutate(
      area = .data[["stl"]] %>%
        purrr::map_dbl(Rvcg::vcgArea) %>%
        round(3),
      volume = .data[["stl"]] %>%
        purrr::map_dbl(Rvcg::vcgVolume) %>%
        round(3)
    )

  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    observeEvent(input[["update"]], {

      selected_obj <- obj %>%
          dplyr::filter(.data[["name"]] %in% input[["obj"]])

      data_of_interest <- dplyr::inner_join(ssr, selected_obj)

      output[["caption"]] <- renderText({
        glue::glue(
          "FBs: {paste(unique(selected_obj[['descrENG']]), collapse = ', ')}."
        )
      })



      output[["age"]] <- plotly::renderPlotly({
        gg <- data_of_interest %>%
          ggplot(aes(
            x = .data[["gender"]],
            y = .data[["ageOfChild"]],
            color = .data[["gender"]]
          )) +
          geom_boxplot(varwidth = TRUE) +
          geom_jitter() +
          labs(
            x = "Gender",
            y = "Age",
            title =
              "Age distribution for children having FBI"
          ) +
          theme_bw() +
          theme(legend.position = 'none')

        clean_ggplotly(gg)
      })


      output[["hospitalised"]] <- plotly::renderPlotly({
        gg <- data_of_interest %>%
          ggplot(aes(
            x = .data[["hospitalised"]],
            fill = .data[["gender"]]
          )) +
          geom_bar() +
          labs(
            x = "Hospitalised",
            title =
              "Hospitalised cases for children having FBI"
          ) +
          theme_bw() +
          theme(legend.position = 'none')

        clean_ggplotly(gg)
      })

      output[["death"]] <- plotly::renderPlotly({
        gg <- data_of_interest %>%
          ggplot(aes(
            x = .data[["death"]],
            fill = .data[["gender"]]
          )) +
          geom_bar() +
          labs(
            x = "Death",
            title =
              "Death cases for children having FBI"
          ) +
          theme_bw()

        clean_ggplotly(gg)
      })

      output[["complication"]] <- plotly::renderPlotly({
        gg <- data_of_interest %>%
          ggplot(aes(
            x = .data[["complication"]],
            fill = .data[["gender"]]
          )) +
          geom_bar() +
          labs(
            x = "Complications",
            title =
              "Presence of complications for children having FBI"
          ) +
          theme_bw() +
          theme(legend.position = 'none')

        clean_ggplotly(gg)
      })

      gg_color_hue <- function(n) {
        hues = seq(15, 375, length = n + 1)
        hcl(h = hues, l = 65, c = 100)[1:n]
      }
      cols <- gg_color_hue(2)
      output[["hosp_vol_area"]] <- plotly::renderPlotly({
        gg <- data_of_interest %>%
          ggplot(aes(
            x = .data[["area"]],
            y = .data[["volume"]],
            color = .data[["hospitalised"]]
          )) +
          geom_jitter(width = 0.25, height = 0.25) +
          scale_colour_manual(values = c("no" = cols[[2]], "yes" = cols[[1]])) +
          labs(
            x = "Area",
            y = "Volume",
            color = "Hospitalized",
            title =
              "Area and Volume across hospitalized children having FBI"
          ) +
          theme_bw()

        clean_ggplotly(gg)
      })


      output[["hosp_vol"]] <- plotly::renderPlotly({
        gg <- data_of_interest %>%
          ggplot(aes(
            x = .data[["hospitalised"]],
            y = .data[["volume"]],
            color = .data[["hospitalised"]]
          )) +
          geom_boxplot(varwidth = TRUE) +
          geom_jitter() +
          scale_colour_manual(values = c("no" = cols[[2]], "yes" = cols[[1]])) +
          labs(
            x = "Hospitalised",
            y = "Volume",
            title =
              "Volume distribution for children having FBI"
          ) +
          theme_bw() +
          theme(legend.position = 'none')

        clean_ggplotly(gg)
      })


      output[["hosp_area"]] <- plotly::renderPlotly({
        gg <- data_of_interest %>%
          ggplot(aes(
            x = .data[["hospitalised"]],
            y = .data[["area"]],
            color = .data[["hospitalised"]]
          )) +
          geom_boxplot(varwidth = TRUE) +
          scale_colour_manual(values = c("no" = cols[[2]], "yes" = cols[[1]])) +
          geom_jitter() +
          labs(
            x = "Hospitalised",
            y = "Area",
            title =
              "Area distribution for hospedalized children having FBI"
          ) +
          theme_bw() +
          theme(legend.position = 'none')

        clean_ggplotly(gg)
      })

      output[["obj_tbl"]] <- DT::renderDT({
        base_tbl <- selected_obj %>%
          dplyr::select(
            .data[["cn8"]], .data[["cn8_ss"]], .data[["name"]],
            .data[["stl"]], .data[["area"]], .data[["volume"]]
          ) %>%
          dplyr::rename(
            `Area (cm^2)` = .data[["area"]],
            `Volume (cm^3)` = .data[["volume"]]
          ) %>%
          dplyr::select(-.data[["stl"]]) %>%
          dplyr::rename(
            `CN-8` = .data[["cn8"]],
            `CN-8 (SSR)` = .data[["cn8_ss"]],
            Name = .data[["name"]]
          )
      }, filter = "top")

      output[["obj_3d"]] <- rgl::renderRglwidget({
        try(rgl::close3d(), silent = TRUE)

        if (nrow(selected_obj) == 1) {
          obj_3d <- selected_obj[["stl"]][[1L]]
          obj_3d$material$color <- 'grey'

          rgl::shade3d(obj_3d, color = "orange")

          rgl::rglwidget()
        }
      })

    })
  })
}

## To be copied in the UI
# mod_obj_inspection_ui("obj_inspection_ui_1")

## To be copied in the server
# mod_obj_inspection_server("obj_inspection_ui_1")
