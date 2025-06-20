#' Missing data utilities
#' @export
plot_missing_pattern <- function(df){
  if(!requireNamespace("naniar", quietly=TRUE))
    stop("Install `naniar` for missingness plots.")
  naniar::gg_miss_upset(df)
}
#' IPW weights generator
#' @export
calc_ipw_weights <- function(df, id, outcome){
  df$miss <- ifelse(is.na(df[[outcome]]),1,0)
  wt_mod <- glm(miss ~ ., data=df[!names(df)%in%c(id,outcome)], family=binomial)
  p <- predict(wt_mod, type="response")
  df$ipw <- mean(p)/(p)
  df
}
