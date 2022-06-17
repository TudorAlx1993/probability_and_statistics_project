Exercise9 <- function(input, output) {
  GetInputData <- reactive({
    req(input$exercise_9_page_upload_values_x)
    file.x <- input$exercise_9_page_upload_values_x
    if (!all(file_ext(file.x$name) == 'csv')) {
      showNotification("X values: You must choose a csv file!", type = 'error')
      return(NULL)
    }
    
    x.csv.data <- read.csv(file.x$datapath)
    if (!ncol(x.csv.data) == 1) {
      showNotification("X values: file must contain only 1 column, representing values of X!", type = 'error')
      return(NULL)
    }

    req(input$exercise_9_page_upload_values_y)
    file.y <- input$exercise_9_page_upload_values_y
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
    file.probs <- input$exercise_9_page_upload_probs
    if (!all(file_ext(file.probs$name) == 'csv')) {
      showNotification("Probabilities: You must choose a csv file!", type = 'error')
      return(NULL)
    }
    
    probs.csv.data <- read.csv(file.probs$datapath)
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
  observeEvent(input$exercise_9_page_action_button, {
    data <- GetInputData()
    input.outcomes.x <- unique(data[,1]) 
    ## unique for removing elements recycled by data.frame() to match dimension of probs vector
    input.outcomes.y <- unique(data[,2])
    input.probs <- data[,3]
    input.g <- data[,4][1]
    input.h <- data[,5][1]
    
    #Replace occurences of max and min function calls with versions defined to return a discrete random variable
    #Replacement strings have to be of the same length as original string, hence short names of functions
    
    g.text <- str_replace_all(input.g, fixed("max(XandY)"), fixed("mxV(XandY)"))
    g.text <- str_replace_all(g.text, fixed("min(XandY"), fixed("mnV(XandY)"))
    
    h.text <- str_replace_all(input.h, fixed("max(XandY)"), fixed("mxV(XandY)"))
    h.text <- str_replace_all(h.text, fixed("min(XandY)"), fixed("mnV(XandY)"))
    
    g <- function(XandY) {}
    body(g) <- parse(text = g.text)
    
    h <- function(XandY) {}
    body(h) <- parse(text = h.text)
    
    joint.input <- jointRVFromInput(input.outcomes.x, input.outcomes.y, input.probs)
    z <- g(joint.input)
    t <- h(joint.input)
    result <- joint(z, t)
    output$exercise_9_page_output <- renderPrint({print(result)})
    show('exercise_9_page_output')
  })
}