DashboardSidebar <- function() {
  dashboard.sidebar <- dashboardSidebar(sidebarMenu(
    menuItem(
      "Exercise 1",
      tabName = 'dashboard_sidedar_menu_exercise_1',
      icon = icon('table', verify_fa = FALSE)
    ),
    menuItem(
      'How to use this app',
      tabName = 'dashboard_sidebar_menu_how_to_use_this_app',
      icon = icon('mortar-board', verify_fa = FALSE)
    ),
    menuItem(
      "About this app",
      tabName = 'dashboard_sidebar_menu_about',
      icon = icon('question', verify_fa = FALSE)
    )
  ))
  
  return(dashboard.sidebar)
}
