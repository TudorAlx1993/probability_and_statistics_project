UserInterface <- function() {
  dashboard.page <-
    dashboardPage(
      header = dashboardHeader(title = "Menu"),
      sidebar = DashboardSidebar(),
      body = DashboardBody(),
      title = 'Working with random variables'
    )
  
  return(dashboard.page)
}