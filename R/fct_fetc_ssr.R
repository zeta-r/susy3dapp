#' fetch_ssr
#'
#' @description retrieve Susy Safe registry (ssr) data from a
#'   connection.
#'
#' @return a [tibble][tibble::tibble-package]
#'
#' @noRd
fetch_ssr <- function() {
  tibble::as_tibble(data_ssr)
}
