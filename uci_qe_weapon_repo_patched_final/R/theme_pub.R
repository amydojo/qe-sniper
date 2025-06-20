theme_pub <- function(base_size=11){
  ggplot2::theme_minimal(base_size=base_size) +
    ggplot2::theme(
      plot.title = ggplot2::element_text(face="bold",hjust=.5),
      axis.title = ggplot2::element_text(face="bold"),
      legend.position="bottom"
    ) +
    ggplot2::scale_colour_viridis_d() +
    ggplot2::scale_fill_viridis_d()
}
