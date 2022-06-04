Exercise2 <- function(input, output) {
  observeEvent(input$exercise_2_page_select_dist_name, {
    req(input$exercise_2_page_select_dist_name)
    
    # hide the previous output tabs if the user selects a new distribution
    hideTab("exercise_2_page_tabset_panel", "Description")
    hideTab("exercise_2_page_tabset_panel", "Summary")
    hideTab("exercise_2_page_tabset_panel", "Plots")
    
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
        
        if (normal.dist.sigma <= 0) {
          showNotification(
            "The sigma parameter of the normal distribution should be strictly positive!",
            type = 'error'
          )
          return(NULL)
        }
        
        distribution <-
          NormalDistribution(normal.dist.mean, normal.dist.sigma)
      },
      'Lognormal distribution' = {
        lognormal.dist.miu <- input$exercise_2_page_lognormal_dist_miu
        lognormal.dist.sigma <-
          input$exercise_2_page_lognormal_dist_sigma
        
        if (lognormal.dist.sigma <= 0) {
          showNotification(
            "The sigma parameter of the lognormal distribution should be strictly positive!",
            type = 'error'
          )
          return(NULL)
        }
        
        distribution <-
          LognormalDistribution(lognormal.dist.miu, lognormal.dist.sigma)
      },
      'Exponential distribution' = {
        exp.dist.lambda <- input$exercise_2_page_exp_dist_lambda
        
        if (exp.dist.lambda <= 0) {
          showNotification(
            "The lambda parameter of the exponential distribution should be strictly positive!",
            type = 'error'
          )
          return(NULL)
        }
        
        distribution <- ExponentialDistribution(exp.dist.lambda)
      },
      'Gamma distribution' = {
        gamma.dist.shape <- input$exercise_2_page_gamma_dist_shape
        gamma.dist.scale <- input$exercise_2_page_gamma_dist_scale
        
        if (gamma.dist.shape <= 0 | gamma.dist.scale <= 0) {
          showNotification(
            "The shape and scale parameters of a gamma distribution should be strictly positive!",
            type = 'error'
          )
          return(NULL)
        }
        
        distribution <-
          GammaDistribution(gamma.dist.shape, gamma.dist.scale)
      },
      'Poisson distribution' = {
        poisson.dist.lambda <- input$exercise_2_page_poisson_dist_lambda
        
        if (poisson.dist.lambda <= 0) {
          showNotification(
            "The lambda parameter of a poisson distribution should be strictly positive!",
            type = 'error'
          )
          return(NULL)
        }
        
        distribution <- PoissonDistribution(poisson.dist.lambda)
      },
      'Binomial distribution' = {
        binomial.dist.n <- input$exercise_2_page_binomial_dist_n
        binomial.dist.p <- input$exercise_2_page_binomial_dist_p
        
        if (!(binomial.dist.n > 0 &
              binomial.dist.n == as.integer(binomial.dist.n))) {
          showNotification("The n parameter of a binomial distribution should be a natural number!",
                           type = 'error')
          return(NULL)
        }
        
        if (!(binomial.dist.p >= 0 & binomial.dist.p <= 1)) {
          showNotification("The p parameter of a binomial distribution should be a probability!",
                           type = 'error')
          return(NULL)
        }
        
        distribution <-
          BinomialDistribution(binomial.dist.n, binomial.dist.p)
      },
      'Uniform distribution' = {
        cont.uniform.dist.a <- input$exercise_2_page_uniform_dist_a
        cont.uniform.dist.b <- input$exercise_2_page_uniform_dist_b
        
        if (!(cont.uniform.dist.a < cont.uniform.dist.b)) {
          showNotification(
            "In the case of an uniform distribution paramter a should be strictly less than parameter b!",
            type = 'error'
          )
          return(NULL)
        }
        
        distribution <-
          ContinuousUniformDistribution(cont.uniform.dist.a, cont.uniform.dist.b)
      },
      'Beta distribution' = {
        beta.dist.alfa <- input$exercise_2_page_beta_dist_alfa
        beta.dist.beta <- input$exercise_2_page_beta_dist_beta
        
        if (beta.dist.alfa <= 0 | beta.dist.beta <= 0) {
          showNotification(
            "In the case of a beta distribution paramters alfa and beta should be strictly positive!",
            type = 'error'
          )
          return(NULL)
        }
        
        distribution <-
          BetaDistribution(beta.dist.alfa, beta.dist.beta)
      }
    )
    
    if (is.null(distribution)) {
      return(NULL)
    }
    
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
    
    showTab("exercise_2_page_tabset_panel", "Description")
    showTab("exercise_2_page_tabset_panel", "Summary")
    showTab("exercise_2_page_tabset_panel", "Plots")
  }) %>%
    invisible()
  
  return(NULL)
}