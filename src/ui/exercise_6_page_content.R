Exercise6PageContent <- function() {
  fluid.page <- fluidPage(
    useShinyjs(),
    h1("Exercise 6", align = 'center'),
    h2("Implementing the P function from discreteRV package", align = 'center'),
    selectInput(
      'exercise_6_page_select_dist_name',
      label = 'Select the probability distribution',
      choices = c('', UsedProbabilityDistributions()),
      selected = ''
    ),
    conditionalPanel(
      condition = "input.exercise_6_page_select_dist_name=='Normal distribution'",
      numericInput(
        'exercise_6_page_normal_dist_mean',
        label = 'Mean',
        value = 0
      ),
      numericInput(
        'exercise_6_page_normal_dist_sigma',
        label = 'Sigma',
        value = 1,
        min = 10 ** -4
      )
    ),
    conditionalPanel(
      condition = "input.exercise_6_page_select_dist_name=='Lognormal distribution'",
      numericInput(
        'exercise_6_page_lognormal_dist_miu',
        label = 'Miu',
        value = 0
      ),
      numericInput(
        'exercise_6_page_lognormal_dist_sigma',
        label = 'Sigma',
        value = 1,
        min = 10 ** -4
      )
    ),
    conditionalPanel(
      condition = "input.exercise_6_page_select_dist_name=='Exponential distribution'",
      numericInput(
        'exercise_6_page_exp_dist_lambda',
        label = 'Lambda',
        value = 1,
        min = 10 ** -4
      )
    ),
    conditionalPanel(
      condition = "input.exercise_6_page_select_dist_name=='Gamma distribution'",
      numericInput(
        'exercise_6_page_gamma_dist_shape',
        label = 'Shape',
        value = 1,
        min = 10 ** -4
      ),
      numericInput(
        'exercise_6_page_gamma_dist_scale',
        label = 'Scale',
        value = 1,
        min = 10 ** -4
      )
    ),
    conditionalPanel(
      condition = "input.exercise_6_page_select_dist_name=='Poisson distribution'",
      numericInput(
        'exercise_6_page_poisson_dist_lambda',
        label = 'Lambda',
        value = 1,
        min = 10 ** -4
      )
    ),
    conditionalPanel(
      condition = "input.exercise_6_page_select_dist_name=='Binomial distribution'",
      numericInput(
        'exercise_6_page_binomial_dist_n',
        label = 'n',
        value = 10,
        min = 0
      ),
      numericInput(
        'exercise_6_page_binomial_dist_p',
        label = 'p',
        value = 0.5,
        min = 0,
        max = 1
      )
    ),
    conditionalPanel(
      condition = "input.exercise_6_page_select_dist_name=='Uniform distribution'",
      numericInput(
        'exercise_6_page_uniform_dist_a',
        label = 'a',
        value = 0
      ),
      numericInput(
        'exercise_6_page_uniform_dist_b',
        label = 'b',
        value = 1
      )
    ),
    conditionalPanel(
      condition = "input.exercise_6_page_select_dist_name=='Beta distribution'",
      numericInput(
        'exercise_6_page_beta_dist_alfa',
        label = 'Alfa',
        value = 1,
        min = 10 ** -4
      ),
      numericInput(
        'exercise_6_page_beta_dist_beta',
        label = 'Beta',
        value = 2,
        min = 10 ** -4
      )
    ),
    br(),
    radioButtons(
      'exercise_6_page_radio_button',
      label = 'Select the probability of interest',
      choices = c(
        'P(X<x)' = 'less_than_x',
        'P(X<=x)' = 'less_or_equal_than_x',
        'P(X>x)' = 'greater_than_x',
        'P(X>=x)' = 'greater_or_equal_than_x',
        'P(X=x)' = 'equal_to_x',
        'P(x<X<y)' = 'greater_than_x_and_less_then_y',
        'P(x<=X<y)' = 'greater_or_equal_than_x_and_less_then_y',
        'P(x<X<=y)' = 'greater_than_x_and_less_or_equal_then_y',
        'P(x<=X<=y)' = 'greater_or_equal_than_x_and_less_or_equal_then_y'
      ),
      selected = ''
    ) %>%
      hidden(),
    conditionalPanel(
      condition = "input.exercise_6_page_radio_button=='less_than_x'",
      numericInput(
        'exercise_6_page_less_than_x_value',
        label = 'x',
        value = 2,
        min = 10 ** -4
      )
    ),
    conditionalPanel(
      condition = "input.exercise_6_page_radio_button=='equal_to_x'",
      numericInput(
        'exercise_6_page_equal_to_x_value',
        label = 'x',
        value = 2,
        min = 10 ** -4
      )
    ),
    conditionalPanel(
      condition = "input.exercise_6_page_radio_button=='less_or_equal_than_x'",
      numericInput(
        'exercise_6_page_less_or_equal_than_x_value',
        label = 'x',
        value = 2,
        min = 10 ** -4
      )
    ),
    conditionalPanel(
      condition = "input.exercise_6_page_radio_button=='greater_than_x'",
      numericInput(
        'exercise_6_page_greater_than_x_value',
        label = 'x',
        value = 2,
        min = 10 ** -4
      )
    ),
    conditionalPanel(
      condition = "input.exercise_6_page_radio_button=='greater_or_equal_than_x'",
      numericInput(
        'exercise_6_page_greater_or_equal_than_x_value',
        label = 'x',
        value = 2,
        min = 10 ** -4
      )
    ),
    conditionalPanel(
      condition = "input.exercise_6_page_radio_button=='greater_than_x_and_less_then_y'",
      numericInput(
        'exercise_6_page_greater_than_x_and_less_then_y_x_value',
        label = 'x',
        value = 2,
        min = 10 ** -4
      ),
      numericInput(
        'exercise_6_page_greater_than_x_and_less_then_y_y_value',
        label = 'y',
        value = 2,
        min = 10 ** -4
      )
    ),
    conditionalPanel(
      condition = "input.exercise_6_page_radio_button=='greater_or_equal_than_x_and_less_then_y'",
      numericInput(
        'exercise_6_page_greater_or_equal_than_x_and_less_then_y_x_value',
        label = 'x',
        value = 2,
        min = 10 ** -4
      ),
      numericInput(
        'exercise_6_page_greater_or_equal_than_x_and_less_then_y_y_value',
        label = 'y',
        value = 2,
        min = 10 ** -4
      )
    ),
    conditionalPanel(
      condition = "input.exercise_6_page_radio_button=='greater_than_x_and_less_or_equal_then_y'",
      numericInput(
        'exercise_6_page_greater_than_x_and_less_or_equal_then_y_x_value',
        label = 'x',
        value = 2,
        min = 10 ** -4
      ),
      numericInput(
        'exercise_6_page_greater_than_x_and_less_or_equal_then_y_y_value',
        label = 'y',
        value = 2,
        min = 10 ** -4
      )
    ),
    conditionalPanel(
      condition = "input.exercise_6_page_radio_button=='greater_or_equal_than_x_and_less_or_equal_then_y'",
      numericInput(
        'exercise_6_page_greater_or_equal_than_x_and_less_or_equal_then_y_x_value',
        label = 'x',
        value = 2,
        min = 10 ** -4
      ),
      numericInput(
        'exercise_6_page_greater_or_equal_than_x_and_less_or_equal_then_y_y_value',
        label = 'y',
        value = 2,
        min = 10 ** -4
      )
    ),
    actionButton(
      'exercise_6_page_action_button',
      label = 'Run',
      icon = icon('play')
    ) %>%
      hidden(),
    br(),
    br(),
    textOutput('exercise_6_page_probability_output') %>%
      hidden()
  )
  
  return(fluid.page)
}
