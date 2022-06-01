HowToUseThisAppPageContent <- function() {
  fluid.page <- fluidPage(tags$div(
    h1("How to use this app", align = 'center'),
    br(),
    h2("Exercise 1"),
    p(
      "Steps to follow:",
      br(),
      HTML(
        "<ul>
        <li>load a csv file with numerical content (except for the header)</li>
        <li>select the column name of the variable of interest</li>
        <li>press the run button</li>
        </ul>"
      ),
      "The output consists of:",
      HTML(
        "<ul>
        <li>statistics summary: mean and quartiles</li>
        <li>distribution of the data (histogram)</li>
        <li>boxplot diagram</li>
        </ul>"
      )
    )
  ))
  
  return(fluid.page)
}
