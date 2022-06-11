HowToUseThisAppPageContent <- function() {
  fluid.page <- fluidPage(tags$div(
    h1("How to use this app", align = 'center'),
    br(),
    h2("Exercise 1: analysis of numerical data"),
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
    ),
    h2(
      "Exercise 2: viewing discrete and continuous probability distribution"
    ),
    p(
      "Steps to follow:",
      br(),
      HTML(
        "<ul>
        <li>select the distribution name</li>
        <li>set the values for the distribution's parameters</li>
        <li>press the run button</li>
        </ul>"
      ),
      "The output consists of:",
      HTML(
        "<ul>
        <li>information related to the selected distribution</li>
        <li>some statistical indicators related to the distribution</li>
        <li>plots related to PDF (or PMF) and CDF functions</li>
        </ul>"
      )
    ),
    h2("Exercise 5"),
    p(
      h3("Plot discrete random variable"),
      "To input data:",
      br(),
      HTML(
        "<ul>
        <li>load a csv file with numerical content representing a discrete random variable (except for the header)</li>
        <li>If needed for better visualisation, select a starting position from which to plot variable (plots entire variable by default)</li>
        <li>press the run button</li>
        </ul>"
      ),
      "The page will output a plot of the inputed discrete random variable, starting from the desired position."
    ),
    h2(
      "Exercise 6: implementing the P function from discreteRV package"
    ),
    p(
      "Steps to follow:",
      br(),
      HTML(
        "<ul>
        <li>select the distribution name</li>
        <li>set the values for the distribution's parameters</li>
        <li>select the type of probability you are interested of (e.g.: P(X<x), P(x<X<y), etc)</li>
        <li>set the x and y parameters</li>
        <li>press the run button</li>
        </ul>"
      ),
      "The output contains the evaluated probability.",
    ),
    h2("Exercise 7"),
    p(
      h3("Operations on discrete random variables"),
      "To input data:",
      br(),
      HTML(
        "<ul>
        <li>load two csv files with numerical content (except for the header) representing two independent discrete random variables, A and B</li>
        <li>select desired operation</li>
        <li>press the run button</li>
        </ul>"
      ),
      "The page will plot the result of the selected operation between the two inputed variables."
    ),
  ))
  
  return(fluid.page)
}
