Exercise4PageContent <- function() {
  fluid.page <- fluidPage(
    useShinyjs(),
    h1("Exercise 4", align = 'center'),
    h2("Work with events", align = "center"),
    # inputs:
    # P(A)
    # P(B)
    # P(A and B) if unknown
    
    # output:
    # P(A and B)
    # P(A or B)
    # P(A-B)
    # P(B|A)
    numericInput(
      'exercise_4_page_input_a',
      label = 'P(A)',
      value = NULL,
      min = 0,
      max = 1,
      step = 0.1
    ),
    numericInput(
      'exercise_4_page_input_b',
      label = 'P(B)',
      value=NULL,
      min = 0,
      max = 1,
      step = 0.1
    ),
    radioButtons(
      'exercise_4_page_input_interaction', 
      label = 'Event interaction',
      choices = c('Unknown' = 'unknown',
                  'Independent' = 'indep',
                  'Incompatible' = 'incomp'
                  )
    ),
    hidden(
      numericInput(
        'exercise_4_page_input_a_b',
        label = 'P(A and B)',
        value=NULL,
        min = 0,
        max = 1,
        step = 0.1
      )
    ),
    hidden(
      actionButton('exercise_4_page_action_button',
                   'Run',
                   icon = icon('play')
      )
    ),
    tags$br(),
    tags$br(),
    textOutput('exercise_4_page_output_a_and_b'),
    textOutput('exercise_4_page_output_a_or_b'),
    textOutput('exercise_4_page_output_a_bar_b'),
    textOutput('exercise_4_page_output_b_bar_a'),
  )
  return (fluid.page)
}