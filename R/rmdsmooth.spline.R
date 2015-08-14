#' Quick smoothing with spline
#'
#' Perform the fit to a cubic smoothing spline and the prediction of the smoothed curved in a single step.  
#'
#' @param x a vector of  a two column matrix for smooth.spline() 
#' @param y needed only if x is a vector (default NULL)
#' @param nx number of x points for the smoothed curve, supplied to predict()  
#' @param ... additional arguments passed to smooth.spline
#' 
#' @examples
#' x<-read.table("data")
#' plot(rmdsmooth.spline(x, 80))


rmdsmooth.spline <- function(x, y=NULL, nx,...) {
  ## smoothing
  s <- smooth.spline(x, y, ...)
  s <- predict(s, seq(min(x),max(x),length.out=nx))
  return(s)
}
