# Building a Prod-Ready, Robust Shiny Application.
#
# README: each step of the dev files is optional, and you don't have to
# fill every dev scripts before getting started.
# 01_start.R should be filled at start.
# 02_dev.R should be used to keep track of your development during the project.
# 03_deploy.R should be used once you need to deploy your app.
#
#
########################################
#### CURRENT FILE: ON START SCRIPT #####
########################################

## Fill the DESCRIPTION ----
## Add meta data about your application
##
## /!\ Note: if you want to change the name of your app during development,
## either re-run this function, call golem::set_golem_name(), or don't forget
## to change the name in the app_sys() function in app_config.R /!\
##
golem::fill_desc(
  pkg_name = "susy3dapp", # The Name of the package containing the App
  pkg_title = "SusySafe 3d", # The Title of the package containing the App
  pkg_description = "Demo for the SusySafe 3d App.", # The Description of the package containing the App
  author_first_name = "Corrado", # Your First Name
  author_last_name = "Lanera", # Your Last Name
  author_email = "CorradoLanera@zetaresearch.com", # Your Email
  repo_url = "https://github.com/zeta-r/susy3dapp" # The URL of the GitHub Repo (optional)
)

## Set {golem} options ----
golem::set_golem_options()

## Create Common Files ----
## See ?usethis for more information
usethis::use_proprietary_license( "Corrado Lanera & Zeta Research" )  # You can set another license here
usethis::use_roxygen_md()
usethis::use_readme_rmd( open = TRUE )
usethis::use_code_of_conduct()
usethis::use_cran_badge()
usethis::use_lifecycle_badge( "Experimental" )
usethis::use_news_md( open = TRUE )

## Use git ----
usethis::use_git()
usethis::git_vaccinate()
usethis::use_tidy_github()

## Init Testing Infrastructure ----
## Create a template for tests
golem::use_recommended_tests()

## Use Recommended Packages ----
golem::use_recommended_deps()

## Favicon ----
# If you want to change the favicon (default is golem's one)
golem::use_favicon() # path = "path/to/ico". Can be an online file.
golem::remove_favicon()

## Add helper functions ----
golem::use_utils_ui()
golem::use_utils_server()


## Package documentation ----
usethis::use_package_doc()

## Spellcheck ----
usethis::use_spell_check()
spelling::spell_check_package()
spelling::update_wordlist()


## Quality checks ----
usethis::use_tidy_description()
# install.packages("lintr)
lintr::lint_package()

## Code Coverage----
## Set the code coverage service ("codecov" or "coveralls")
usethis::use_coverage()

## Activate renv
renv::init(settings = list(snapshot.type = "explicit"))
renv::status() # just to check
# You're now set! ----


## tidy stuff
usethis::use_pipe()
usethis::use_tibble()
usethis::use_tidy_eval()

## CI/CD and TDD
usethis::use_github_action(
  url = "https://raw.githubusercontent.com/CorradoLanera/actions/master/lint-renv.yaml"
)
usethis::use_github_actions_badge("lint")

usethis::use_github_action(
  url = "https://raw.githubusercontent.com/CorradoLanera/actions/master/R-CMD-check-renv.yaml"
)
usethis::use_github_actions_badge("R-CMD-check")

usethis::use_github_action(
  url = "https://raw.githubusercontent.com/CorradoLanera/actions/master/covr-renv.yaml"
)
usethis::use_github_actions_badge("test-coverage")

renv::install("CorradoLanera/autotestthat") # {renv} installation



## final checks
usethis::use_tidy_description()
devtools::check_man()
spelling::spell_check_package()
spelling::update_wordlist()
lintr::lint_package()
renv::status()

# go to dev/02_dev.R
rstudioapi::navigateToFile( "dev/02_dev.R" )

