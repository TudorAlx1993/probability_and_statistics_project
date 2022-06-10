Exercise5 <- function(input, output) {
  GetInputData <- reactive({
    req(input$exercise_5_page_upload_button)
    file <- input$exercise_5_page_upload_button
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
    # hide the previous output if another csv file is loaded
    hide('exercise_5_page_RV_plot')
    
    start.pos <- input$exercise_5_page_start
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
                       max = length(outcomes(RV(data[,1], data[,2]))), 
                       # handles case when csv file has multiple probabilities for the same outcome: 
                       # adds them together, and final length will differ from length(data[,1])
                       step = 1)
    show('exercise_5_page_start')
    show('exercise_5_page_action_button')
  })
  observeEvent(input$exercise_5_page_action_button, {
    data <- GetInputData()
    data.outcomes <- data[,1]
    data.probs <- data[,2]
    start.pos <- data[,3][1]
    
    # adds duplicate probabilities for one outcome into a single outcome-probability pair
    data.rv <- RV(data.outcomes, data.probs)
    new.data.outcomes <- outcomes(data.rv)[start.pos:length(data.outcomes)]
    new.data.probs <- probs(data.rv)[start.pos:length(data.probs)]
    
    output$exercise_5_page_RV_plot <- renderPlot({
      # plotted by axes instead of plotting a random variable built through discreteRV,
      # because the second method will alter plotted probabilities so that their sum becomes 1
      # if the starting position for viewing is higher than 1
      
      plot(x = new.data.outcomes, y = new.data.probs, type = "h", col = "black", lwd = 5,
           main = "Random Variable", xlab = "Outcomes", ylab = "Probabilities")
    })
    show('exercise_5_page_RV_plot')
    
  })
}