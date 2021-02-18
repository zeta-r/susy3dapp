#' obj_inspection UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList fluidRow selectInput
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
    ))
  )
}

#' obj_inspection Server Functions
#'
#' @noRd
#'
#' @importFrom shiny moduleServer
mod_obj_inspection_server <- function(id) {

  moduleServer(id, function(input, output, session) {
    ns <- session$ns

  })

}

## To be copied in the UI
# mod_obj_inspection_ui("obj_inspection_ui_1")

## To be copied in the server
# mod_obj_inspection_server("obj_inspection_ui_1")
