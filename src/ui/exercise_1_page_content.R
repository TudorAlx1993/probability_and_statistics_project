Exercise1PageContent <- function() {
  fluid.page <- fluidPage(
    useShinyjs(),
    h1("Exercise 1", align = 'center'),
    br(),
    fileInput(
      'exercise_1_page_upload_button',
      label = 'Select the input csv file',
      multiple = FALSE,
      accept = '.csv',
      buttonLabel = "File upload"
    ),
    hidden(
      selectInput(
        'exercise_1_page_select_column_name',
        label = 'Select the column name',
        choices = ''
      )
    ),
    hidden(
      actionButton(
        'exercise_1_page_run_button',
        label = 'Run',
        icon = icon('play')
      )
    ),
    tags$br(),
    tags$br(),
    textOutput('exercise_1_page_summary_text'),
    verbatimTextOutput('exercise_1_page_summary_content'),
    tags$br(),
    plotOutput('exercise_1_page_histogram'),
    tags$br(),
    plotOutput('exercise_1_page_boxplot')
  )
  
  return(fluid.page)
}
