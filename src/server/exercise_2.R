Exercise2 <- function(input, output) {
  observeEvent(input$exercise_2_page_select_dist_name, {
    req(input$exercise_2_page_select_dist_name)
    show('exercise_2_page_action_button')
  }) %>%
    invisible()
  
  observeEvent(input$exercise_2_page_action_button, {
    distribution <- switch(
      input$exercise_2_page_select_dist_name,
      'Normal distribution' = {
        normal.dist.mean <- input$exercise_2_page_normal_dist_mean
        normal.dist.sigma <-
          input$exercise_2_page_normal_dist_sigma
        distribution <-
          NormalDistribution(normal.dist.mean, normal.dist.sigma)
      },
      'Lognormal distribution' = {
        # TODO
      },
      'Exponential distribution' = {
        exp.dist.lambda <- input$exercise_2_page_exp_dist_lambda
        distribution <- ExponentialDistribution(exp.dist.lambda)
      },
      'Gamma distribution' = {
        # TODO
      },
      'Poisson distribution' = {
        # TODO
      },
      'Binomial distribution' = {
        # TODO
      },
      'Uniform distribution' = {
        # TODO
      },
      'Beta distribution' = {
        # TODO
      }
    )
    
    output$exercise_2_page_dist_description <-
      distribution$description %>%
      HTML() %>%
      renderUI()
    output$exercise_2_page_dist_summary <-
      distribution %>%
      DistributionSummaryAsHTML() %>%
      HTML() %>%
      renderText()
    
    # anything in R is an object and it is created as a call to a function (Hadley, Advanced R)
    # thus the below implementation of if is correct :D
    output$exercise_2_page_dist_plot_pmf_or_pdf <-
      `if`(
        distribution$type == 'continuous',
        distribution$plot_pdf,
        distribution$plot_pmf
      ) %>%
      renderPlot()
    
    output$exercise_2_page_dist_plot_cdf <-
      distribution$plot_cdf %>%
      renderPlot()
  }) %>%
    invisible()
  
  return(NULL)
}