test_that("fetch_obj works", {
  expect_s3_class({obj <- fetch_obj()}, "tbl_df")

  expected_names <- c("img3d", "cn8", "cn8_ss", "descrITA", "descrENG",
                      "descrFRA", "descrDDD", "uploadPicture",
                      "pictureContent", "FB_dim1_MM", "FB_dim2_MM",
                      "FB_dim3_MM")
  expect_named(obj, expected_names)
})
