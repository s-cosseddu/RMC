#' Free Energy from Molecular Dynamics Distributions
#'
#' Given the distribution x of a degree of freedom of interest, the function computes the free energy at kT, according to 
#'
#'      F(x) = -kT*ln( pdf(x) ) + C
#' 
#' @param x normalised or unnormalised distribution of the given degree of freedom
#' @param kT (default 0.616)
#' @param zero.min set the zero at the minimum of the free energy (default T)
#' @param norm for debug normalisation of x can be disabled (default T)
#'
#' @examples
#' infile <- "test.data"
#' window.ll <- 20
#' 
#' x <- read.table(infile)
#' x <- ma(x, window.ll)
#' write.table(x,file=paste("ma",infile,sep="_"), quote=F, row.names=F, col.names=F)

free.energy <- function(x, kT=0.616, zero.min=T, norm=T) {
  if (norm) {
    ## FALSE just for test purpouses
    x <- x/sum(x)
  }
  
  ## computing fes
  fes <- -kT*log(x)

  ## setting the zero
  if (zero.min) {
    min.fes <- min(fes[!is.infinite(fes)])
    print("min value of fes")
    print(min.fes)
    fes <- fes - min.fes
  }

  max.fes <- max(fes[!is.infinite(fes)])
  print("max value of fes")
  print(max.fes)

  if (!zero.min) {
    max.fes <- max(fes[!is.infinite(fes)])
    print("max value of fes")
    print(zeroing.fes)
    fes <- fes - max.fes
    fes[is.infinite(fes)] <- 0
  } else {
    fes[is.infinite(fes)] <- max.fes
  }

  return(fes)
}
