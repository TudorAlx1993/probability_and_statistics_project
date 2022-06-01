PlotHistogram <- function(data,
                          var.name,
                          bins = 30,
                          x.label = NULL,
                          y.label = NULL,
                          plot.title = NULL) {
  plot.object <- ggplot(data, aes_string(x = var.name)) +
    geom_histogram(color = 'darkblue',
                   fill = 'lightblue',
                   bins = bins) +
    theme_classic()
  
  if (is.null(x.label)) {
    x.label <- var.name
  }
  
  if (is.null(y.label)) {
    y.label <- 'Count'
  }
  
  if (is.null(plot.title)) {
    plot.title <- paste0('Histogram of ', var.name)
  }
  
  plot.object <- plot.object +
    labs(x = x.label, y = y.label, title = plot.title) +
    theme(plot.title = element_text(size = 20))
  
  return(plot.object)
}
