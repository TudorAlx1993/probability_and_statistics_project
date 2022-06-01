BoxPlot <- function(data,
                    y.var.name,
                    y.label = NULL,
                    plot.title = NULL) {
  plot.object <- ggplot(data, aes_string(y = y.var.name)) +
    geom_boxplot(
      fill = 'lightblue',
      outlier.colour = "red",
      outlier.shape = 8,
      outlier.size = 4
    ) +
    scale_x_discrete() +
    theme_classic()
  
  if (is.null(plot.title)) {
    plot.title <- paste0('Boxplot of ', y.var.name)
  }
  
  if (is.null(y.label)) {
    y.label = y.var.name
  }
  
  plot.object <- plot.object +
    labs(y = y.label, title = plot.title) +
    theme(plot.title = element_text(size = 20))
  
  return(plot.object)
}
