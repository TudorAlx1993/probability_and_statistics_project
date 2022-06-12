BinomialDistribution <- function(n, p) {
  q <- 1 - p
  
  results <- list()
  
  results$description <-
    'TODO Raluca/Robert write here some text about this distribution from Wikipedia.'
  
  results$type <- 'discrete'
  
  results$support <- c(min = 0, max = n)
  
  results$mean <- n * p
  
  results$variance <- n * p * q
  
  results$median <- qbinom(0.5, n, p)
  
  results$mode <- as.integer((n + 1) * p)
  
  results$skewness <- (q - p) / sqrt(n * p * q)
  
  results$excess_kurtosis <- (1 - 6 * p * q) / (n * p * q)
  
  min.x <- 0
  max.x <- qbinom(1, n, p)
  x <- min.x:max.x
  
  pmf <- dbinom(x, n, p)
  results$plot_pmf <-
    PlotPdfOrPmf(x, pmf, 'Binomial distribution', FALSE)
  
  cdf <- pbinom(x, n, p)
  results$plot_cdf <-
    PlotCdf(x, cdf, 'Binomial distribution', FALSE)
  
  results$pmf <- function(x) {
    dbinom(x,n,p) %>%
      return()
  }
  
  return(results)
}
