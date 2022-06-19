Exercise3 <- function(input, output) {
  GetInputData <- reactive({
    req(input$exercise_3_page_upload_values_x)
    file.x <- input$exercise_3_page_upload_values_x
    if (!all(file_ext(file.x$name) == 'csv')) {
      showNotification("X values: You must choose a csv file!", type = 'error')
      return(NULL)
    }
    
    x.csv.data <- read.csv(file.x$datapath)
    if (!ncol(x.csv.data) == 1) {
      showNotification("X values: file must contain only 1 column, representing values of X!", type = 'error')
      return(NULL)
    }
    
    req(input$exercise_3_page_upload_values_y)
    file.y <- input$exercise_3_page_upload_values_y
    if (!all(file_ext(file.y$name) == 'csv')) {
      showNotification("Y values: You must choose a csv file!", type = 'error')
      return(NULL)
    }
    
    y.csv.data <- read.csv(file.y$datapath)
    if (!ncol(y.csv.data) == 1) {
      showNotification("Y values: file must contain only 1 column, representing values of Y!", type = 'error')
      return(NULL)
    }
    
    req(input$exercise_3_page_upload_probs)
    file.probs <- input$exercise_3_page_upload_probs
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
    return(data.frame(x.csv.data[,1], y.csv.data[,1], probs.csv.data[,1]))
  })
  observeEvent(GetInputData(), {
    show('exercise_3_page_run_button')})
  observeEvent(input$exercise_3_page_run_button, {
    data <- GetInputData()
    input.outcomes.x <- unique(data[,1]) 
    ## unique for removing elements recycled by data.frame() to match dimension of probs vector
    input.outcomes.y <- unique(data[,2])
    input.probs <- data[,3]
    
    joint.input <- jointRVFromInput(input.outcomes.x, input.outcomes.y, input.probs)
    marginal(joint.input, 1)
    marginal(joint.input, 2)
    x <- marginal(joint.input,1)
    y <- marginal(joint.input,2)
    MedieX <- E(x)
    MedieY <- E(y)
    VarX <- V(x)
    VarY <- V(y)
    DispX <- sqrt(VarX)
    DispY <- sqrt(VarY)
    Cov <- E(MultiplyRV((x-E(x)),(y-E(y))))
    Cor <- Cov/(DispX * DispY)
    output$exercise_3_page_output_x_average <- renderText({paste("Medie X: ", MedieX)})
    output$exercise_3_page_output_y_average <- renderText({paste("Medie Y: ", MedieY)})
    output$exercise_3_page_output_x_dispersion <- renderText({paste("Dispersie X: ", DispX)})
    output$exercise_3_page_output_y_dispersion <- renderText({paste("Dispersie Y: ", DispY)})
    output$exercise_3_page_output_x_y_covariance <- renderText({paste("Covarianta: ", Cov)})
    output$exercise_3_page_output_x_y_correlation_coefficient <- renderText({paste("Coeficient de relatie: ", Cor)})
    show('exercise_3_page_output_x_average')
    show('exercise_3_page_output_y_average')
    show('exercise_3_page_output_x_dispersion')
    show('exercise_3_page_output_y_dispersion')
    show('exercise_3_page_output_x_y_covariance')
    show('exercise_3_page_output_x_y_correlation_coefficient')
    
    output$exercise_3_page_output_x <- renderPlot({plot(x, main="X")})
    output$exercise_3_page_output_y <- renderPlot({plot(y, main="Y")})
    show('exercise_3_page_output_x')
    show('exercise_3_page_output_y')
  })
}