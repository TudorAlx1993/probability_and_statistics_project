DashboardBody <- function() {
  dashboard.body <-
    dashboardBody(tabItems(
      tabItem(tabName = 'dashboard_sidedar_menu_exercise_1',
              Exercise1PageContent()),
      tabItem(tabName = 'dashboard_sidedar_menu_exercise_2',
              Exercise2PageContent()),
      tabItem(tabName = 'dashboard_sidedar_menu_exercise_3',
              Exercise3PageContent()),
      tabItem(tabName = 'dashboard_sidedar_menu_exercise_4',
              Exercise4PageContent()),
      tabItem(tabName = 'dashboard_sidedar_menu_exercise_5',
              Exercise5PageContent()),
      # tabItem(tabName = 'dashboard_sidedar_menu_exercise_6',
      #         Exercise6PageContent()),
      tabItem(tabName = 'dashboard_sidedar_menu_exercise_7',
              Exercise7PageContent()),
      # tabItem(tabName = 'dashboard_sidedar_menu_exercise_8',
      #         Exercise8PageContent()),
      # tabItem(tabName = 'dashboard_sidedar_menu_exercise_9',
      #         Exercise9PageContent()),
      # tabItem(tabName = 'dashboard_sidedar_menu_exercise_10',
      #         Exercise10PageContent()),
      tabItem(tabName = 'dashboard_sidebar_menu_how_to_use_this_app',
              HowToUseThisAppPageContent()),
      tabItem(tabName = 'dashboard_sidebar_menu_about',
              AboutPageContent())
    ))
  
  return(dashboard.body)
}
