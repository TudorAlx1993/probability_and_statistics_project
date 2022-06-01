PlotDistribution <-
  function(x,
           pdf.or.pmf,
           cdf,
           dist.name,
           is.continuous.dist = c(TRUE, FALSE)) {
    is.continuous.dist <- is.continuous.dist[[1]]
    data <- data.frame(x = x,
                       pdf.or.pmf = pdf.or.pmf,
                       cdf = cdf) %>%
      rename(CDF = cdf)
    if (is.continuous.dist) {
      data <- data %>%
        rename(PDF = pdf.or.pmf)
    } else{
      data <- data %>%
        rename(PMF = pdf.or.pmf)
    }
    data <- data %>%
      melt(id.vars = 'x')
    
    plot.object <-
      ggplot(data, aes(x = x, y = value, col = variable))
    
    if (is.continuous.dist) {
      plot.object <- plot.object +
        geom_line(size = 2.5)
      y.label <- 'PDF/CDF'
    } else {
      plot.object <- plot.object +
        geom_point(size = 2.5)
      y.label <- 'PMF/CDF'
    }
    
    plot.object <- plot.object +
      scale_y_continuous(labels = scales::percent) +
      theme_classic() +
      labs(
        x = 'Values',
        y = y.label,
        title = dist.name,
        color = 'Legend'
      )
    
    return(plot.object)
  }
