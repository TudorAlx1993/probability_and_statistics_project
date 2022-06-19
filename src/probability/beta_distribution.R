BetaDistribution <- function(alfa, beta) {
  results <- list()
  
  results$description <-
    'Distributia beta este o familie de distributii continue de probabilitate definite pe intervalul [0, 1] parametrizate de doi parametri pozitivi, notati cu alfa si beta, care apar ca exponenti ai variabilei aleatoare si controleaza forma distributiei.
  Distributia beta a fost aplicata pentru a modela comportamentul variabilelor aleatoare limitate la intervale de lungime finita într-o mare varietate de discipline.'
  
  results$type <- 'continuous'
  
  results$support <- c(min = 0, max = 1)
  
  results$mean <- alfa / (alfa + beta)
  
  results$variance <- (alfa * beta) / ((alfa + beta) ** 2 * (alfa + beta +1))
  
  if (alfa > 1 & beta > 1) {
    results$median <- (alfa - 1 / 3) / (alfa + beta - 2 / 3)
  } else{
    # there is no closed form solution
    results$median <- qbeta(0.5,alfa,beta)
  }
  
  if (alfa > 1 & beta > 1) {
    results$mode <- (alfa - 1) / (alfa + beta - 2)
  }
  if (alfa == 1 & beta == 1) {
    results$mode <- 'any value within (0,1)'
  }
  if (alfa < 1 & beta < 1) {
    results$mode <- '0 and 1'
  }
  if (alfa <= 1 & beta > 1) {
    results$mode <- 0
  }
  if (alfa > 1 & beta <= 1) {
    results$mode <- 1
  }
  
  results$skewness <-
    (2 * (beta - alfa) * sqrt(alfa + beta + 1)) / ((alfa + beta + 2) * sqrt(alfa *beta))
  
  results$excess_kurtosis <-
    6 * ((alfa - beta) ** 2 * (alfa + beta + 1) - alfa * beta * (alfa + beta + 2)) / (alfa * beta * (alfa + beta + 2) * (alfa + beta + 3))
  
  min.x <- 0
  max.x <- 1
  x <- seq(min.x, max.x, length.out = 10 ** 4)
  
  pdf <- dbeta(x,alfa,beta)
  results$plot_pdf <-
    PlotPdfOrPmf(x, pdf, 'Beta distribution')
  
  cdf <- pbeta(x,alfa,beta)
  results$plot_cdf <-
    PlotCdf(x, cdf, 'Beta distribution')
  
  results$pdf <- function(x) {
    dbeta(x,alfa,beta) %>%
      return()
  }
  
  return(results)
}
