read.RV <- function(file_data) {
  data_outcomes <- file_data[,1]
  data_probs <- file_data[,2]
  return(RV(outcomes = data_outcomes, probs = data_probs))
}