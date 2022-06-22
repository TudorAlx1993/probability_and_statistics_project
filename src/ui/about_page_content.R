AboutPageContent <- function() {
  fluid.page <- fluidPage(
    h1("About this app", align = 'center'),
    br(),
    h2("Summary"),
    p(
      "This R application simulates different operations on random variables.",
      br(),
      'The GUI was built using the Shiny package.'
    )
  )
  
  return(fluid.page)
}
