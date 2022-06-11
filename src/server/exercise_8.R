Exercise8 <- function(input, output) {
  GetInputData <- reactive({
    req(input$exercise_8_page_upload_rv)
    file <- input$exercise_8_page_upload_rv
    if (!all(file_ext(file$name) == 'csv')) {
      showNotification("You must choose a csv file!", type = 'error')
      return(NULL)
    }
    
    csv.data <- read.csv(file$datapath)
    if (!ncol(csv.data) == 2) {
      showNotification("File must contain 2 columns, outcomes and probabilities!", type = 'error')
      return(NULL)
    }
    
    if (!sum(csv.data[,2]) == 1) {
      showNotification("Sum of probabilities must equal 1!", type = 'error')
      return(NULL)
    }
    
    file.csvdata <- read.csv(file$datapath)
    # hide the previous output if another csv file is loaded
    hide('exercise_8_page_transformation_plot')
    req(input$exercise_8_page_transformation_function)
    transformation <- input$exercise_8_page_transformation_function
    return(data.frame(csv.data[,1], csv.data[,2], transformation))
  })
  
  observeEvent(GetInputData(), {
    show('exercise_8_page_action_button')
  })
  observeEvent(input$exercise_8_page_action_button, {
    data <- GetInputData()
    input.outcomes <- data[,1]
    input.probs <- data[,2]
    input.transformation <- data[,3][1]
    body(body)
    g <- function(X) {}
    body(g) <- parse(text = input.transformation)
    input.rv <- RV(input.outcomes, input.probs)
    result = g(input.rv)
    output$exercise_8_page_transformation_plot <- renderPlot({
      plot(result, main = "g(X)")
    })
    show('exercise_8_page_transformation_plot')
  })
}