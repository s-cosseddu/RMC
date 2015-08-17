#' Quick Color Filled Contour Plot
#'
#' Quickly create Color Filled Contour Plot from three 
#' @param x input data, as 3d matrix or x vector
#' @param y vector if x is a vector (default NULL)
#' @param z  vector if x is a vector (default NULL)
#' @param Nlev Number of color levels (default 10)
#' @param Nlev.con Number of contour levels (default=Nlev)
#' @param ... Additional arguments passed to filled.contour()
#' @export
#' @examples
#' fes <- read.table("fes.dat")
#' qfilled.contour(fes, Nlev=100, Nlev.con=10, color=rainbow(100), xlab="d71", ylab="d64")


qfilled.contour <- function(x, y=NULL, z=NULL, Nlev=10, Nlev.con=Nlev, ...) { 
    
    if ( is.vector(x) ) {
        xx <- x
        yy <- y
        zz <- z
    } else {
        xx <- x[,1]
        yy <- x[,2]
        zz <- x[,3]
    } 
                
    filled.contour(x=xx,
                   y=yy,
                   z=zz,
                                        #xrange=range(0,10),
                   nlevels = Nlev,
                   plot.axes = {
                       axis (side=1)
                       axis (side=2)
                       contour(x=xx, y=yy, z=zz, add = TRUE, col = "gray40",
                               lwd = 1,nlevels = Nlev.con, drawlabels = F, lty = "solid",
                               method = "edge", vfont = c("sans serif", "bold"))
                   },
                   ...)
    
    return()
    
}
