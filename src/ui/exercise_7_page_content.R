Exercise7PageContent <- function() {
  fluid.page <- fluidPage(
    useShinyjs(),
    h1("Exercise 7", align = 'center'),
    fileInput(
      'exercise_7_page_upload_a',
      label = 'Upload CSV file for RV A',
      multiple = FALSE,
      accept = '.csv',
      buttonLabel = "File upload"
    ),
    radioButtons(
      'exercise_7_page_operation',
      label = 'Operation',
      choices = c('+' = 'sum',
                  '-' = 'dif',
                  '*' = 'prod',
                  '/' = 'div'
      )
    ),
    fileInput(
      'exercise_7_page_upload_b',
      label = 'Upload CSV file for RV B',
      multiple = FALSE,
      accept = '.csv',
      buttonLabel = "File upload"
    ),
    hidden(
      actionButton('exercise_7_page_action_button',
                   'Run',
                   icon = icon('play')
      ) 
    ),
    tags$br(),
    tags$br(),
    plotOutput('exercise_7_page_RV_plot')
  )
  return (fluid.page)
}