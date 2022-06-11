HowToUseThisAppPageContent <- function() {
  fluid.page <- fluidPage(tags$div(
    h1("How to use this app", align = 'center'),
    br(),
    h2("Exercise 1"),
    p(
      h3("Analysis of numerical data"),
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
    h2("Exercise 2"),
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
    h2("Exercise 8"),
    p(
      h3("Discrete random variable transformations"),
      "To use:",
      br(),
      HTML(
        "<ul>
        <li>load a csv file with numerical content representing a discrete random variable X (except for the header)</li>
        <li>input transformation function g(X) (make sure the only parameter is named capital X!)</li>
        <li>press the run button</li>
        </ul>"
      ),
      "The page will plot the result of the transformation."
    ),
    h2("Exercise 9"),
    p(
      h3("Compute transformed joint distribution of discrete random variables"),
      "This page calculates and prints the joint distribution of two discrete random variables, Z and T, calculated from an inputed joint distribution XandY.",
      br(),
      "To use:",
      br(),
      HTML(
        "<ul>
        <li>input joint distribution X,Y represented by 3 csv files containing 1 column each: values of X, values of Y, overall probabilities</li>
        <li>input functions for Z = g(XandY) and T = h(XandY) applied to joint distribution (each must result in discrete random variable!)</li>
        <li>press the run button</li>
        </ul>"
      ),
      "The page will print the joint distribution of the random variables Z and T, which are calculated using each of the input functions on the input joint distribution."
    )
  ))
  
  return(fluid.page)
}
