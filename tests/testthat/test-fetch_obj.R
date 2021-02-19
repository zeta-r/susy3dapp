test_that("fetch_obj works", {
  expect_s3_class({obj <- fetch_obj()}, "tbl_df")

  expected_names <- c("img3d", "cn8", "cn8_ss", "descrITA", "descrENG",
                      "descrFRA", "descrDDD", "uploadPicture",
                      "pictureContent", "FB_dim1_MM", "FB_dim2_MM",
                      "FB_dim3_MM", "stl", "name")
  expect_named(obj, expected_names)
})




test_that("names' extractors work", {
  obj <- fetch_obj()

  name_1 <- obj$uploadPicture[[1]]
  name_9 <- obj$uploadPicture[[9]]
  name_13 <- obj$uploadPicture[[13]]

  expect_equal(get_currency(name_1), "EUR")
  expect_equal(get_currency(name_9), "UK")
  expect_equal(get_currency(name_13), "USD")

  expect_equal(get_value(name_1), "1")
  expect_equal(get_value(name_9), "1")
  expect_equal(get_value(name_13), "25")

  expect_equal(get_unit(name_1), "Cent")
  expect_equal(get_unit(name_9), "Penny")
  expect_equal(get_unit(name_13), "Cent")

  expect_equal(obj[["name"]][[1L]], "1 Cent (EUR)",
              ignore_attr = TRUE)

})
