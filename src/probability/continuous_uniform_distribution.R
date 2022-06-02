ContinuousUniformDistribution <- function(a, b) {
  results <- list()
  
  results$description <-
    'TODO Raluca/Robert write here some text about this distribution from Wikipedia.'
  
  results$type <- 'continuous'
  
  results$mean <- (a + b) / 2
  
  results$variance <- ((b - a) ** 2) / 12
  
  results$median <- (a + b) / 2
  
  results$mode <- paste0('Any value within (', a, ',', b, ')')
  
  results$skewness <- 0
  
  results$excess_kurtosis <- -6 / 5
  
  min.x <-  a
  max.x <-  b
  # for plot scaling
  min.x<-min.x - (b-a)/2
  max.x<-max.x + (b-a)/2
  
  x <- seq(min.x, max.x, length.out = 10 ** 4)
  
  pdf <- dunif(x, a, b)
  results$plot_pdf <-
    PlotPdfOrPmf(x, pdf, 'Continuous uniform distribution')
  
  cdf <- punif(x, a, b)
  results$plot_cdf <-
    PlotCdf(x, cdf, 'Continuous uniform distribution')
  
  return(results)
}
