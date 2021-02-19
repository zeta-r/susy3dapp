# Building a Prod-Ready, Robust Shiny Application.
#
# README: each step of the dev files is optional, and you don't have to
# fill every dev scripts before getting started.
# 01_start.R should be filled at start.
# 02_dev.R should be used to keep track of your development during the project.
# 03_deploy.R should be used once you need to deploy your app.
#
#
###################################
#### CURRENT FILE: DEV SCRIPT #####
###################################

# Engineering

## Dependencies ----
## Add one line by package you want to add as dependency

usethis::use_package("rgl")
usethis::use_package("Rvcg")
usethis::use_package("glue")
usethis::use_package("ggplot2")
usethis::use_package("dplyr")
usethis::use_package("stringr")


## Add modules ----
## Create a module infrastructure in R/
golem::add_module(name = "obj_inspection") # Name of the module

## Add helper functions ----
## Creates ftc_* and utils_*
tdd_add_fct <- function(name) {
  list(usethis::use_test, golem::add_fct) %>%
    purrr::walk(~.(name))
}

tdd_add_fct("fetch_obj")
tdd_add_fct("fetch_ssr")

golem::add_utils("utils")


# Documentation

# Create a summary readme for the testthat subdirectory
# remotes::install_github('yonicd/covrpage')
covrpage::covrpage(vignette = TRUE)

