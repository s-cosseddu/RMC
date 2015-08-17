#' Color Filled Contour Plot with multiple options
#'
#' Create Filled Contour Plot providing a number of useful option on
#' top of the standard functions. Number of contour levels (Nlev.con)
#' is automatically computed as
#'           Nlev.con <- (max.level - min.level)*scaleLev
#' 
#' @param x input data, as 3d matrix or x vector
#' @param y vector if x is a vector (default NULL)
#' @param z  vector if x is a vector (default NULL)
#' @param scaleLev Used to compute Nlev.con, see description, (default=1)
#' @param Nlev Number of color levels. Using Nlev=NULL (default) means Nlev=Nlev.con (as in the description)
#' @param hlines y intercepts of horizontal lines to draw on top of the plot
#' @param vlines x intercepts of vertical lines to draw on top of the plot
#' @param linessize line width of the optional vertical and horizontal lines (default 1)
#' @param sizeaxis see cex.axis (default 1.6)
#' @param contlwd line width of the contour lines (default 1)
#' @param ... Additional arguments passed to filled.contour()
#' @export
#' @examples
#' pmf <- read.table("pmf.dat")
#' names(pmf) <- c("zK12","zK3", "fes")
#' pmfmatrix <- acast(pmf, zK12 ~ zK3 )
#' pmf.x <- as.numeric(rownames(pmfmatrix) )
#' pmf.y <- as.numeric( colnames(pmfmatrix) )
#' fillcont.lines(pmf.x, pmf.y, pmfmatrix, Nlev=100,Nlev.con=3, color=palette.redtoblue, ylab=expression(z[K3]), xlab=expression(xy[K3]))

filled.contour.lines <- function(x, y=NULL, z=NULL, Nlev=NULL, scaleLev=1, hlines=NULL, vlines=NULL, linessize=1, sizeaxis=1.6, contlwd=1, ...) { 

    if ( is.vector(x) ) {
        xx <- x
        yy <- y
        zz <- z
    } else {
        xx <- x[,1]
        yy <- x[,2]
        zz <- x[,3]
    } 

    
  ## computing levels for the contours
  max.level <- round(max(na.omit(zz[!is.infinite(z)])))
  min.level <- round(min(na.omit(zz[!is.infinite(z)])))
  Nlev.con <- (max.level - min.level)*scaleLev
  print("levels for contour:")
  print(Nlev.con)
  if (is.null(Nlev)) {
    Nlev=Nlev.con
  }

  ## allow bigger font
  par.orig <- par(c("mar", "mgp"))
  on.exit(par(par.orig))

  mar <- par.orig$mar
  mar[2L] <- mar[2L] + sizeaxis
  mgp <- par.orig$mgp
  mgp[1L] <- mgp[1L] + (sizeaxis/2.) - 0.2 
  par(mar=mar)
  par(mgp=mgp)
    
  rmdfilled.contour(x=xx,
           y=yy,
           z=zz,
                                        #xrange=range(0,10),
           nlevels = Nlev,
           plot.axes = {
             axis (side=1,cex.axis=sizeaxis, cex.lab=sizeaxis)
             axis (side=2,cex.axis=sizeaxis, cex.lab=sizeaxis)
             contour(x=xx, y=yy, z=zz, add = TRUE, col = "gray40",
                     lwd = contlwd,nlevels = Nlev.con, drawlabels = F, lty = "solid",
                     method = "edge", vfont = c("sans serif", "bold"))
             if (!is.null(hlines)) {
               abline(h=hlines, lwd=linessize)
             }
             if (!is.null(vlines)) {
               abline(v=vlines, lwd=linessize)
             }
           },
           cexlegend=sizeaxis,
           cex.lab=sizeaxis,
           ...)
  
  return()
}


