DashboardSidebar <- function() {
  dashboard.sidebar <- dashboardSidebar(sidebarMenu(
    menuItem(
      "About this app",
      tabName = 'dashboard_sidebar_menu_about',
      icon = icon('question',,verify_fa=FALSE)
    ),
    menuItem(
      'Legend',
      tabName = 'dashboard_sidebar_menu_legend',
      icon = icon('mortar-board',verify_fa=FALSE)
    )
  ))
  
  return(dashboard.sidebar)
}
