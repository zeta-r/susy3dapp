clean_ggplotly <- function(
  p = ggplot2::last_plot(),
  width = NULL,
  height = NULL,
  tooltip = "all",
  dynamic_ticks = FALSE,
  layer_data = 1,
  original_data = TRUE,
  source = "A",
  ...) {
  plotly::ggplotly(
    p = p,
    width = width,
    height = height,
    tooltip = tooltip,
    dynamicTicks = dynamic_ticks,
    layerData = layer_data,
    originalData = original_data,
    source = source,
    ... = ...
  ) %>%
    plotly::config(
      displaylogo = FALSE,
      modeBarButtonsToRemove = c(
        "zoomIn2d", "zoomOut2d", "pan2d", "select2d", "lasso2d"
      )
    )
}
