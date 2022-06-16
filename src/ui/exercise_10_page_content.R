Exercise10PageContent <- function() {
  fluid.page <- fluidPage(
    useShinyjs(),
    h1("Exercise 10", align = 'center'),
    h2("Calculate mean and variance of g(X)", align = 'center'),
    br(),
    selectInput(
      'exercise_10_page_select_dist_name',
      label = 'Select the probability distribution',
      choices = c('', UsedProbabilityDistributions()),
      selected = ''
    ),
    conditionalPanel(
      condition = "input.exercise_10_page_select_dist_name=='Normal distribution'",
      numericInput(
        'exercise_10_page_normal_dist_mean',
        label = 'Mean',
        value = 0
      ),
      numericInput(
        'exercise_10_page_normal_dist_sigma',
        label = 'Sigma',
        value = 1,
        min = 10 ** -4
      )
    ),
    conditionalPanel(
      condition = "input.exercise_10_page_select_dist_name=='Lognormal distribution'",
      numericInput(
        'exercise_10_page_lognormal_dist_miu',
        label = 'Miu',
        value = 0
      ),
      numericInput(
        'exercise_10_page_lognormal_dist_sigma',
        label = 'Sigma',
        value = 1,
        min = 10 ** -4
      )
    ),
    conditionalPanel(
      condition = "input.exercise_10_page_select_dist_name=='Exponential distribution'",
      numericInput(
        'exercise_10_page_exp_dist_lambda',
        label = 'Lambda',
        value = 1,
        min = 10 ** -4
      )
    ),
    conditionalPanel(
      condition = "input.exercise_10_page_select_dist_name=='Gamma distribution'",
      numericInput(
        'exercise_10_page_gamma_dist_shape',
        label = 'Shape',
        value = 1,
        min = 10 ** -4
      ),
      numericInput(
        'exercise_10_page_gamma_dist_scale',
        label = 'Scale',
        value = 1,
        min = 10 ** -4
      )
    ),
    conditionalPanel(
      condition = "input.exercise_10_page_select_dist_name=='Poisson distribution'",
      numericInput(
        'exercise_10_page_poisson_dist_lambda',
        label = 'Lambda',
        value = 1,
        min = 10 ** -4
      )
    ),
    conditionalPanel(
      condition = "input.exercise_10_page_select_dist_name=='Binomial distribution'",
      numericInput(
        'exercise_10_page_binomial_dist_n',
        label = 'n',
        value = 10,
        min = 0
      ),
      numericInput(
        'exercise_10_page_binomial_dist_p',
        label = 'p',
        value = 0.5,
        min = 0,
        max = 1
      )
    ),
    conditionalPanel(
      condition = "input.exercise_10_page_select_dist_name=='Uniform distribution'",
      numericInput(
        'exercise_10_page_uniform_dist_a',
        label = 'a',
        value = 0
      ),
      numericInput(
        'exercise_10_page_uniform_dist_b',
        label = 'b',
        value = 1
      )
    ),
    conditionalPanel(
      condition = "input.exercise_10_page_select_dist_name=='Beta distribution'",
      numericInput(
        'exercise_10_page_beta_dist_alfa',
        label = 'Alfa',
        value = 1,
        min = 10 ** -4
      ),
      numericInput(
        'exercise_10_page_beta_dist_beta',
        label = 'Beta',
        value = 2,
        min = 10 ** -4
      )
    ),
    textInput(
      'exercise_10_page_input_function',
      label = 'Enter the function g(x):',
      value = 'x'
    ) %>%
      hidden(),
    actionButton('exercise_10_page_action_button',
                 'Run',
                 icon = icon('play')) %>%
      hidden(),
    br(),
    br(),
    textOutput('exercise_10_page_text_output_mean'),
    textOutput('exercise_10_page_text_output_variance')
  )
  
  return(fluid.page)
}
