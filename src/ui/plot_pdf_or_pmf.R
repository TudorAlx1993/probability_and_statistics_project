PlotPdfOrPmf <- function(x,
                         pdf.or.pmf,
                         dist.name,
                         is.continuous.dist = c(TRUE, FALSE)) {
  is.continuous.dist <- is.continuous.dist[[1]]
  data <- data.frame(x = x, pdf.or.pmf = pdf.or.pmf)
  
  plot.object <-
    ggplot(data, aes(x = x, y = pdf.or.pmf))
  
  if (is.continuous.dist) {
    plot.object <- plot.object +
      geom_line(size = 2.5, colour = 'blue')
    y.label = 'PDF'
  } else {
    plot.object <- plot.object +
      geom_point(size = 2.5, colour = 'blue') +
      scale_y_continuous(labels = scales::percent)
    y.label = 'PMF'
  }
  
  plot.object <- plot.object +
    theme_classic() +
    labs(
      x = 'Values',
      y = y.label,
      title = paste0(dist.name,
                     ' (',
                     ifelse(is.continuous.dist, 'PDF', 'PMF'), ')')
    )
  
  return(plot.object)
}
