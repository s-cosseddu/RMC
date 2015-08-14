#' Simple moving average procedure
#'
#' Apply a moving average procedure on time series 
#' @param x any object containing the time series (es. data.frame, ts)
#' @param window.length length of the windows on which averages are computed
#' @export
#' @examples
#' infile <- "test.data"
#' window.ll <- 20
#' 
#' x <- read.table(infile)
#' x <- ma(x, window.ll)
#' write.table(x,file=paste("ma",infile,sep="_"), quote=F, row.names=F, col.names=F)

ma <- function(x, window.length) {
    ## perform simple moving average smoothing
    colnms <- colnames(x)
    k <- rep(1/window.length, window.length) #filter
    x.ma <- as.matrix(na.omit(filter(x,k,sides=2)))  #filtered traj
    colnames(x.ma) <- colnms 
    return (as.data.frame(x.ma))
}
