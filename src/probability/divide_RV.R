DivideRV <- function(A, B) {
  division.result <- A / B
  result <- RV(outcomes(division.result), probs(division.result))
  return(result)
}