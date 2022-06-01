# Project: Random variables using Shiny
# R version: 4.0.2 (Taking Off Again) or higher
# OS: Windows 10, Unix like systems

# global configurations
cat('\f')
rm(list = ls())
try(dev.off(), silent = TRUE)
options(scipen = 999)
# only for R version < 4.0.0
options(stringsAsFactors = FALSE)

# load into the global environment R functions defined within the R files
r.files <-
  setdiff(list.files(
    './src',
    pattern = '.R',
    full.names = TRUE,
    recursive = TRUE
  ),
  './src/main.R')
invisible(lapply(r.files, source))

# install (if needed) and load the below defined R packages
packages <- c('ggplot2', 
              'shiny', 
              'purrr',
              'shinydashboard',
              'magrittr',
              'tools',
              'shinyjs')
invisible(InstallAndLoadPackages(packages))

# start the shiny app
shinyApp(ui=UserInterface,server = Server)
