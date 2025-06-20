#' Diagnostics helpers
#' @export
diag_resid_panel <- function(model, path=NULL){
  if(!requireNamespace("ggResidpanel", quietly=TRUE))
    stop("Install `ggResidpanel`.")
  p <- ggResidpanel::resid_panel(model)
  if(!is.null(path)) ggsave(path, p, width=6,height=4)
  p
}
