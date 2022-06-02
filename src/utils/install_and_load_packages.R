InstallAndLoadPackages <- function(packages) {
  already.installed.packeges <- row.names(installed.packages())
  packages.to.install <-
    packages[!(packages %in% already.installed.packeges)]
  
  if (length(packages.to.install) > 0) {
    suppressWarnings(install.packages(packages.to.install))
  }
  
  suppressWarnings(lapply(packages, library, character.only = TRUE))
  
  return(NULL)
}