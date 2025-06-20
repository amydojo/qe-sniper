library(testthat)
source("R/diagnostics_utils.R")

simple_model <- lm(mpg ~ wt, data = mtcars)

test_that("diag_resid_panel returns ggplot", {
  skip_if_not_installed("ggResidpanel")
  p <- diag_resid_panel(simple_model)
  expect_true(inherits(p, "gg"))
})

test_that("diag_resid_panel errors when ggResidpanel missing", {
  skip_if(requireNamespace("ggResidpanel", quietly = TRUE))
  expect_error(diag_resid_panel(simple_model), "ggResidpanel")
})
