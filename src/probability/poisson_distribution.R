PoissonDistribution <- function(lambda) {
  results <- list()
  
  results$description <-
    'TODO Raluca/Robert write here some text about this distribution from Wikipedia.'
  
  results$type <- 'discrete'
  
  results$mean <- lambda
  
  results$variance <- lambda
  
  results$median <- as.integer(lambda + 1 / 3 - 0.02 / lambda)
  
  if (lambda == as.integer(lambda)) {
    results$mode <-
      paste0(lambda - 1, ' and ', lambda)
  } else{
    results$mode <- as.integer(lambda)
  }
  
  results$skewness <- lambda ** (-1 / 2)
  
  results$excess_kurtosis <- lambda ** (-1)
  
  min.x <- 0
  max.x <- qpois(0.999, lambda)
  x <- min.x:max.x
  
  pmf <- dpois(x, lambda)
  results$plot_pmf <-
    PlotPdfOrPmf(x, pmf, 'Poisson distribution', FALSE)
  
  cdf <- ppois(x, lambda)
  results$plot_cdf <-
    PlotCdf(x, cdf, 'Poisson distribution', FALSE)
  
  return(results)
}
