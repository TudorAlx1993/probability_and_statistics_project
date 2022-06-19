ContinuousUniformDistribution <- function(a, b) {
  results <- list()
  
  results$description <-
    'Distributia uniforma continua sau distributia dreptunghiulara este o familie de distributii de probabilitate simetrice.
    Distributia descrie un experiment în care exista un rezultat arbitrar care se afla între anumite limite.Limitele sunt definite de parametrii, a si b , care sunt valorile minime si maxime.Intervalul poate fi fie închis (de ex. [a, b]) fie deschis (de ex. (a, b)).
    Prin urmare, distributia este adesea prescurtata U ( a ,b ), unde U reprezinta distributia uniforma.
  Diferenta dintre limite defineste lungimea intervalului; toate intervalele de aceeasi lungime pe suportul distributiei sunt la fel de probabile. Este distributia de probabilitate maxima a entropiei pentru o variabila aleatoare X sub nicio alta constrangere decat aceea care este continuta în suportul distributiei'
  
  results$type <- 'continuous'
  
  results$support <- c(min = a, max = b)
  
  results$mean <- (a + b) / 2
  
  results$variance <- ((b - a) ** 2) / 12
  
  results$median <- (a + b) / 2
  
  results$mode <- paste0('Any value within (', a, ',', b, ')')
  
  results$skewness <- 0
  
  results$excess_kurtosis <- -6 / 5
  
  min.x <-  a
  max.x <-  b
  # for plot scaling
  min.x<-min.x - (b-a)/2
  max.x<-max.x + (b-a)/2
  
  x <- seq(min.x, max.x, length.out = 10 ** 4)
  
  pdf <- dunif(x, a, b)
  results$plot_pdf <-
    PlotPdfOrPmf(x, pdf, 'Continuous uniform distribution')
  
  cdf <- punif(x, a, b)
  results$plot_cdf <-
    PlotCdf(x, cdf, 'Continuous uniform distribution')
  
  results$pdf <- function(x) {
    dunif(x,a,b) %>%
      return()
  }
  
  return(results)
}
