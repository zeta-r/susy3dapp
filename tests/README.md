Tests and Coverage
================
19 February, 2021 02:57:21

-   [Coverage](#coverage)
-   [Unit Tests](#unit-tests)

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                                                | Coverage (%) |
|:------------------------------------------------------|:------------:|
| susy3dapp                                             |    19.48     |
| [R/app\_server.R](../R/app_server.R)                  |     0.00     |
| [R/golem\_utils\_server.R](../R/golem_utils_server.R) |     0.00     |
| [R/run\_app.R](../R/run_app.R)                        |     0.00     |
| [R/utils\_utils.R](../R/utils_utils.R)                |     0.00     |
| [R/golem\_utils\_ui.R](../R/golem_utils_ui.R)         |     2.78     |
| [R/app\_config.R](../R/app_config.R)                  |    14.29     |
| [R/mod\_obj\_inspection.R](../R/mod_obj_inspection.R) |    28.06     |
| [R/app\_ui.R](../R/app_ui.R)                          |    100.00    |
| [R/fct\_fetc\_ssr.R](../R/fct_fetc_ssr.R)             |    100.00    |
| [R/fct\_fetch\_obj.R](../R/fct_fetch_obj.R)           |    100.00    |
| [R/fct\_get\_obj\_name.R](../R/fct_get_obj_name.R)    |    100.00    |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat) package.

| file                                                          |   n |  time | error | failed | skipped | warning | icon |
|:--------------------------------------------------------------|----:|------:|------:|-------:|--------:|--------:|:-----|
| [test-fetc\_ssr.R](testthat/test-fetc_ssr.R)                  |   2 | 0.056 |     0 |      0 |       0 |       0 |      |
| [test-fetch\_obj.R](testthat/test-fetch_obj.R)                |  12 | 0.271 |     0 |      0 |       0 |       0 |      |
| [test-fetch\_ssr.R](testthat/test-fetch_ssr.R)                |   1 | 0.005 |     0 |      0 |       0 |       0 |      |
| [test-golem-recommended.R](testthat/test-golem-recommended.R) |   7 | 0.114 |     0 |      0 |       1 |       0 | 🔶    |

<details open>
<summary>
Show Detailed Test Results
</summary>

| file                                                              | context           | test                   | status  |   n |  time | icon |
|:------------------------------------------------------------------|:------------------|:-----------------------|:--------|----:|------:|:-----|
| [test-fetc\_ssr.R](testthat/test-fetc_ssr.R#L2)                   | fetc\_ssr         | fatch\_ssr works       | PASS    |   2 | 0.056 |      |
| [test-fetch\_obj.R](testthat/test-fetch_obj.R#L2)                 | fetch\_obj        | fetch\_obj works       | PASS    |   2 | 0.003 |      |
| [test-fetch\_obj.R](testthat/test-fetch_obj.R#L21)                | fetch\_obj        | names’ extractors work | PASS    |  10 | 0.268 |      |
| [test-fetch\_ssr.R](testthat/test-fetch_ssr.R#L2)                 | fetch\_ssr        | multiplication works   | PASS    |   1 | 0.005 |      |
| [test-golem-recommended.R](testthat/test-golem-recommended.R#L3)  | golem-recommended | app ui                 | PASS    |   2 | 0.099 |      |
| [test-golem-recommended.R](testthat/test-golem-recommended.R#L13) | golem-recommended | app server             | PASS    |   4 | 0.013 |      |
| [test-golem-recommended.R](testthat/test-golem-recommended.R#L63) | golem-recommended | app launches           | SKIPPED |   1 | 0.002 | 🔶    |

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
