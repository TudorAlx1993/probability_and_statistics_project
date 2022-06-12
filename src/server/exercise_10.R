Exercise10 <- function(input, output) {
  observeEvent(input$exercise_10_page_select_dist_name, {
    req(input$exercise_10_page_select_dist_name)
    
    hide('exercise_10_page_text_output_mean')
    hide('exercise_10_page_text_output_variance')
    
    show('exercise_10_page_input_function')
    show('exercise_10_page_action_button')
  }) %>%
    invisible()
  
  observeEvent(input$exercise_10_page_input_function, {
    hide('exercise_10_page_text_output_mean')
    hide('exercise_10_page_text_output_variance')
  }) %>%
    invisible()
  
  observeEvent(input$exercise_10_page_action_button, {
    distribution <- switch(
      input$exercise_10_page_select_dist_name,
      'Normal distribution' = {
        normal.dist.mean <- input$exercise_10_page_normal_dist_mean
        normal.dist.sigma <-
          input$exercise_10_page_normal_dist_sigma
        
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
        lognormal.dist.miu <- input$exercise_10_page_lognormal_dist_miu
        lognormal.dist.sigma <-
          input$exercise_10_page_lognormal_dist_sigma
        
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
        exp.dist.lambda <- input$exercise_10_page_exp_dist_lambda
        
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
        gamma.dist.shape <- input$exercise_10_page_gamma_dist_shape
        gamma.dist.scale <-
          input$exercise_10_page_gamma_dist_scale
        
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
        poisson.dist.lambda <- input$exercise_10_page_poisson_dist_lambda
        
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
        binomial.dist.n <- input$exercise_10_page_binomial_dist_n
        binomial.dist.p <- input$exercise_10_page_binomial_dist_p
        
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
        cont.uniform.dist.a <- input$exercise_10_page_uniform_dist_a
        cont.uniform.dist.b <-
          input$exercise_10_page_uniform_dist_b
        
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
        beta.dist.alfa <- input$exercise_10_page_beta_dist_alfa
        beta.dist.beta <- input$exercise_10_page_beta_dist_beta
        
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
    
    dist.support.min <- distribution$support[['min']]
    dist.support.max <- distribution$support[['max']]
    
    input.g.function <- input$exercise_10_page_input_function
    g.function <- function(x) {
      
    }
    body(g.function) <-
      parse(text = paste0('(', input.g.function, ')'))
    
    if (all(distribution$type == 'continuous')) {
      GetInitialMomentsOfFunctionGCont <- function(moment.count) {
        integrate(
          f = function(x, moment.count) {
            ((g.function(x) ** moment.count) * distribution$pdf(x)) %>%
              return()
          },
          lower = dist.support.min,
          upper = dist.support.max,
          rel.tol = 10 ** -4,
          moment.count = moment.count
        ) %>%
          pluck('value') %>%
          return()
      }
      
      expectation.of.g.of.X <- GetInitialMomentsOfFunctionGCont(1)
      variance.of.g.of.X <-
        GetInitialMomentsOfFunctionGCont(2) - expectation.of.g.of.X ** 2
    } else{
      GetInitialMomentsOfFunctionGDiscrete <- function(x, moment.count) {
        ((g.function(x) ** moment.count) * distribution$pmf(x)) %>%
          sum() %>%
          return()
      }
      
      expectation.of.g.of.X <-
        GetInitialMomentsOfFunctionGDiscrete(dist.support.min:dist.support.max, 1)
      variance.of.g.of.X <-
        GetInitialMomentsOfFunctionGDiscrete(dist.support.min:dist.support.max, 2) - expectation.of.g.of.X ** 2
    }
    
    output$exercise_10_page_text_output_mean <-
      paste0('E[g(X)]=', round(expectation.of.g.of.X, 4)) %>%
      renderText()
    output$exercise_10_page_text_output_variance <-
      paste0('Var[g(X)]=', round(variance.of.g.of.X, 4)) %>%
      renderText()
    
    show('exercise_10_page_text_output_mean')
    show('exercise_10_page_text_output_variance')
    
    return(NULL)
  }) %>%
    invisible()
  
  return(NULL)
}