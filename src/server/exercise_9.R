Exercise9 <- function(input, output) {
  GetInputData <- reactive({
    req(input$exercise_9_page_upload_values_x)
    file.x <- exercise_9_page_upload_values_x
    if (!all(file_ext(file.x$name) == 'csv')) {
      showNotification("X values: You must choose a csv file!", type = 'error')
      return(NULL)
    }
    
    x.csv.data <- read.csv(file.x$datapath)
    if (!ncol(x.csv.data) == 1) {
      showNotification("X values: file must contain only 1 column, representing values of X!", type = 'error')
      return(NULL)
    }

    # hide the previous output if another csv file is loaded
    hide('exercise_9_page_output')
    req(input$exercise_9_page_upload_values_y)
    file.y <- exercise_9_page_upload_values_y
    if (!all(file_ext(file.y$name) == 'csv')) {
      showNotification("Y values: You must choose a csv file!", type = 'error')
      return(NULL)
    }
    
    y.csv.data <- read.csv(file.y$datapath)
    if (!ncol(y.csv.data) == 1) {
      showNotification("Y values: file must contain only 1 column, representing values of Y!", type = 'error')
      return(NULL)
    }
    
    req(input$exercise_9_page_upload_probs)
    file.probs <- exercise_9_page_upload_probs
    if (!all(file_ext(file.probs$name) == 'csv')) {
      showNotification("Probabilities: You must choose a csv file!", type = 'error')
      return(NULL)
    }
    
    probs.csv.data <- read.csv(file.y$datapath)
    if (!ncol(probs.csv.data) == 1) {
      showNotification("Probabilities: file must contain only 1 column, representing probabilities!", type = 'error')
      return(NULL)
    }
    if (!sum(probs.csv.data[,1]) == 1) {
      showNotification("Sum of probabilities must equal 1!", type = 'error')
      return(NULL)
    }
    req(input$exercise_9_page_function_g)
    function.g <- input$exercise_9_page_function_g
    req(input$exercise_9_page_function_h)
    function.h <- input$exercise_9_page_function_h
    return(data.frame(x.csv.data[,1], y.csv.data[,1], probs.csv.data[,1], function.g, function.h))
  })
  observeEvent(GetInputData(), {
    show('exercise_9_page_action_button')
  })
}