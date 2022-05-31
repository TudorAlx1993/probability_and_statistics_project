DashboardBody <- function() {
  dashboard.body <-
    dashboardBody(tabItems(
      tabItem(tabName = 'dashboard_sidebar_menu_about',
              AboutPageContent()),
      tabItem(tabName = 'dashboard_sidebar_menu_legend',
              LegendPageContent())
    ))
  
  return(dashboard.body)
}
