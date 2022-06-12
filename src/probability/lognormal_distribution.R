LognormalDistribution <- function(miu, sigma) {
  results <- list()
  
  results$description <-
    'TODO Raluca/Robert write here some text about this distribution from Wikipedia.'
  
  results$type <- 'continuous'
  
  results$support <- c(min = 0, max = Inf)
  
  results$mean <- exp(miu + sigma ** 2 / 2)
  
  results$variance <- exp(2 * miu + 2 * sigma ** 2) - exp(2 * miu + sigma **
                                                            2)
  
  results$median <- exp(miu)
  
  results$mode <- exp(miu - sigma ** 2)
  
  results$skewness <- (exp(sigma ** 2) + 2) * sqrt(exp(sigma ** 2) - 1)
  
  results$excess_kurtosis <-
    exp(4 * sigma ** 2) + 2 * exp(3 * sigma ** 2) + 3 * exp(2 * sigma ** 2) -
    6
  
  min.x <- 0
  max.x <- qlnorm(0.999, miu, sigma)
  x <- seq(min.x, max.x, length.out = 10 ** 4)
  
  pdf <- dlnorm(x, miu, sigma)
  results$plot_pdf <- PlotPdfOrPmf(x, pdf, 'Lognormal distribution')
  
  cdf <- plnorm(x, miu, sigma)
  results$plot_cdf <- PlotCdf(x, cdf, 'Lognormal distribution')
  
  results$pdf <- function(x) {
    dlnorm(x, miu, sigma) %>%
      return()
  }
  
  return(results)
}
