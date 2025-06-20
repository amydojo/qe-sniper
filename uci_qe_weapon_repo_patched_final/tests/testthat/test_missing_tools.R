library(testthat)
source("R/missing_tools.R")

test_that("calc_ipw_weights adds ipw column", {
  df <- data.frame(id=1:4, outcome=c(1,NA,0,1), x=c(2,3,4,5))
  res <- calc_ipw_weights(df, id="id", outcome="outcome")
  expect_true("ipw" %in% names(res))
  expect_equal(nrow(res), 4)
})

test_that("plot_missing_pattern requires naniar", {
  skip_if(requireNamespace("naniar", quietly = TRUE))
  expect_error(plot_missing_pattern(data.frame(a=1)), "naniar")
})
