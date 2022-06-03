Exercise5PageContent <- function() {
  fluid.page <- fluidPage(
    useShinyjs(),
    h1("Exercise 5", align = 'center'),
    fileInput(
      'exercise_5_page_upload_button',
      label = 'Upload CSV file for random variable',
      multiple = FALSE,
      accept = '.csv',
      buttonLabel = "File upload"
    ),
    hidden(
      numericInput(
        'exercise_5_page_start',
        label = 'Starting position',
        value = NULL,
        min = 0,
        step = 1
      )
    ),
    hidden(
      actionButton('exercise_5_page_action_button',
                   'Run',
                   icon = icon('play')
      ) 
    ),
    tags$br(),
    tags$br(),
    plotOutput('exercise_5_page_RV_plot')
  )
  return (fluid.page)
}