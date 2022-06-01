Exercise1 <- function(input, output) {
  GetInputData <- reactive({
    req(input$exercise_1_page_upload_button)
    file <- input$exercise_1_page_upload_button
    
    if (!all(file_ext(file$name) == 'csv')) {
      showNotification("You must choose a csv file!", type = 'error')
      return(NULL)
    }
    
    data <- read.csv(file$datapath)
    
    # hide the previous outputs if another csv file is loaded
    hide('exercise_1_page_run_button')
    hide('exercise_1_page_summary_text')
    hide('exercise_1_page_summary_content')
    hide('exercise_1_page_histogram')
    hide('exercise_1_page_boxplot')
    
    return(data)
  })
  
  observeEvent(GetInputData(), {
    data <- GetInputData()
    if (is.null(data)) {
      return(NULL)
    }
    
    updateSelectInput(inputId = 'exercise_1_page_select_column_name',
                      choices = colnames(data),
                      selected = NA)
    show('exercise_1_page_select_column_name')
  })
  
  observeEvent(input$exercise_1_page_select_column_name, {
    if (!all(input$exercise_1_page_select_column_name == '')) {
      show('exercise_1_page_run_button')
    }
  })
  
  observeEvent(input$exercise_1_page_run_button, {
    data <- GetInputData()
    column.name <- input$exercise_1_page_select_column_name
    
    data.as.vector <- data[, column.name] %>%
      as.vector() %>%
      na.omit()
    output$exercise_1_page_summary_text <-
      renderText({
        'Statistics summary:'
      })
    output$exercise_1_page_summary_content <-
      renderPrint({
        summary(data.as.vector)
      })
    
    histogram <- PlotHistogram(data, column.name)
    output$exercise_1_page_histogram <- renderPlot({
      histogram
    })
    
    box.plot <- BoxPlot(data, column.name)
    output$exercise_1_page_boxplot <- renderPlot({
      box.plot
    })
    
    # show the outputs
    show('exercise_1_page_run_button')
    show('exercise_1_page_summary_text')
    show('exercise_1_page_summary_content')
    show('exercise_1_page_histogram')
    show('exercise_1_page_boxplot')
  })
}