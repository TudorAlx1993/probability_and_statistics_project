LognormalDistribution <- function(miu, sigma) {
  results <- list()
  
  results$description <-
    'O distributie lognormala este o distributie continua de probabilitate a unei variabile aleatoare al carei logaritm este distribuit normal . Astfel, daca variabila aleatoare X este log-normal distribuita, atunci Y = ln( X ) are o distributie normala.
    În mod echivalent, daca Y are o distributie normala, atunci functia exponentiala a lui Y , X = exp( Y ), are o distributie log-normala.
    O variabila aleatoare care este distribuita log-normal ia doar valori reale pozitive. Este un model convenabil si util pentru masuratori în stiinte exacte si inginerie , precum si în medicina , economie si alte subiecte (de exemplu, energii, concentratii, lungimi, preturi ale instrumentelor financiare si alte metrici).
Distributia este denumita ocazional distributia Galton sau distributia lui Galton , dupa Francis Galton .Distributia log-normala a fost asociata si cu alte nume, cum ar fi McAlister, Gibrat si Cobb-Douglas .
Un proces log-normal este realizarea statistica a produsului multiplicativ al multor variabile aleatoare independente , fiecare dintre acestea fiind pozitiva. Acest lucru este justificat prin luarea în considerare a teoremei limitei centrale în domeniul log (numit uneori legea lui Gibrat ). Distributia log-normala este distributia maxima a probabilitatii de entropie pentru o variabila aleatorie X - pentru care sunt specificate media si varianta lui ln( X ) .'
  
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
