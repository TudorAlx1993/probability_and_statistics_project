Exercise8PageContent <- function() {
  fluid.page <- fluidPage(
    useShinyjs(),
    h1("Exercise 8", align = 'center'),
    h2("Transformation of discrete random variable", align = 'center'),
    fileInput(
      'exercise_8_page_upload_rv',
      label = 'Upload CSV file for discrete random variable X',
      multiple = FALSE,
      accept = '.csv',
      buttonLabel = "File upload"
    ),
    textInput(
      'exercise_8_page_transformation_function',
      label = 'Transformation function g(X)',
      placeholder = 'X^2'
    ),
    hidden(
      actionButton('exercise_8_page_action_button',
                   'Run',
                   icon = icon('play')
      ) 
    ),
    plotOutput('exercise_8_page_transformation_plot')
  )}