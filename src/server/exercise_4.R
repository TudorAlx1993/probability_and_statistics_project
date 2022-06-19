Exercise4 <- function(input, output) {
  # ## Formulas:
  # P(A or B) = P(A) + P(B) - P(A and B)
  # if independent: P(A and B) = P(A) * P(B)
  # if incompatible: P(A and B) = 0
  # P(A | B) = P(A and B) / P(B)
  # P(B | A) = P(A and B) / P(A)

  GetInputData <- reactive({
    req(input$exercise_4_page_input_a)
    a <- input$exercise_4_page_input_a
    
    req(input$exercise_4_page_input_b)
    b <- input$exercise_4_page_input_b
    
    if (input$exercise_4_page_input_interaction == 'unknown') {
      show('exercise_4_page_input_a_b')
      req(input$exercise_4_page_input_a_b)
      a_and_b <- input$exercise_4_page_input_a_b
      return(data.frame(a, b, a_and_b))
    }
    
    if (input$exercise_4_page_input_interaction == 'indep') {
      hide('exercise_4_page_input_a_b')
      a_and_b <- a * b
      return(data.frame(a, b, a_and_b))
    }
    
    if (input$exercise_4_page_input_interaction == 'incomp') {
      hide('exercise_4_page_input_a_b')
      a_and_b <- 0
      return(data.frame(a, b, a_and_b))
    }
  })
  observeEvent(GetInputData(), {
    show('exercise_4_page_action_button')
  })
  observeEvent(input$exercise_4_page_action_button, {
    data <- GetInputData()
    a <- data[,1][1]
    b <- data[,2][1]
    a_and_b <- data[,3][1]
    a_or_b <- a + b - a_and_b
    a_cond_b <- a_and_b / b
    b_cond_a <- a_and_b / a
    output$exercise_4_page_output_a_and_b <- renderText({
      a_and_b
      paste('P(A and B) =', a_and_b)
    })
    output$exercise_4_page_output_a_or_b <- renderText({
      a_or_b
      paste('P(A or B) =', a_or_b)
    })
    output$exercise_4_page_output_a_bar_b <- renderText({
      a_cond_b
      paste('P(A | B) =', a_cond_b)
    })
    output$exercise_4_page_output_b_bar_a <- renderText({
      b_cond_a
      paste('P(B | A) =', b_cond_a)
    })
  })
  
}