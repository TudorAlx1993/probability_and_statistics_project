AboutPageContent <- function() {
  fluid.page <- fluidPage(
    h1("About this app", align = 'center'),
    br(),
    h2("Summary"),
    p(
      "This R application simulates different operations on random variables.",
      br(),
      'The GUI was built using the Shiny package.'
    ),
    h2("Team members"),
    HTML(
      "<ul>
         <li>Tudor-Alexandru Alexandrescu (coordinator)</li>
         <li>Radu Andrei Dumitru</li>
         <li>Raluca Brinceanu</li>
         <li>Robert Samata</li>
         </ul>"
    ),
  )
  
  return(fluid.page)
}
