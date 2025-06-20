library(targets); library(tarchetypes)
tar_option_set(packages=c("tidyverse","geepack","lme4","QIC","mice","broom.mixed"))
source("R/choose_corr.R")

datasets <- tibble::tibble(
  label = c("main","practice_A","practice_B"),
  path  = c("data/CVH_SleepVaso.csv","data/practice_A_LLS.csv","data/practice_B_CVH.csv")
)

list(
  tar_target(dataset_info, datasets),
  tar_target(df, readr::read_csv(dataset_info$path, show_col_types = FALSE),
             pattern = map(dataset_info)),
  tar_target(gee, choose_corr(df,"PWV","id",
              c("time","ApneaIndex","time:ApneaIndex","age","sex")), pattern=map(df)),
  tar_target(report, tar_quarto("report.qmd",
              execute_params = list(dataset_label = dataset_info$label)),
              pattern = map(dataset_info))
)
