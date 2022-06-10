Exercise3PageContent <- function() {
  fluid.page <- fluidPage(
    useShinyjs(),
    h1("Exercise 3", align = 'center'),
    
    # ## TODO: idea:
    # inputs:
    #   distribution name
    #   number of parameters:
    #     For each: name
    #   type
    #   description
    #   formulas/values for:
    #     mean
    #     variance
    #     median
    #     mode
    #     skewness
    #     excess_kurtosis
    # add distribution to list
    # 
    # output:
    #   select distribution from list -> add each parameter -> same output as ex 2
    #
    # To transform input text to function: https://stackoverflow.com/questions/15260245/r-convert-text-field-to-function
  
    textInput(
      'exercise_3_page_distribution_name',
      label = 'Distribution name:',
      placeholder = 'Name'
    ),
    numericInput(
      'exercise_3_page_nr_parameters',
      label = 'Number of distribution parameters',
      value=1
    ),
    ## TODO: nr of parameter names to input should depend on parameter number!
    textInput(
      'exercise_3_page_parameter_name',
      label = 'Parameter name',
      placeholder = 'Parameter'
    ),
    checkboxInput(
      'exercise_3_page_is_continuous',
      label = 'Distribution type (0 - discrete, 1 - continuous)',
      value = FALSE
    ),
    textInput(
      'exercise_3_page_description',
      label = 'Distribution description',
      placeholder = 'Description'
    ),
    textInput(
      'exercise_3_page_mean',
      label = 'Distribution mean',
      placeholder = '0'
    ),
    textInput(
      'exercise_3_page_variance',
      label = 'Distribution variance',
      placeholder = '0'
    ),
    textInput(
      'exercise_3_page_median',
      label = 'Distribution median',
      placeholder = '0'
    ),
    textInput(
      'exercise_3_page_mode',
      label = 'Distribution mode',
      placeholder = '0'
    ),
    textInput(
      'exercise_3_page_skewness',
      label = 'Distribution skewness',
      placeholder = '0'
    ),
    textInput(
      'exercise_3_page_kurtosis',
      label = 'Distribution excess kurtosis',
      placeholder = '0'
    ),
    textInput(
      'exercise_3_page_PDF',
      label = 'Input PDF:',
      placeholder = 'x ** 2'
    ),
    textInput(
      'exercise_3_page_CDF',
      label = 'Input CDF:',
      placeholder = 'x ** 2'
    ),
    actionButton('exercise_3_page_action_button',
                 'Add distribution',
                 icon = icon('play')) %>%
      hidden(),
  )
  ## TODO: Add output
      
      
  return (fluid.page)
}