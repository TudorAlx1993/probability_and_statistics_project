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
    start.pos <- input$exercise_5_page_start
    
    # hide the previous output if another csv file is loaded
    hide('exercise_5_page_RV_plot')
    
    return(data.frame(csv.data[,1], csv.data[,2], start.pos))
  })
  observeEvent(input$exercise_5_page_upload_button, {
    data <- GetInputData()
    if (is.null(data[1])) {
      return(NULL)
    }
    updateNumericInput(inputId = 'exercise_5_page_start',
                       label = 'Starting position',
                       value = 1,
                       min = 1,
                       max = length(data[,1]),
                       step = 1)
    show('exercise_5_page_start')
    show('exercise_5_page_action_button')
  })
  observeEvent(input$exercise_5_page_action_button, {
    data <- GetInputData()
    data.outcomes <- data[,1]
    data.probs <- data[,2]
    start.pos <- data[,3][1]
    
    outcomes.length <- length(data.outcomes)
    data.outcomes <- data.outcomes[start.pos:outcomes.length]
    probs.length <- length(data.probs)
    data.probs <- data.probs[start.pos:outcomes.length]
    
    output$exercise_5_page_RV_plot <- renderPlot({
      # plotted normally instead of plotting a random variable built through discreteRV,
      # because the second method can alter plotted probabilities 
      # if the starting position for viewing is higher than 1
      plot(x = data.outcomes, y = data.probs, type = "h", col = "black", lwd = 5,
           main = "Random Variable", xlab = "Outcomes", ylab = "Probabilities")
    })
    show('exercise_5_page_RV_plot')
    
  })
}