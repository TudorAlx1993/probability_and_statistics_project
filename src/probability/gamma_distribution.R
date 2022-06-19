GammaDistribution <- function(shape, scale) {
  results <- list()
  
  results$description <-
    'Distributia gamma este o familie cu doi parametri de distributii continue de probabilitate . Distributia exponentiala , distributia Erlang si distributia chi-patrat sunt cazuri speciale ale distributiei gamma. Exista doua parametrizari diferite de uz comun:
Cu un parametru de forma k si un parametru de scara theta .
Cu un parametru de forma alfa = k si un parametru de scara inversa beta = 1/ theta , numit parametru de rata .
In fiecare dintre aceste forme, ambii parametri sunt numere reale pozitive.
Distributia gamma este distributia maxima a probabilitatii de entropie (atat in raport cu o masura de baza uniforma, cat si in raport cu o masura de baza 1/ x ) pentru o variabila aleatoare X pentru care E [ X ] = k * theta = alfa / beta este fix si mai mare decat zero, iar E [ln( X )] = psi ( k ) + ln( theta ) = psi ( alfa ) - ln( beta ) este fix ( psi este functia digamma )'
  
  results$type <- 'continuous'
  
  results$support <- c(min = 0, max = Inf)
  
  results$mean <- shape*scale
  
  results$variance <- shape*scale**2
  
  # no simple closed form
  results$median <-qgamma(0.5,shape,scale = scale)
  
  if(shape>=1){
    results$mode<-(shape-1)*scale
  }else{
    results$mode<-0
  }
  
  results$skewness <-2/sqrt(shape)
  
  results$excess_kurtosis <-6/shape
  
  min.x <- 0
  max.x <- qgamma(0.999,shape,scale=scale)
  x <- seq(min.x, max.x, length.out = 10 ** 4)
  
  pdf <- dgamma(x,shape,scale=scale)
  results$plot_pdf <-
    PlotPdfOrPmf(x, pdf, 'Gamma distribution')
  
  cdf <- pgamma(x,shape,scale=scale)
  results$plot_cdf <-
    PlotCdf(x, cdf, 'Gamma distribution')
  
  results$pdf <- function(x) {
    dgamma(x,shape,scale = scale) %>%
      return()
  }
  
  return(results)
}
