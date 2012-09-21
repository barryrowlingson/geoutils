pathlength <- function(pts){

  dx = diff(pts$x)^2
  dy = diff(pts$y)^2
  d = sqrt(dx+dy)
  return(c(0,cumsum(d)))
  
}
