PoissonDistribution <- function(lambda) {
  results <- list()
  
  results$description <-
    'Distributia Poisson este o distributie de probabilitate discreta care exprima probabilitatea ca un anumit numar de evenimente sa aiba loc intr-un interval fix de timp sau spatiu, daca aceste evenimente au loc cu o rata medie constanta cunoscuta si independent de timpul de la ultimul eveniment.
    Este numit dupa matematicianul francez Simeon Denis Poisson.Distributia Poisson poate fi utilizata si pentru numarul de evenimente din alte tipuri de intervale specificate, cum ar fi distanta, suprafata sau volumul.
De exemplu, un call center primeste in medie 180 de apeluri pe ora, 24 de ore pe zi. Apelurile sunt independente; primirea unuia nu modifica probabilitatea cand va sosi urmatorul. Numarul de apeluri primite in orice minut are o distributie de probabilitate Poisson: cele mai probabile numere sunt 2 si 3, dar 1 si 4 sunt, de asemenea, probabile si exista o probabilitate mica ca acesta sa fie la fel de mic ca zero si o probabilitate foarte mica sa fie posibil. 10.
  Un alt exemplu este numarul de evenimente de dezintegrare care au loc de la o sursa radioactiva in timpul unei perioade de observare definite.'
  
  results$type <- 'discrete'
  
  # trick for max value of a Poisson distribution
  # the value of max is needed only for exercise 10
  # exercise 10 requires summation when evaluation the expected value of g(X)
  # the supported domain for Poisson distribution is N (which is an infinite set) and we can't do summation on N
  # thus we take the max value as the last integer (with an associated probability>0) than can be generated by R
  # in order to make sure that we really considered all possible values (with an associated probability>0) we raise the results to the power of 2
  results$support <-
    c(
      min = 0,
      max = qpois(1 - .Machine$double.eps ** 0.25, lambda) ** 2 %>% as.integer()
    )
  
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
  
  results$pmf <- function(x) {
    # if x is not an natural number then dpois(x,lambda) return 0 as expected, but with an warning
    # suppressWarnings removes the warning while keeping the returned value
    dpois(x, lambda) %>%
      suppressWarnings() %>%
      return()
  }
  
  return(results)
}
