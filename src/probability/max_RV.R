mxV <- function(joint.rv) {
  
  max.pair <- function(a, b) {
    return(max(c(a, b)))
  }
  
  marg.1 <- marginal(joint.rv, 1)
  marg.2 <- marginal(joint.rv, 2)
  
  outcomes.1 <- outcomes(marg.1)
  outcomes.2 <- outcomes(marg.2)
  
  new.outcomes <- c(outer(outcomes.1, outcomes.2, Vectorize(max.pair)))
  new.probs <- probs(joint.rv)
  
  return(RV(new.outcomes, new.probs))
}