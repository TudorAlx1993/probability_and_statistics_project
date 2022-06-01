DashboardBody <- function() {
  dashboard.body <-
    dashboardBody(tabItems(
      tabItem(tabName = 'dashboard_sidedar_menu_exercise_1',
              Exercise1PageContent()),
      tabItem(tabName = 'dashboard_sidebar_menu_how_to_use_this_app',
              HowToUseThisAppPageContent()),
      tabItem(tabName = 'dashboard_sidebar_menu_about',
              AboutPageContent())
    ))
  
  return(dashboard.body)
}
