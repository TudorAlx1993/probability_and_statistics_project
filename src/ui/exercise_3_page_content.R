Exercise3PageContent <- function() {
  fluid.page <- fluidPage(
    useShinyjs(),
    h1("Exercise 3", align = 'center'),
    h2("Analysis of joint distribution", align = 'center'),
    fileInput(
      'exercise_3_page_upload_values_x',
      label = 'Upload CSV file for values of discrete random variable X',
      multiple = FALSE,
      accept = '.csv',
      buttonLabel = "File upload"
    ),
    fileInput(
      'exercise_3_page_upload_values_y',
      label = 'Upload CSV file for values of discrete random variable Y',
      multiple = FALSE,
      accept = '.csv',
      buttonLabel = "File upload"
    ),
    fileInput(
      'exercise_3_page_upload_probs',
      label = 'Upload CSV file for probabilities of joint random variable XandY',
      multiple = FALSE,
      accept = '.csv',
      buttonLabel = "File upload"
    ),
    hidden(
      actionButton(
        'exercise_3_page_run_button',
        label = 'Run',
        icon = icon('play')
      ),
      plotOutput('exercise_3_page_output_x'),
      plotOutput('exercise_3_page_output_y'),
      textOutput('exercise_3_page_output_x_average'),
      textOutput('exercise_3_page_output_y_average'),
      textOutput('exercise_3_page_output_x_dispersion'),
      textOutput('exercise_3_page_output_y_dispersion'),
      textOutput('exercise_3_page_output_x_y_covariance'),
      textOutput('exercise_3_page_output_x_y_correlation_coefficient')
    ),
  )
  return(fluid.page)
}