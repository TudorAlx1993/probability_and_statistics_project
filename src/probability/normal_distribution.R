NormalDistribution <- function(mean, sigma) {
  results <- list()
  
  results$description <-
    'Distributia normala (cunoscuta si ca distributie Gauss , Gauss sau Laplace-Gauss ) este un tip de distributie continua de probabilitate pentru o variabila aleatorie cu valoare reala . Forma generala a functiei sale de densitate de probabilitate este:
Parametrul niu este media sau asteptarea distributiei (si, de asemenea, mediana si modul ei ), in timp ce parametrul sigma este abaterea sa standard . Varianta distributiei este sigma ^2.
Se spune ca o variabila aleatoare cu o distributie Gaussiana este distribuita normal si se numeste deviatie normala .
Distributiile normale sunt importante in statistica si sunt adesea folosite in stiintele naturale si sociale pentru a reprezenta variabile aleatoare cu valori reale ale caror distributii nu sunt cunoscute.
Importanta lor se datoreaza partial teoremei limitei centrale . Se afirma ca, in anumite conditii, media multor esantioane (observatii) ale unei variabile aleatoare cu medie si varianta finite este ea insasi o variabila aleatoare - a carei distributie converge catre o distributie normala pe masura ce numarul de esantioane creste. Prin urmare, marimile fizice care sunt de asteptat sa fie suma multor procese independente, cum ar fi erorile de masurare, au adesea distributii care sunt aproape normale.
in plus, distributiile gaussiene au unele proprietati unice care sunt valoroase in studiile analitice. De exemplu, orice combinatie liniara a unei colectii fixe de abateri normale este o abatere normala. Multe rezultate si metode, cum ar fi propagarea incertitudinii si ajustarea parametrilor celor mai mici patrate , pot fi derivate analitic in forma explicita atunci cand variabilele relevante sunt distribuite normal.
O distributie normala este uneori numita informal curba clopot . Cu toate acestea, multe alte distributii sunt in forma de clopot (cum ar fi distributiile Cauchy , t al lui Student si logistica ).
Distributia de probabilitate univariata este generalizata pentru vectorii din distributia normala multivariata si pentru matricele din distributia normala matriceala .'
  
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
