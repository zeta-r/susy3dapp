#' fetch_obj
#'
#' @description retrieve obj data from a connection
#'
#' @return a [tibble][tibble::tibble-package]
#'
#' @noRd
fetch_obj <- function() {
  tibble::as_tibble(data_obj)
}
