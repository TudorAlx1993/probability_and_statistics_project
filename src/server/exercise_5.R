Exercise5 <- function(input, output) {
  GetInputData <- reactive({
    req(input$exercise_5_page_upload_button)
    file <- input$exercise_5_page_upload_button
    if (!all(file_ext(file$name) == 'csv')) {
      showNotification("You must choose a csv file!", type = 'error')
      return(NULL)
    }
    
    csv.data <- read.csv(file$datapath)
    
    # req(input$exercise_5_page_start)
    start_pos <- input$exercise_5_page_start
    
    # hide the previous output if another csv file is loaded
    hide('exercise_5_page_RV_plot')
    
    return(list(csv.data, start_pos))
  })
  # observeEvent(input$exercise_5_page_upload_button, {
  #   req(input$exercise_5_page_upload_button)
  #   file <- input$exercise_5_page_upload_button
  #   showNotification("TEST", type = 'error')
  # })
  observeEvent(GetInputData(), {
    data <- GetInputData()
    if (is.null(data[1])) {
      return(NULL)
    }
    showNotification("GET INPUT")
    updateNumericInput(inputId = 'exercise_5_page_start',
                       label = 'Starting position',
                       value = NULL,
                       min = 0,
                       max = length(data[1]),
                       step = 1)
    show('exercise_5_page_start')
    show('exercise_5_page_action_button')
  })
  observeEvent(input$exercise_5_page_action_button, {
    showNotification("Run button")
    data <- GetInputData()
    file.data <- data[1]
    start.pos <- data[2]
    output$exercise_5_page_RV_plot <- plot(read.RV(file.data))
    show('exercise_5_page_RV_plot')
    
    # column.name <- input$exercise_1_page_select_column_name
    # 
    # data.as.vector <- data[, column.name] %>%
    #   as.vector() %>%
    #   na.omit()
    # output$exercise_1_page_summary_text <-
    #   renderText({
    #     'Statistics summary:'
    #   })
    # output$exercise_1_page_summary_content <-
    #   renderPrint({
    #     summary(data.as.vector)
    #   })
    # 
    # histogram <- PlotHistogram(data, column.name)
    # output$exercise_1_page_histogram <- renderPlot({
    #   histogram
    # })
    # 
    # box.plot <- BoxPlot(data, column.name)
    # output$exercise_1_page_boxplot <- renderPlot({
    #   box.plot
    # })
    # 
    # # show the outputs
    # show('exercise_1_page_run_button')
    # show('exercise_1_page_summary_text')
    # show('exercise_1_page_summary_content')
    # show('exercise_1_page_histogram')
    # show('exercise_1_page_boxplot')
  })
}