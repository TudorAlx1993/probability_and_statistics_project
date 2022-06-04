ExponentialDistribution <- function(lambda) {
  results <- list()
  
  results$description <-
    'TODO Raluca/Robert write here some text about this distribution from Wikipedia.'
  
  results$type <- 'continuous'
  
  results$mean <- 1 / lambda
  
  results$variance <- 1 / (lambda ** 2)
  
  results$median <- log(2) / lambda
  
  results$mode <- 0
  
  results$skewness <- 2
  
  results$excess_kurtosis <- 6
  
  min.x <- qexp(0, lambda)
  max.x <- qexp(0.999)
  x <- seq(min.x, max.x,length.out = 10**4)
  
  pdf <- dexp(x, lambda)
  results$plot_pdf <- PlotPdfOrPmf(x, pdf, 'Exponential distribution')
  
  cdf <- pexp(x, lambda)
  results$plot_cdf <- PlotCdf(x, cdf, 'Exponential distribution')
  
  return(results)
}
