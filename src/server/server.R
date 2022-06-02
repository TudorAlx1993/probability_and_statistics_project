Server <- function(input, output) {
  # hide graphical elements that should not be visible when program starts
  HideGraphicalElements() %>% 
    invisible()
  
  # server code for exercise 1
  Exercise1(input, output) %>%
    invisible()
  
  # server code for exercise 2
  Exercise2(input, output) %>%
    invisible()
  
}