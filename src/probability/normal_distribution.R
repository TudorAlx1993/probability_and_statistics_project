NormalDistribution <- function(mean, sigma) {
  results <- list()
  
  results$description <-
    'TODO Raluca/Robert write here some text about this distribution from Wikipedia.'
  
  results$type <- 'continuous'
  
  results$support <- c(min = -Inf, max = Inf)
  
  results$mean <- mean
  
  results$variance <- sigma ** 2
  
  results$median <- mean
  
  results$mode <- mean
  
  results$skewness <- 0
  
  results$excess_kurtosis <- 0
  
  min.x <- (mean - 3 * sigma) * 1.1
  max.x <- (mean + 3 * sigma) * 1.1
  x <- seq(min.x, max.x, length.out = 10 ** 4)
  
  pdf <- dnorm(x, mean, sigma)
  results$plot_pdf <- PlotPdfOrPmf(x, pdf, 'Normal distribution')
  
  cdf <- pnorm(x, mean, sigma)
  results$plot_cdf <- PlotCdf(x, cdf, 'Normal distribution')
  
  results$pdf <- function(x) {
    dnorm(x, mean = mean, sd = sigma) %>%
      return()
  }
  
  return(results)
}
