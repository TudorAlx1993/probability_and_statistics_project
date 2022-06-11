Exercise6 <- function(input, output) {
  observeEvent(input$exercise_6_page_select_dist_name, {
    req(input$exercise_6_page_select_dist_name)
    
    # hide the previous output if the user select another distribution
    hide('exercise_6_page_probability_output')
    
    show('exercise_6_page_radio_button')
  }) %>%
    invisible()
  
  observeEvent(input$exercise_6_page_radio_button, {
    # hide the previous output if the user select another formula for probability
    hide('exercise_6_page_probability_output')
    
    show('exercise_6_page_action_button')
  }) %>%
    invisible()
  
  observeEvent(input$exercise_6_page_action_button, {
    probability <- switch(
      input$exercise_6_page_select_dist_name,
      'Normal distribution' = {
        normal.dist.mean <- input$exercise_6_page_normal_dist_mean
        normal.dist.sigma <-
          input$exercise_6_page_normal_dist_sigma
        
        if (normal.dist.sigma <= 0) {
          showNotification(
            "The sigma parameter of the normal distribution should be strictly positive!",
            type = 'error'
          )
          return(NULL)
        }
        
        if (input$exercise_6_page_radio_button == 'less_than_x') {
          x <- input$exercise_6_page_less_than_x_value
          
          probability <-
            pnorm(x, normal.dist.mean, normal.dist.sigma)
        } else if (input$exercise_6_page_radio_button == 'less_or_equal_than_x') {
          x <- input$exercise_6_page_less_or_equal_than_x_value
          
          probability <-
            pnorm(x, normal.dist.mean, normal.dist.sigma)
        }
        else if (input$exercise_6_page_radio_button == 'greater_than_x') {
          x <- input$exercise_6_page_greater_than_x_value
          
          probability <-
            1 - pnorm(x, normal.dist.mean, normal.dist.sigma)
        } else if (input$exercise_6_page_radio_button == 'greater_or_equal_than_x') {
          x <- input$exercise_6_page_greater_or_equal_than_x_value
          
          probability <-
            1 - pnorm(x, normal.dist.mean, normal.dist.sigma)
        }
        else if (input$exercise_6_page_radio_button == 'equal_to_x') {
          # for all continuous distributions
          probability <- 0
        } else if (input$exercise_6_page_radio_button == 'greater_than_x_and_less_then_y') {
          x <- input$exercise_6_page_greater_than_x_and_less_then_y_x_value
          y <-
            input$exercise_6_page_greater_than_x_and_less_then_y_y_value
          
          if (!(x < y)) {
            showNotification("The value of x should be strictly less than the value of y!",
                             type = 'error')
            return(NULL)
          }
          
          probability <-
            pnorm(y, normal.dist.mean, normal.dist.sigma) - pnorm(x, normal.dist.mean, normal.dist.sigma)
        }
        else if (input$exercise_6_page_radio_button == 'greater_or_equal_than_x_and_less_then_y') {
          x <-
            input$exercise_6_page_greater_or_equal_than_x_and_less_then_y_x_value
          y <-
            input$exercise_6_page_greater_or_equal_than_x_and_less_then_y_y_value
          
          if (!(x < y)) {
            showNotification("The value of x should be strictly less than the value of y!",
                             type = 'error')
            return(NULL)
          }
          
          probability <-
            pnorm(y, normal.dist.mean, normal.dist.sigma) - pnorm(x, normal.dist.mean, normal.dist.sigma)
        }
        else if (input$exercise_6_page_radio_button == 'greater_than_x_and_less_or_equal_then_y') {
          x <-
            input$exercise_6_page_greater_than_x_and_less_or_equal_then_y_x_value
          y <-
            input$exercise_6_page_greater_than_x_and_less_or_equal_then_y_y_value
          
          if (!(x < y)) {
            showNotification("The value of x should be strictly less than the value of y!",
                             type = 'error')
            return(NULL)
          }
          
          probability <-
            pnorm(y, normal.dist.mean, normal.dist.sigma) - pnorm(x, normal.dist.mean, normal.dist.sigma)
        }
        else if (input$exercise_6_page_radio_button == 'greater_or_equal_than_x_and_less_or_equal_then_y') {
          x <-
            input$exercise_6_page_greater_or_equal_than_x_and_less_or_equal_then_y_x_value
          y <-
            input$exercise_6_page_greater_or_equal_than_x_and_less_or_equal_then_y_y_value
          
          if (!(x < y)) {
            showNotification("The value of x should be strictly less than the value of y!",
                             type = 'error')
            return(NULL)
          }
          
          probability <-
            pnorm(y, normal.dist.mean, normal.dist.sigma) - pnorm(x, normal.dist.mean, normal.dist.sigma)
        }
      },
      'Lognormal distribution' = {
        lognormal.dist.miu <- input$exercise_6_page_lognormal_dist_miu
        lognormal.dist.sigma <-
          input$exercise_6_page_lognormal_dist_sigma
        
        if (lognormal.dist.sigma <= 0) {
          showNotification(
            "The sigma parameter of the lognormal distribution should be strictly positive!",
            type = 'error'
          )
          return(NULL)
        }
        
        if (input$exercise_6_page_radio_button == 'less_than_x') {
          x <- input$exercise_6_page_less_than_x_value
          
          probability <-
            plnorm(x, lognormal.dist.miu, lognormal.dist.sigma)
        } else if (input$exercise_6_page_radio_button == 'less_or_equal_than_x') {
          x <- input$exercise_6_page_less_or_equal_than_x_value
          
          probability <-
            plnorm(x, lognormal.dist.miu, lognormal.dist.sigma)
        }
        else if (input$exercise_6_page_radio_button == 'greater_than_x') {
          x <- input$exercise_6_page_greater_than_x_value
          
          probability <-
            1 - plnorm(x, lognormal.dist.miu, lognormal.dist.sigma)
        } else if (input$exercise_6_page_radio_button == 'greater_or_equal_than_x') {
          x <- input$exercise_6_page_greater_or_equal_than_x_value
          
          probability <-
            1 - plnorm(x, lognormal.dist.miu, lognormal.dist.sigma)
        }
        else if (input$exercise_6_page_radio_button == 'equal_to_x') {
          # for all continuous distributions
          probability <- 0
        } else if (input$exercise_6_page_radio_button == 'greater_than_x_and_less_then_y') {
          x <- input$exercise_6_page_greater_than_x_and_less_then_y_x_value
          y <-
            input$exercise_6_page_greater_than_x_and_less_then_y_y_value
          
          if (!(x < y)) {
            showNotification("The value of x should be strictly less than the value of y!",
                             type = 'error')
            return(NULL)
          }
          
          probability <-
            plnorm(y, lognormal.dist.miu, lognormal.dist.sigma) - plnorm(x, lognormal.dist.miu, lognormal.dist.sigma)
        }
        else if (input$exercise_6_page_radio_button == 'greater_or_equal_than_x_and_less_then_y') {
          x <-
            input$exercise_6_page_greater_or_equal_than_x_and_less_then_y_x_value
          y <-
            input$exercise_6_page_greater_or_equal_than_x_and_less_then_y_y_value
          
          if (!(x < y)) {
            showNotification("The value of x should be strictly less than the value of y!",
                             type = 'error')
            return(NULL)
          }
          
          probability <-
            plnorm(y, lognormal.dist.miu, lognormal.dist.sigma) - plnorm(x, lognormal.dist.miu, lognormal.dist.sigma)
        }
        else if (input$exercise_6_page_radio_button == 'greater_than_x_and_less_or_equal_then_y') {
          x <-
            input$exercise_6_page_greater_than_x_and_less_or_equal_then_y_x_value
          y <-
            input$exercise_6_page_greater_than_x_and_less_or_equal_then_y_y_value
          
          if (!(x < y)) {
            showNotification("The value of x should be strictly less than the value of y!",
                             type = 'error')
            return(NULL)
          }
          
          probability <-
            plnorm(y, lognormal.dist.miu, lognormal.dist.sigma) - plnorm(x, lognormal.dist.miu, lognormal.dist.sigma)
        }
        else if (input$exercise_6_page_radio_button == 'greater_or_equal_than_x_and_less_or_equal_then_y') {
          x <-
            input$exercise_6_page_greater_or_equal_than_x_and_less_or_equal_then_y_x_value
          y <-
            input$exercise_6_page_greater_or_equal_than_x_and_less_or_equal_then_y_y_value
          
          if (!(x < y)) {
            showNotification("The value of x should be strictly less than the value of y!",
                             type = 'error')
            return(NULL)
          }
          
          probability <-
            plnorm(y, lognormal.dist.miu, lognormal.dist.sigma) - plnorm(x, lognormal.dist.miu, lognormal.dist.sigma)
        }
      },
      'Exponential distribution' = {
        exp.dist.lambda <- input$exercise_6_page_exp_dist_lambda
        
        if (exp.dist.lambda <= 0) {
          showNotification(
            "The lambda parameter of the exponential distribution should be strictly positive!",
            type = 'error'
          )
          return(NULL)
        }
        
        if (input$exercise_6_page_radio_button == 'less_than_x') {
          x <- input$exercise_6_page_less_than_x_value
          
          probability <-
            pexp(x, exp.dist.lambda)
        } else if (input$exercise_6_page_radio_button == 'less_or_equal_than_x') {
          x <- input$exercise_6_page_less_or_equal_than_x_value
          
          probability <-
            pexp(x, exp.dist.lambda)
        }
        else if (input$exercise_6_page_radio_button == 'greater_than_x') {
          x <- input$exercise_6_page_greater_than_x_value
          
          probability <-
            1 - pexp(x, exp.dist.lambda)
        } else if (input$exercise_6_page_radio_button == 'greater_or_equal_than_x') {
          x <- input$exercise_6_page_greater_or_equal_than_x_value
          
          probability <-
            1 - pexp(x, exp.dist.lambda)
        }
        else if (input$exercise_6_page_radio_button == 'equal_to_x') {
          # for all continuous distributions
          probability <- 0
        } else if (input$exercise_6_page_radio_button == 'greater_than_x_and_less_then_y') {
          x <- input$exercise_6_page_greater_than_x_and_less_then_y_x_value
          y <-
            input$exercise_6_page_greater_than_x_and_less_then_y_y_value
          
          if (!(x < y)) {
            showNotification("The value of x should be strictly less than the value of y!",
                             type = 'error')
            return(NULL)
          }
          
          probability <-
            pexp(y, exp.dist.lambda) - pexp(x, exp.dist.lambda)
        }
        else if (input$exercise_6_page_radio_button == 'greater_or_equal_than_x_and_less_then_y') {
          x <-
            input$exercise_6_page_greater_or_equal_than_x_and_less_then_y_x_value
          y <-
            input$exercise_6_page_greater_or_equal_than_x_and_less_then_y_y_value
          
          if (!(x < y)) {
            showNotification("The value of x should be strictly less than the value of y!",
                             type = 'error')
            return(NULL)
          }
          
          probability <-
            pexp(y, exp.dist.lambda) - pexp(x, exp.dist.lambda)
        }
        else if (input$exercise_6_page_radio_button == 'greater_than_x_and_less_or_equal_then_y') {
          x <-
            input$exercise_6_page_greater_than_x_and_less_or_equal_then_y_x_value
          y <-
            input$exercise_6_page_greater_than_x_and_less_or_equal_then_y_y_value
          
          if (!(x < y)) {
            showNotification("The value of x should be strictly less than the value of y!",
                             type = 'error')
            return(NULL)
          }
          
          probability <-
            pexp(y, exp.dist.lambda) - pexp(x, exp.dist.lambda)
        }
        else if (input$exercise_6_page_radio_button == 'greater_or_equal_than_x_and_less_or_equal_then_y') {
          x <-
            input$exercise_6_page_greater_or_equal_than_x_and_less_or_equal_then_y_x_value
          y <-
            input$exercise_6_page_greater_or_equal_than_x_and_less_or_equal_then_y_y_value
          
          if (!(x < y)) {
            showNotification("The value of x should be strictly less than the value of y!",
                             type = 'error')
            return(NULL)
          }
          
          probability <-
            pexp(y, exp.dist.lambda) - pexp(x, exp.dist.lambda)
        }
      },
      'Gamma distribution' = {
        gamma.dist.shape <- input$exercise_6_page_gamma_dist_shape
        gamma.dist.scale <- input$exercise_6_page_gamma_dist_scale
        
        if (gamma.dist.shape <= 0 | gamma.dist.scale <= 0) {
          showNotification(
            "The shape and scale parameters of a gamma distribution should be strictly positive!",
            type = 'error'
          )
          return(NULL)
        }
        
        if (input$exercise_6_page_radio_button == 'less_than_x') {
          x <- input$exercise_6_page_less_than_x_value
          
          probability <-
            pgamma(x, gamma.dist.shape, scale = gamma.dist.scale)
        } else if (input$exercise_6_page_radio_button == 'less_or_equal_than_x') {
          x <- input$exercise_6_page_less_or_equal_than_x_value
          
          probability <-
            pgamma(x, gamma.dist.shape, scale = gamma.dist.scale)
        }
        else if (input$exercise_6_page_radio_button == 'greater_than_x') {
          x <- input$exercise_6_page_greater_than_x_value
          
          probability <-
            1 -  pgamma(x, gamma.dist.shape, scale = gamma.dist.scale)
        } else if (input$exercise_6_page_radio_button == 'greater_or_equal_than_x') {
          x <- input$exercise_6_page_greater_or_equal_than_x_value
          
          probability <-
            1 -  pgamma(x, gamma.dist.shape, scale = gamma.dist.scale)
        }
        else if (input$exercise_6_page_radio_button == 'equal_to_x') {
          # for all continuous distributions
          probability <- 0
        } else if (input$exercise_6_page_radio_button == 'greater_than_x_and_less_then_y') {
          x <- input$exercise_6_page_greater_than_x_and_less_then_y_x_value
          y <-
            input$exercise_6_page_greater_than_x_and_less_then_y_y_value
          
          if (!(x < y)) {
            showNotification("The value of x should be strictly less than the value of y!",
                             type = 'error')
            return(NULL)
          }
          
          probability <-
            pgamma(y, gamma.dist.shape, scale = gamma.dist.scale) - pgamma(x, gamma.dist.shape, scale =
                                                                             gamma.dist.scale)
        }
        else if (input$exercise_6_page_radio_button == 'greater_or_equal_than_x_and_less_then_y') {
          x <-
            input$exercise_6_page_greater_or_equal_than_x_and_less_then_y_x_value
          y <-
            input$exercise_6_page_greater_or_equal_than_x_and_less_then_y_y_value
          
          if (!(x < y)) {
            showNotification("The value of x should be strictly less than the value of y!",
                             type = 'error')
            return(NULL)
          }
          
          probability <-
            pgamma(y, gamma.dist.shape, scale = gamma.dist.scale) - pgamma(x, gamma.dist.shape, scale =
                                                                             gamma.dist.scale)
        }
        else if (input$exercise_6_page_radio_button == 'greater_than_x_and_less_or_equal_then_y') {
          x <-
            input$exercise_6_page_greater_than_x_and_less_or_equal_then_y_x_value
          y <-
            input$exercise_6_page_greater_than_x_and_less_or_equal_then_y_y_value
          
          if (!(x < y)) {
            showNotification("The value of x should be strictly less than the value of y!",
                             type = 'error')
            return(NULL)
          }
          
          probability <-
            pgamma(y, gamma.dist.shape, scale = gamma.dist.scale) - pgamma(x, gamma.dist.shape, scale =
                                                                             gamma.dist.scale)
        }
        else if (input$exercise_6_page_radio_button == 'greater_or_equal_than_x_and_less_or_equal_then_y') {
          x <-
            input$exercise_6_page_greater_or_equal_than_x_and_less_or_equal_then_y_x_value
          y <-
            input$exercise_6_page_greater_or_equal_than_x_and_less_or_equal_then_y_y_value
          
          if (!(x < y)) {
            showNotification("The value of x should be strictly less than the value of y!",
                             type = 'error')
            return(NULL)
          }
          
          probability <-
            pgamma(y, gamma.dist.shape, scale = gamma.dist.scale) - pgamma(x, gamma.dist.shape, scale =
                                                                             gamma.dist.scale)
        }
      },
      'Poisson distribution' = {
        poisson.dist.lambda <- input$exercise_6_page_poisson_dist_lambda
        
        if (poisson.dist.lambda <= 0) {
          showNotification(
            "The lambda parameter of a poisson distribution should be strictly positive!",
            type = 'error'
          )
          return(NULL)
        }
        
        if (input$exercise_6_page_radio_button == 'less_than_x') {
          x <- input$exercise_6_page_less_than_x_value
          
          probability <-
            ppois(x, poisson.dist.lambda) - dpois(x, poisson.dist.lambda)
        } else if (input$exercise_6_page_radio_button == 'less_or_equal_than_x') {
          x <- input$exercise_6_page_less_or_equal_than_x_value
          
          probability <-
            ppois(x, poisson.dist.lambda)
        }
        else if (input$exercise_6_page_radio_button == 'greater_than_x') {
          x <- input$exercise_6_page_greater_than_x_value
          
          probability <-
            1 - ppois(x, poisson.dist.lambda)
        } else if (input$exercise_6_page_radio_button == 'greater_or_equal_than_x') {
          x <- input$exercise_6_page_greater_or_equal_than_x_value
          
          probability <-
            1 -  ppois(x, poisson.dist.lambda) + dpois(x, poisson.dist.lambda)
        }
        else if (input$exercise_6_page_radio_button == 'equal_to_x') {
          x <- input$exercise_6_page_equal_to_x_value
          
          probability <- dpois(x, poisson.dist.lambda)
        } else if (input$exercise_6_page_radio_button == 'greater_than_x_and_less_then_y') {
          x <- input$exercise_6_page_greater_than_x_and_less_then_y_x_value
          y <-
            input$exercise_6_page_greater_than_x_and_less_then_y_y_value
          
          if (!((x + 1) <= (y - 1))) {
            showNotification("The fallowing condition is not meet: (x+1) <= (y-1)",
                             type = 'error')
            return(NULL)
          }
          
          if (!(x == as.integer(x) && y == as.integer(y))) {
            showNotification("The values of x and y should have an integer type!",
                             type = 'error')
            return(NULL)
          }
          
          probability <- dpois((x + 1):(y - 1), poisson.dist.lambda) %>%
            sum()
        }
        else if (input$exercise_6_page_radio_button == 'greater_or_equal_than_x_and_less_then_y') {
          x <-
            input$exercise_6_page_greater_or_equal_than_x_and_less_then_y_x_value
          y <-
            input$exercise_6_page_greater_or_equal_than_x_and_less_then_y_y_value
          
          if (!(x <= (y - 1))) {
            showNotification("The fallowing condition is not meet: x <= (y-1)",
                             type = 'error')
            return(NULL)
          }
          
          if (!(x == as.integer(x) && y == as.integer(y))) {
            showNotification("The values of x and y should have an integer type!",
                             type = 'error')
            return(NULL)
          }
          
          probability <- dpois(x:(y - 1), poisson.dist.lambda) %>%
            sum()
        }
        else if (input$exercise_6_page_radio_button == 'greater_than_x_and_less_or_equal_then_y') {
          x <-
            input$exercise_6_page_greater_than_x_and_less_or_equal_then_y_x_value
          y <-
            input$exercise_6_page_greater_than_x_and_less_or_equal_then_y_y_value
          
          if (!((x + 1) <= y)) {
            showNotification("The fallowing condition is not meet: (x+1) <= y",
                             type = 'error')
            return(NULL)
          }
          
          if (!(x == as.integer(x) && y == as.integer(y))) {
            showNotification("The values of x and y should have an integer type!",
                             type = 'error')
            return(NULL)
          }
          
          probability <- dpois((x + 1):y, poisson.dist.lambda) %>%
            sum()
        }
        else if (input$exercise_6_page_radio_button == 'greater_or_equal_than_x_and_less_or_equal_then_y') {
          x <-
            input$exercise_6_page_greater_or_equal_than_x_and_less_or_equal_then_y_x_value
          y <-
            input$exercise_6_page_greater_or_equal_than_x_and_less_or_equal_then_y_y_value
          
          if (!(x <= y)) {
            showNotification("The fallowing condition is not meet: x <= y",
                             type = 'error')
            return(NULL)
          }
          
          if (!(x == as.integer(x) && y == as.integer(y))) {
            showNotification("The values of x and y should have an integer type!",
                             type = 'error')
            return(NULL)
          }
          
          probability <- dpois(x:y, poisson.dist.lambda) %>%
            sum()
        }
      },
      'Binomial distribution' = {
        binomial.dist.n <- input$exercise_6_page_binomial_dist_n
        binomial.dist.p <- input$exercise_6_page_binomial_dist_p
        
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
        
        if (input$exercise_6_page_radio_button == 'less_than_x') {
          x <- input$exercise_6_page_less_than_x_value
          
          probability <-
            pbinom(x, binomial.dist.n, binomial.dist.p) - dbinom(x, binomial.dist.n, binomial.dist.p)
        } else if (input$exercise_6_page_radio_button == 'less_or_equal_than_x') {
          x <- input$exercise_6_page_less_or_equal_than_x_value
          
          probability <-
            pbinom(x, binomial.dist.n, binomial.dist.p)
        }
        else if (input$exercise_6_page_radio_button == 'greater_than_x') {
          x <- input$exercise_6_page_greater_than_x_value
          
          probability <-
            1 - pbinom(x, binomial.dist.n, binomial.dist.p)
        } else if (input$exercise_6_page_radio_button == 'greater_or_equal_than_x') {
          x <- input$exercise_6_page_greater_or_equal_than_x_value
          
          probability <-
            1 -  pbinom(x, binomial.dist.n, binomial.dist.p) + dbinom(x, binomial.dist.n, binomial.dist.p)
        }
        else if (input$exercise_6_page_radio_button == 'equal_to_x') {
          x <- input$exercise_6_page_equal_to_x_value
          
          probability <- dbinom(x, binomial.dist.n, binomial.dist.p)
        } else if (input$exercise_6_page_radio_button == 'greater_than_x_and_less_then_y') {
          x <- input$exercise_6_page_greater_than_x_and_less_then_y_x_value
          y <-
            input$exercise_6_page_greater_than_x_and_less_then_y_y_value
          
          if (!((x + 1) <= (y - 1))) {
            showNotification("The fallowing condition is not meet: (x+1) <= (y-1)",
                             type = 'error')
            return(NULL)
          }
          
          if (!(x == as.integer(x) && y == as.integer(y))) {
            showNotification("The values of x and y should have an integer type!",
                             type = 'error')
            return(NULL)
          }
          
          probability <-
            dbinom((x + 1):(y - 1), binomial.dist.n, binomial.dist.p) %>%
            sum()
        }
        else if (input$exercise_6_page_radio_button == 'greater_or_equal_than_x_and_less_then_y') {
          x <-
            input$exercise_6_page_greater_or_equal_than_x_and_less_then_y_x_value
          y <-
            input$exercise_6_page_greater_or_equal_than_x_and_less_then_y_y_value
          
          if (!(x <= (y - 1))) {
            showNotification("The fallowing condition is not meet: x <= (y-1)",
                             type = 'error')
            return(NULL)
          }
          
          if (!(x == as.integer(x) && y == as.integer(y))) {
            showNotification("The values of x and y should have an integer type!",
                             type = 'error')
            return(NULL)
          }
          
          probability <-
            dbinom(x:(y - 1), binomial.dist.n, binomial.dist.p) %>%
            sum()
        }
        else if (input$exercise_6_page_radio_button == 'greater_than_x_and_less_or_equal_then_y') {
          x <-
            input$exercise_6_page_greater_than_x_and_less_or_equal_then_y_x_value
          y <-
            input$exercise_6_page_greater_than_x_and_less_or_equal_then_y_y_value
          
          if (!((x + 1) <= y)) {
            showNotification("The fallowing condition is not meet: (x+1) <= y",
                             type = 'error')
            return(NULL)
          }
          
          if (!(x == as.integer(x) && y == as.integer(y))) {
            showNotification("The values of x and y should have an integer type!",
                             type = 'error')
            return(NULL)
          }
          
          probability <-
            dbinom((x + 1):y, binomial.dist.n, binomial.dist.p) %>%
            sum()
        }
        else if (input$exercise_6_page_radio_button == 'greater_or_equal_than_x_and_less_or_equal_then_y') {
          x <-
            input$exercise_6_page_greater_or_equal_than_x_and_less_or_equal_then_y_x_value
          y <-
            input$exercise_6_page_greater_or_equal_than_x_and_less_or_equal_then_y_y_value
          
          if (!(x <= y)) {
            showNotification("The fallowing condition is not meet: x <= y",
                             type = 'error')
            return(NULL)
          }
          
          if (!(x == as.integer(x) && y == as.integer(y))) {
            showNotification("The values of x and y should have an integer type!",
                             type = 'error')
            return(NULL)
          }
          
          probability <-
            dbinom(x:y, binomial.dist.n, binomial.dist.p) %>%
            sum()
        }
      },
      'Uniform distribution' = {
        cont.uniform.dist.a <- input$exercise_6_page_uniform_dist_a
        cont.uniform.dist.b <- input$exercise_6_page_uniform_dist_b
        
        if (!(cont.uniform.dist.a < cont.uniform.dist.b)) {
          showNotification(
            "In the case of an uniform distribution paramter a should be strictly less than parameter b!",
            type = 'error'
          )
          return(NULL)
        }
        
        if (input$exercise_6_page_radio_button == 'less_than_x') {
          x <- input$exercise_6_page_less_than_x_value
          
          probability <-
            punif(x, cont.uniform.dist.a, cont.uniform.dist.b)
        } else if (input$exercise_6_page_radio_button == 'less_or_equal_than_x') {
          x <- input$exercise_6_page_less_or_equal_than_x_value
          
          probability <-
            punif(x, cont.uniform.dist.a, cont.uniform.dist.b)
        }
        else if (input$exercise_6_page_radio_button == 'greater_than_x') {
          x <- input$exercise_6_page_greater_than_x_value
          
          probability <-
            1 -  punif(x, cont.uniform.dist.a, cont.uniform.dist.b)
        } else if (input$exercise_6_page_radio_button == 'greater_or_equal_than_x') {
          x <- input$exercise_6_page_greater_or_equal_than_x_value
          
          probability <-
            1 -  punif(x, cont.uniform.dist.a, cont.uniform.dist.b)
        }
        else if (input$exercise_6_page_radio_button == 'equal_to_x') {
          probability <- 0
        } else if (input$exercise_6_page_radio_button == 'greater_than_x_and_less_then_y') {
          x <- input$exercise_6_page_greater_than_x_and_less_then_y_x_value
          y <-
            input$exercise_6_page_greater_than_x_and_less_then_y_y_value
          
          if (!(x < y)) {
            showNotification("The value of x should be strictly less than the value of y!",
                             type = 'error')
            return(NULL)
          }
          
          probability <-
            punif(y, cont.uniform.dist.a, cont.uniform.dist.b) - punif(x, cont.uniform.dist.a, cont.uniform.dist.b)
        }
        else if (input$exercise_6_page_radio_button == 'greater_or_equal_than_x_and_less_then_y') {
          x <-
            input$exercise_6_page_greater_or_equal_than_x_and_less_then_y_x_value
          y <-
            input$exercise_6_page_greater_or_equal_than_x_and_less_then_y_y_value
          
          if (!(x < y)) {
            showNotification("The value of x should be strictly less than the value of y!",
                             type = 'error')
            return(NULL)
          }
          
          probability <-
            punif(y, cont.uniform.dist.a, cont.uniform.dist.b) - punif(x, cont.uniform.dist.a, cont.uniform.dist.b)
        }
        else if (input$exercise_6_page_radio_button == 'greater_than_x_and_less_or_equal_then_y') {
          x <-
            input$exercise_6_page_greater_than_x_and_less_or_equal_then_y_x_value
          y <-
            input$exercise_6_page_greater_than_x_and_less_or_equal_then_y_y_value
          
          if (!(x < y)) {
            showNotification("The value of x should be strictly less than the value of y!",
                             type = 'error')
            return(NULL)
          }
          
          probability <-
            punif(y, cont.uniform.dist.a, cont.uniform.dist.b) - punif(x, cont.uniform.dist.a, cont.uniform.dist.b)
        }
        else if (input$exercise_6_page_radio_button == 'greater_or_equal_than_x_and_less_or_equal_then_y') {
          x <-
            input$exercise_6_page_greater_or_equal_than_x_and_less_or_equal_then_y_x_value
          y <-
            input$exercise_6_page_greater_or_equal_than_x_and_less_or_equal_then_y_y_value
          
          if (!(x < y)) {
            showNotification("The value of x should be strictly less than the value of y!",
                             type = 'error')
            return(NULL)
          }
          
          probability <-
            punif(y, cont.uniform.dist.a, cont.uniform.dist.b) - punif(x, cont.uniform.dist.a, cont.uniform.dist.b)
        }
      },
      'Beta distribution' = {
        beta.dist.alfa <- input$exercise_6_page_beta_dist_alfa
        beta.dist.beta <- input$exercise_6_page_beta_dist_beta
        
        if (beta.dist.alfa <= 0 | beta.dist.beta <= 0) {
          showNotification(
            "In the case of a beta distribution paramters alfa and beta should be strictly positive!",
            type = 'error'
          )
          return(NULL)
        }
        
        if (input$exercise_6_page_radio_button == 'less_than_x') {
          x <- input$exercise_6_page_less_than_x_value
          
          probability <-
            pbeta(x, beta.dist.alfa, beta.dist.beta)
        } else if (input$exercise_6_page_radio_button == 'less_or_equal_than_x') {
          x <- input$exercise_6_page_less_or_equal_than_x_value
          
          probability <-
            pbeta(x, beta.dist.alfa, beta.dist.beta)
        }
        else if (input$exercise_6_page_radio_button == 'greater_than_x') {
          x <- input$exercise_6_page_greater_than_x_value
          
          probability <-
            1 - pbeta(x, beta.dist.alfa, beta.dist.beta)
        } else if (input$exercise_6_page_radio_button == 'greater_or_equal_than_x') {
          x <- input$exercise_6_page_greater_or_equal_than_x_value
          
          probability <-
            1 - pbeta(x, beta.dist.alfa, beta.dist.beta)
        }
        else if (input$exercise_6_page_radio_button == 'equal_to_x') {
          probability <- 0
        } else if (input$exercise_6_page_radio_button == 'greater_than_x_and_less_then_y') {
          x <- input$exercise_6_page_greater_than_x_and_less_then_y_x_value
          y <-
            input$exercise_6_page_greater_than_x_and_less_then_y_y_value
          
          if (!(x < y)) {
            showNotification("The value of x should be strictly less than the value of y!",
                             type = 'error')
            return(NULL)
          }
          
          probability <-
            pbeta(y, beta.dist.alfa, beta.dist.beta) - pbeta(x, beta.dist.alfa, beta.dist.beta)
        }
        else if (input$exercise_6_page_radio_button == 'greater_or_equal_than_x_and_less_then_y') {
          x <-
            input$exercise_6_page_greater_or_equal_than_x_and_less_then_y_x_value
          y <-
            input$exercise_6_page_greater_or_equal_than_x_and_less_then_y_y_value
          
          if (!(x < y)) {
            showNotification("The value of x should be strictly less than the value of y!",
                             type = 'error')
            return(NULL)
          }
          
          probability <-
            pbeta(y, beta.dist.alfa, beta.dist.beta) - pbeta(x, beta.dist.alfa, beta.dist.beta)
        }
        else if (input$exercise_6_page_radio_button == 'greater_than_x_and_less_or_equal_then_y') {
          x <-
            input$exercise_6_page_greater_than_x_and_less_or_equal_then_y_x_value
          y <-
            input$exercise_6_page_greater_than_x_and_less_or_equal_then_y_y_value
          
          if (!(x < y)) {
            showNotification("The value of x should be strictly less than the value of y!",
                             type = 'error')
            return(NULL)
          }
          
          probability <-
            pbeta(y, beta.dist.alfa, beta.dist.beta) - pbeta(x, beta.dist.alfa, beta.dist.beta)
        }
        else if (input$exercise_6_page_radio_button == 'greater_or_equal_than_x_and_less_or_equal_then_y') {
          x <-
            input$exercise_6_page_greater_or_equal_than_x_and_less_or_equal_then_y_x_value
          y <-
            input$exercise_6_page_greater_or_equal_than_x_and_less_or_equal_then_y_y_value
          
          if (!(x < y)) {
            showNotification("The value of x should be strictly less than the value of y!",
                             type = 'error')
            return(NULL)
          }
          
          probability <-
            pbeta(y, beta.dist.alfa, beta.dist.beta) - pbeta(x, beta.dist.alfa, beta.dist.beta)
        }
      }
    )
    
    if (is.null(probability)) {
      return(NULL)
    }
    
    output$exercise_6_page_probability_output <-
      renderText(paste0('Probability=', round(probability * 100, 2), '%'))
    
    show('exercise_6_page_probability_output')
  }) %>%
    invisible()
  
  return(NULL)
}