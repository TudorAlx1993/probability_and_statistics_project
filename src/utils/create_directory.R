CreateDirectory <- function(dir.name) {
  if (!file.exists(dir.name)) {
    dir.create(dir.name)
  }
  
  return(NULL)
}