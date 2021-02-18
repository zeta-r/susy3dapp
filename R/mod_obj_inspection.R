#' obj_inspection UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList fluidRow selectInput plotOutput
mod_obj_inspection_ui <- function(id) {
  ns <- NS(id)

  obj <- fetch_obj()
  obj_list <- sort(unique(obj[["descrENG"]]))

  tagList(
    fluidRow(col_4(
      selectInput(
        ns("obj"), "Select an object",
        choices = obj_list
      )
    )),
    fluidRow(col_12(
      plotOutput(ns("age"))
    ))
  )
}

#' obj_inspection Server Functions
#'
#' @noRd
#'
#' @importFrom shiny moduleServer reactive
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


    selected_obj <- reactive(
      obj %>%
        dplyr::filter(.data[["descrENG"]] == input[["obj"]])
    )

    data_of_interest <- reactive(
      dplyr::inner_join(ssr, selected_obj())
    )

    output[["age"]] <- renderPlot(
      data_of_interest() %>%
        ggplot(aes(
          x = .data[["gender"]],
          y = .data[["ageOfChild"]],
          color = .data[["gender"]]
        )) +
        geom_boxplot(varwidth = TRUE) +
        labs(
          x = "Gender",
          y = "Age",
          title = glue::glue(
            "Age distribution for children having fbi from {selected_obj()[['descrENG']]}."
          )
        ) +
        theme_bw() +
        guides(color = "none")
    )

  })

}

## To be copied in the UI
# mod_obj_inspection_ui("obj_inspection_ui_1")

## To be copied in the server
# mod_obj_inspection_server("obj_inspection_ui_1")
