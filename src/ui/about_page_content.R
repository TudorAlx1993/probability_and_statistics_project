AboutPageContent<-function(){
  fluid.page<-fluidPage(tags$div(
    h1("About this app",align='center'),
    br(),
    h2("Summary"),
    p("This R application simulates different operations on random variables.",
      br(),
      'The GUI was build using the Shiny package.'),
    h2("Team members"),
    HTML("<ul>
         <li>Tudor-Alexandru Alexandrescu (coordinator)</li>
         <li>Radu Andrei Dumitru</li>
         <li>Raluca Branceanu</li>
         <li>Robert Samata</li>
         </ul>"),
    ))
  
  return(fluid.page)
}
