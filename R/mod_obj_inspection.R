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
        fluidRow(
          col_12(plotly::plotlyOutput(ns("age"))),
          col_6(plotly::plotlyOutput(ns("death"))),
          col_6(plotly::plotlyOutput(ns("complication")))
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
      .data[["gender"]], .data[["ageOfChild"]], .data[["death"]],
      .data[["complication"]], .data[["img3d"]]
    )

  obj <- fetch_obj()

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
          theme_bw() +
          theme(legend.position = 'none')

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


      output[["obj_tbl"]] <- DT::renderDT({
        base_tbl <- selected_obj %>%
          dplyr::select(
            .data[["cn8"]], .data[["cn8_ss"]], .data[["name"]],
            .data[["stl"]]
          ) %>%
          dplyr::mutate(
            `Area (cm^2)` = .data[["stl"]] %>%
              purrr::map_dbl(Rvcg::vcgArea) %>%
              round(3),
            `Volume (cm^3)` = .data[["stl"]] %>%
              purrr::map_dbl(Rvcg::vcgVolume) %>%
              round(3)
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
