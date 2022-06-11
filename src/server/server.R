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
  
  # server code for exercise 3
  Exercise3(input, output) %>%
    invisible()
  
  # server code for exercise 4
  Exercise4(input, output) %>%
    invisible()
  
  # server code for exercise 5
  Exercise5(input, output) %>%
    invisible()
  
  # server code for exercise 6
  Exercise6(input, output) %>%
    invisible()
  
  # server code for exercise 7
  Exercise7(input, output) %>%
    invisible()

  # server code for exercise 8
  Exercise8(input, output) %>%
    invisible()

  # server code for exercise 9
  Exercise9(input, output) %>%
    invisible()

  # # server code for exercise 10
  # Exercise10(input, output) %>%
  #   invisible()
}