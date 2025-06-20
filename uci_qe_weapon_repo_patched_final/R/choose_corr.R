#' Choose best GEE correlation by QIC
#' @export
choose_corr <- function(df, outcome, id, covars,
                        corrs = c("independence","exchangeable","ar1")){
  stopifnot(requireNamespace("geepack", quietly=TRUE),
            requireNamespace("QIC", quietly=TRUE))
  formula <- reformulate(covars, outcome)
  missing_cols <- setdiff(all.vars(formula), names(df))
  if(length(missing_cols)) stop("Missing cols: ", paste(missing_cols, collapse=","))
  fits <- lapply(corrs, function(cc)
    geepack::geeglm(formula, id = df[[id]], data = df,
                    family = gaussian, corstr = cc))
  q <- sapply(fits, function(m) QIC::QIC(m)[["QIC"]])
  tib <- tibble::tibble(corstr = corrs, QIC = unname(q))
  list(best = fits[[which.min(q)]], qic_tbl = tib)
}
