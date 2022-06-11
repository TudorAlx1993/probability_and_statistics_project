jointRVFromRVs <- function(X, Y) {
  # showNotification(toString(unlist(t(outer(probs(X), probs(Y), FUN = "*")))))
  # Sys.sleep(3)
  f <- function(a,b) {
    a * b
  }
  joint.probs <- unlist((t(outer(unlist(probs(X)), unlist(probs(Y)), FUN = Vectorize(f)))))
  showNotification(toString(joint.probs))
  Sys.sleep(3)
  return(jointRVFromInput(outcomes(X), outcomes(Y), joint.probs))
}