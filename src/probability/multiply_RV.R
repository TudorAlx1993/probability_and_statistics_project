MultiplyRV <- function(A, B) {
  # https://stackoverflow.com/questions/61479740/product-of-two-random-variables-in-r-using-the-discreterv-package
  product.matrix <- t(outer(outcomes(A),outcomes(B),"*")) ## find all possible products
  probability.matrix <- t(outer(probs(A), probs(B)))
  unique.products <- unique(as.vector(product.matrix))  ## find the unique products
  probability.vector <- rep(0, length(unique.products))
  
  for(i in 1:length(probability.vector)){
    
    z <- unique.products[i]
    
    indices <- which(as.vector(product.matrix) == z) ## find which elements of product.matrix match up to z
    
    probability.vector[i] <- sum(as.vector(probability.matrix)[indices]) ## sum their probabilities
    
  }
  
  XtimesY <- RV(outcomes = unique.products, probs = probability.vector) ## store as RV
}