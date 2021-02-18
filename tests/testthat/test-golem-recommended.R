test_that("app ui", {
  ui <- app_ui()
  golem::expect_shinytaglist(ui)
  # Check that formals have not been removed
  fmls <- formals(app_ui)
  for (i in c("request")) {
    expect_true(i %in% names(fmls))
  }
})

test_that("app server", {
  server <- app_server
  expect_type(server, "closure")
  # Check that formals have not been removed
  fmls <- formals(app_server)
  for (i in c("input", "output", "session")) {
    expect_true(i %in% names(fmls))
  }
})

# Configure this test to fit your need
test_that("app launches", {
  skip_on_ci()

  f <- function(sleep, testdir = "apptest") {
    skip_on_cran()

    if (Sys.getenv("CALLR_CHILD_R_LIBS_USER") == "") {
      pkg_name <- pkgload::pkg_name()
      go_for_pkgload <- TRUE
    } else {
      pkg_name <- Sys.getenv("TESTTHAT_PKG")
      go_for_pkgload <- FALSE
      cat(pkg_name)
    }
    if (go_for_pkgload) {
      shinyproc <- processx::process$new(
        command = normalizePath(file.path(
          Sys.getenv("R_HOME"), "bin", "R"
        )),
        c(
          "-e",
          "pkgload::load_all(here::here());run_app()"))
    } else {
      shinyproc <- processx::process$new(
        echo_cmd = TRUE,
        command = normalizePath(file.path(
          Sys.getenv("R_HOME"), "bin", "R"
        )),
        c("-e",
          sprintf(
            "library(%s, lib = '%s');run_app()", pkg_name, .libPaths()
          )
        ),
        stdout = "|", stderr = "|"
      )
    }
    Sys.sleep(sleep)
    expect_true(shinyproc$is_alive())
    shinyproc$kill()
  }

  f(5)
})
