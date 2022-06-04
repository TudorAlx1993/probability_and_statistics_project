DashboardSidebar <- function() {
  dashboard.sidebar <- dashboardSidebar(sidebarMenu(
    menuItem(
      'Exercise 1',
      tabName = 'dashboard_sidedar_menu_exercise_1',
      icon = icon('table', verify_fa = FALSE)
    ),
    menuItem(
      'Exercise 2',
      tabName = 'dashboard_sidedar_menu_exercise_2',
      icon = icon('table', verify_fa = FALSE)
    ),
    menuItem(
      'Exercise 3',
      tabName = 'dashboard_sidedar_menu_exercise_3',
      icon = icon('table', verify_fa = FALSE)
    ),
    menuItem(
      'Exercise 4',
      tabName = 'dashboard_sidedar_menu_exercise_4',
      icon = icon('table', verify_fa = FALSE)
    ),
    menuItem(
      'Exercise 5',
      tabName = 'dashboard_sidedar_menu_exercise_5',
      icon = icon('table', verify_fa = FALSE)
    ),
    # menuItem(
    #   'Exercise 6',
    #   tabName = 'dashboard_sidedar_menu_exercise_6',
    #   icon = icon('table', verify_fa = FALSE)
    # ),
    menuItem(
      'Exercise 7',
      tabName = 'dashboard_sidedar_menu_exercise_7',
      icon = icon('table', verify_fa = FALSE)
    ),
    # menuItem(
    #   'Exercise 8',
    #   tabName = 'dashboard_sidedar_menu_exercise_8',
    #   icon = icon('table', verify_fa = FALSE)
    # ),
    # menuItem(
    #   'Exercise 9',
    #   tabName = 'dashboard_sidedar_menu_exercise_9',
    #   icon = icon('table', verify_fa = FALSE)
    # ),
    # menuItem(
    #   'Exercise 10',
    #   tabName = 'dashboard_sidedar_menu_exercise_10',
    #   icon = icon('table', verify_fa = FALSE)
    # ),
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
