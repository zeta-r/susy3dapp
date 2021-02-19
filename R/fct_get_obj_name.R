get_currency <- function(png_name) {
  stringr::str_remove(png_name, "_.+$") %>%
    stringr::str_to_upper()
}

get_value <- function(png_name) {
  stringr::str_extract(png_name, "\\d+")
}

get_unit <- function(png_name) {
  stringr::str_remove_all(png_name, "(^.+_.+_)|(\\..+$)") %>%
    stringr::str_to_title()
}
