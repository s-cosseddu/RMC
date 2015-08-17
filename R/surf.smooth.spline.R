#' Quick surface smoothing with thin plate spline
#'
#' Perform the fit of the provided data to a thin plate spline surface as implemented in the function Tps()
#' of package Fields and return the prediction of the smoothed surface.
#'
#' @param x,y,z surface data
#' @param reshape reshape if the provided data are not in a format good for Tps() (i.e. melt) (default F)
#' @param nx,ny grid for the final smoothed surface, supplied to predict.surface()
#' @param ... additional arguments passed to smooth.spline
#' @export
#' @examples
#' pmfmatrix <- acast(pmf, xyK3 ~ zK3 )
#' pmf.x <- as.numeric( rownames(pmfmatrix) )
#' pmf.y <- as.numeric( colnames(pmfmatrix) )
#' pmf.z <- pmfmatrix
#' ## setting ylimits before smoothing...
#' xmin <- -1
#' xmax <- 6
#' ymin <- -17
#' ymax <- -3
#' id.x <- which(pmf.x>xmin & pmf.x<xmax)
#' id.y <- which(pmf.y>ymin & pmf.y<ymax)
#'
#' ## smoothing
#' surf <- surf.spline.smooth(pmf.x[id.x], pmf.y[id.y], pmf.z[id.x,id.y], reshape=T, nx=70, ny=70)
#' fillcont.lines(surf$x, surf$y, surf$z-min(na.omit(surf$z)),border=F, Nlev=100,scaleLev=scaleLev, color=palette.redtoblue, ylab=expression(z[K3]), xlab=expression(xy[K3]))

surf.spline.smooth <- function(x, y, z, reshape=F, nx=80, ny=80, ...) {
    require(fields)

    if (reshape) {
        Z <- as.vector(z)
        nZ <- length(Z)
        nX <- length(x)
        nY <- length(y)
        
        XY <- data.frame(x=as.numeric(gl(nX,1,nZ)),y=as.numeric(gl(nY,nX,nZ)))
    } else {
        Z <- as.vector(z)
        XY <- cbind (x, y)
    }
    t <- Tps(XY,Z,...) 
    
    surf <- predict.surface(t, nx=nx , ny=ny)
    smooth.x <- seq(min(x), max(x), length.out=nx)
    smooth.y <- seq(min(y), max(y), length.out=ny)
    smooth.z <- surf$z
    return (list(
        x=smooth.x,
        y=smooth.y,
        z=smooth.z#,
                                        #nx=nx,
                                        #ny=ny
    )
            )

}
