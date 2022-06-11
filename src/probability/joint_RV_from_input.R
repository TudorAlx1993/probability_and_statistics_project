jointRVFromInput <- function(x.vals, y.vals, input.probs) {
  return(jointRV(outcomes = list(x.vals, y.vals), input.probs))
}