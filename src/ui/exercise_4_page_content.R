Exercise4PageContent <- function() {
  fluid.page <- fluidPage(
    useShinyjs(),
    h1("Exercise 4", align = 'center'),
    h2("Work with events", align = "center"),
    # ## TODO: inputs:
    # P(A)
    # P(B)
    # P(A and B)
    # P(A or B)
    # P(A|B)
    # P(B|A)
    
    # output:
    #   P(A)
    # P(B)
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
      'exercise_4_page_input_interaction', ## TODO better name?
      label = 'Event interaction',
      choices = c('Unknown' = 'unknown',
                  'Independent' = 'indep',
                  'Incompatible' = 'incomp'
                  )
    ),
    numericInput(
      'exercise_4_page_input_a_and_b',
      label = 'P(A and B)',
      value=NULL,
      min = 0,
      max = 1,
      step = 0.1
    ),
    numericInput(
      'exercise_4_page_input_a_or_b',
      label = 'P(A or B)',
      value=NULL,
      min = 0,
      max = 1,
      step = 0.1
    ),
    numericInput(
      'exercise_4_page_input_a_cond_b',
      label = 'P(A|B)',
      value=NULL,
      min = 0,
      max = 1,
      step = 0.1
    ),
    numericInput(
      'exercise_4_page_input_b_cond_a',
      label = 'P(B|A)',
      value=NULL,
      min = 0,
      max = 1,
      step = 0.1
    ),
    actionButton('exercise_4_page_action_button',
                 'Run',
                 icon = icon('play')
                 ),
    tags$br(),
    tags$br(),
    textOutput('exercise_4_page_output_a'),
    textOutput('exercise_4_page_output_b'),
    textOutput('exercise_4_page_output_a_and_b'),
    textOutput('exercise_4_page_output_a_or_b'),
    textOutput('exercise_4_page_output_a_minus_b'),
    textOutput('exercise_4_page_output_b_minus_a'),
  )
  return (fluid.page)
}