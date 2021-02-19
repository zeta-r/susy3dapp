# susy3dapp (development version)

* Added table with object's characteristics.
* Added 3d Show for the object selected (if single)
* Added check boxes to select (multiple) objects
* Added bar plots for deaths and complications
* defined `fetch_ssr()` to retrieve the SusySafe registry tibble from a
  connection (currently from internal stored `data_ssr` db).
* defined `fetch_obj()` to retrieve object tibble from a connection
  (currently from internal stored `data_obj` db).
* Move data for internal usage only.
* Added `mod_obj_inspection.R` module to host single object selection 
  and corresponding patients' characteristics inspection.
* Added 3d support ({rgl}).
* Added obj and ssr data.

# susy3dapp 0.0.0.9001

* Added support for QA, TDD and CI/CD ({spelling}, {renv}, {tettthat},
  {autotestthat}, {codecov}, linters, GitHub Actions).
* Added support for package and app development ({golem}, {usethis},
  {devtools}, {tibble}, {pipe}, {tidyeval}).
* Added support for documentation ({roxygen2}, {rmarkdown},
  `README.rmd` file, `susy3dapp-package.R`).
* Added a `NEWS.md` file to track changes to the package.
