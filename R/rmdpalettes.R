#' Palettes of RMD package
#'
#' As per title
#' 
#' @param x length of the palette
#'
#' @examples
#' red2blue.rmcpalettes(100)

red2blue.rmcpalettes <- function(x) {rev(rainbow(x, start=0.0, end=0.66))}
