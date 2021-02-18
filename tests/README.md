Tests and Coverage
================
18 February, 2021 10:07:49

-   [Coverage](#coverage)
-   [Unit Tests](#unit-tests)

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                                                | Coverage (%) |
|:------------------------------------------------------|:------------:|
| susy3dapp                                             |     9.39     |
| [R/golem\_utils\_server.R](../R/golem_utils_server.R) |     0.00     |
| [R/golem\_utils\_ui.R](../R/golem_utils_ui.R)         |     0.00     |
| [R/run\_app.R](../R/run_app.R)                        |     0.00     |
| [R/app\_config.R](../R/app_config.R)                  |    14.29     |
| [R/app\_ui.R](../R/app_ui.R)                          |    100.00    |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat) package.

| file                                                          |   n |  time | error | failed | skipped | warning | icon |
|:--------------------------------------------------------------|----:|------:|------:|-------:|--------:|--------:|:-----|
| [test-golem-recommended.R](testthat/test-golem-recommended.R) |   7 | 0.041 |     0 |      0 |       1 |       0 | 🔶    |

<details open>
<summary>
Show Detailed Test Results
</summary>

| file                                                              | context           | test         | status  |   n |  time | icon |
|:------------------------------------------------------------------|:------------------|:-------------|:--------|----:|------:|:-----|
| [test-golem-recommended.R](testthat/test-golem-recommended.R#L3)  | golem-recommended | app ui       | PASS    |   2 | 0.013 |      |
| [test-golem-recommended.R](testthat/test-golem-recommended.R#L13) | golem-recommended | app server   | PASS    |   4 | 0.026 |      |
| [test-golem-recommended.R](testthat/test-golem-recommended.R#L63) | golem-recommended | app launches | SKIPPED |   1 | 0.002 | 🔶    |

| Failed | Warning | Skipped |
|:-------|:--------|:--------|
| 🛑      | ⚠️      | 🔶       |

</details>
<details>
<summary>
Session Info
</summary>

| Field    | Value                         |
|:---------|:------------------------------|
| Version  | R version 4.0.3 (2020-10-10)  |
| Platform | x86\_64-pc-linux-gnu (64-bit) |
| Running  | Debian GNU/Linux bullseye/sid |
| Language | en\_US                        |
| Timezone | Europe/Rome                   |

| Package  | Version |
|:---------|:--------|
| testthat | 3.0.2   |
| covr     | 3.5.1   |
| covrpage | 0.1     |

</details>
<!--- Final Status : skipped/warning --->