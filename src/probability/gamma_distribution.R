GammaDistribution <- function(shape, scale) {
  results <- list()
  
  results$description <-
    'TODO Raluca/Robert write here some text about this distribution from Wikipedia.'
  
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
