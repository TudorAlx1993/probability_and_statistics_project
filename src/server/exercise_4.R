Exercise4 <- function(input, output) {
  # ## Formulas:
  # P(A or B) = P(A) + P(B) - P(A and B)
  # if independent: P(A and B) = P(A) * P(B)
  # P(A - B) = P(A and B) / P(B)
  # P(B - A) = P(A and B) - P(A)

  # ## ALGORITHM:
  # LOOP: while true, for each of 3/4 equations, count how many variables in the equation are not null;
  # if all are fully solved, output solution and break;
  # if none have only one probability left to solve, break => cannot solve
  # solve for missing probability in one of the equations
  # repeat
  
  # return(NULL) 
}