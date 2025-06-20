library(testthat)
source("R/choose_corr.R")
test_that("choose_corr works", {
  set.seed(1)
  df <- data.frame(id=rep(1:20, each=5),
                   time=rep(0:4,20),
                   ApneaIndex=rnorm(100),
                   age=rnorm(100,60,8),
                   sex=sample(c("M","F"),100,TRUE),
                   PWV=rnorm(100))
  res <- choose_corr(df,"PWV","id",c("time","ApneaIndex"))
  expect_s3_class(res$best,"geeglm")
  expect_equal(nrow(res$qic_tbl),3)
})
