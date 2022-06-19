BinomialDistribution <- function(n, p) {
  q <- 1 - p
  
  results <- list()
  
  results$description <-
    'Distributia binomiala cu parametrii n si p este distributia de probabilitate discreta a numarului de succese intr-o succesiune de n experimente independente , fiecare punand o intrebare da-nu si fiecare cu propriul rezultat cu valoare booleana : succes (cu probabilitate p ) sau esec (cu probabilitate q  = 1 −  p ). Un singur experiment de succes/esec este numit si un proces Bernoulli sau experimentul Bernoulli, iar o secventa de rezultate se numeste proces Bernoulli ; pentru o singura incercare, adica n  = 1, distributia binomiala este o distributie Bernoulli .
    Distributia binomiala este baza pentru popularul test binomial de semnificatie statistica .
    Distributia binomiala este frecvent utilizata pentru a modela numarul de succese dintr-un esantion de marime n extras cu inlocuire dintr-o populatie de marime N . Daca esantionarea este efectuata fara inlocuire, extragerile nu sunt independente si astfel distributia rezultata este o distributie hipergeometrica , nu una binomiala. Cu toate acestea, pentru N mult mai mare decat n , distributia binomiala ramane o aproximare buna si este utilizata pe scara larga.'
  
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
