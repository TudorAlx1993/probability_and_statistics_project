Exercise9PageContent <- function() {
  fluid.page <- fluidPage(
    useShinyjs(),
    h1("Exercise 9", align = 'center'),
    h2("Transformation of joint random variable distribution", align = 'center'),
    fileInput(
      'exercise_9_page_upload_values_x',
      label = 'Upload CSV file for values of discrete random variable X',
      multiple = FALSE,
      accept = '.csv',
      buttonLabel = "File upload"
    ),
    fileInput(
      'exercise_9_page_upload_values_y',
      label = 'Upload CSV file for values of discrete random variable Y',
      multiple = FALSE,
      accept = '.csv',
      buttonLabel = "File upload"
    ),
    fileInput(
      'exercise_9_page_upload_probs',
      label = 'Upload CSV file for probabilities of joint random variable XandY',
      multiple = FALSE,
      accept = '.csv',
      buttonLabel = "File upload"
    ),
    textInput(
      'exercise_9_page_function_g',
      label = 'Function g(XandY)',
      placeholder = '3 * marginal(XandY,1)'
    ),
    textInput(
      'exercise_9_page_function_h',
      label = 'Function h(XandY)',
      placeholder = 'marginal(XandY,2)^2'
    ),
    hidden(
      actionButton('exercise_9_page_action_button',
                   'Run',
                   icon = icon('play')
      ) 
    ),
    verbatimTextOutput('exercise_9_page_output')
  )}