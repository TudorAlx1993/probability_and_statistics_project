PlotCdf <- function(x,
                    cdf,
                    dist.name,
                    is.continuous.dist = c(TRUE, FALSE)) {
  is.continuous.dist <- is.continuous.dist[[1]]
  data <- data.frame(x = x, cdf = cdf)
  
  plot.object <-
    ggplot(data, aes(x = x, y = cdf))
  
  if (is.continuous.dist) {
    plot.object <- plot.object +
      geom_line(size = 2.5, colour = 'red')
  } else {
    plot.object <- plot.object +
      geom_point(size = 2.5, colour = 'red')
  }
  
  plot.object <- plot.object +
    scale_y_continuous(labels = scales::percent) +
    theme_classic() +
    labs(x = 'Values',
         y = 'CDF',
         title = paste(dist.name, '(CDF)'))
  
  return(plot.object)
  
}
