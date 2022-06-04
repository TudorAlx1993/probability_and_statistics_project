Exercise7 <- function(input, output) {
  GetInputData <- reactive({
    req(input$exercise_7_page_upload_a)
    a.file <- input$exercise_7_page_upload_a
    if (!all(file_ext(a.file$name) == 'csv')) {
      showNotification("A: You must choose a csv file!", type = 'error')
      return(NULL)
    }
    
    a.csvdata <- read.csv(a.file$datapath)
    if (!ncol(a.csvdata) == 2) {
      showNotification("A: File must contain 2 columns, outcomes and probabilities!", type = 'error')
      return(NULL)
    }
    
    if (!sum(a.csvdata[,2]) == 1) {
      showNotification("A: Sum of probabilities must equal 1!", type = 'error')
      return(NULL)
    }
    
    req(input$exercise_7_page_upload_b)
    b.file <- input$exercise_7_page_upload_b
    if (!all(file_ext(b.file$name) == 'csv')) {
      showNotification("B: You must choose a csv file!", type = 'error')
      return(NULL)
    }
    
    b.csvdata <- read.csv(b.file$datapath)
    if (!ncol(b.csvdata) == 2) {
      showNotification("B: File must contain 2 columns, outcomes and probabilities!", type = 'error')
      return(NULL)
    }
    
    if (!sum(b.csvdata[,2]) == 1) {
      showNotification("B: Sum of probabilities must equal 1!", type = 'error')
      return(NULL)
    }
    
    operation <- input$exercise_7_page_operation
    return(data.frame(a.csvdata[,1], a.csvdata[,2], b.csvdata[,1], b.csvdata[,2], operation))
  })
  # toListen <- reactive({
  #   list(input$exercise_7_page_upload_a,input$exercise_7_page_upload_b)
  # })
  observeEvent(GetInputData(), {
    show('exercise_7_page_action_button')
  })
  observeEvent(input$exercise_7_page_action_button, {
    data <- GetInputData()
    a.outcomes <- data[,1]
    a.probs <- data[,2]
    b.outcomes <- data[,3]
    b.probs <- data[,4]
    operation <- data[,5][1]
    a.rv <- RV(a.outcomes, a.probs)
    b.rv <- RV(b.outcomes, b.probs)
    result <- switch(
      operation,
      'sum'= a.rv + b.rv,
      'dif'= a.rv - b.rv,
      'prod'= MultiplyRV(a.rv, b.rv), ## discreteRV doesn't support RV multiplication, thus improvised solution in src.utils
      'div'= a.rv / b.rv
    )
    output$exercise_7_page_RV_plot <- renderPlot({
      plot(result)
    })
    show('exercise_7_page_RV_plot')
  })
}