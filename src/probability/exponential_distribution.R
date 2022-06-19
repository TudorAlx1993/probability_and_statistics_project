ExponentialDistribution <- function(lambda) {
  results <- list()
  
  results$description <-
    'Distributia exponentiala este distributia de probabilitate a timpului dintre evenimente intr-un proces punctual Poisson , adica un proces in care evenimentele au loc continuu si independent la o rata medie constanta. Este un caz particular al distributiei gamma.Este analogul continuu al distributiei geometrice si are proprietatea cheie de a nu avea memorie .
    Pe langa faptul ca este utilizat pentru analiza proceselor punctuale Poisson, se gaseste in diverse alte contexte.
Distributia exponentiala nu este aceeasi cu clasa familiilor exponentiale de distributii, care este o clasa mare de distributii de probabilitate care include distributia exponentiala ca unul dintre membrii sai, dar include si distributia normala , distributia binomiala , distributia gamma , Poisson , si multe altele.'
  
  results$type <- 'continuous'
  
  results$support <- c(min = 0, max = Inf)
  
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
  
  results$pdf <- function(x) {
    dexp(x,lambda) %>%
      return()
  }
  
  return(results)
}
