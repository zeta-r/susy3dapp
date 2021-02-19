## code to prepare `DATASET` dataset goes here

devtools::load_all()

# data_obj and data_ssr retreived from .Rdata provided by MG

data_obj <- data_obj %>%
  dplyr::mutate(
    stl = purrr::map(paste0(.data[["img3d"]], ".stl"), get)
  ) %>%
  dplyr::mutate(
    name = glue::glue(
      "{get_value(uploadPicture)}",
      "{get_unit(uploadPicture)}",
      "({get_currency(uploadPicture)})",
      .sep = " "
    )
  )

usethis::use_data(data_obj, data_ssr,
                  internal = TRUE,
                  compress = "xz",
                  overwrite = TRUE)
