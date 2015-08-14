#' Atom distances from Molecular Dynamics Trajectories7
#'
#' Take trajectory and pdb objects, 2 selection and return time series
#' of distances between the atom in selection1 and selection2 according
#' to sub and subseqB. It is based on bio3d functions.
#' @param pdb Structure object of class pdb as read by read.pdb() funcion of bio3d lib.
#' @param trj (Optional) trajectory as read by read.dcd() funcion of bio3d lib.
#' @param sel_string1 First selection of atom for bio3d function atom.select(), refer to manual (es. "///71///CD/")
#' @param sel_string1 Second selection of atom for bio3d function atom.select()
#' @param pdb2 pdb of a reference (optional, default NULL)
#' @param trj2 dcd of the reference (optional, default NULL)
#' @param pdb2sel_string1=sel_string1,
#' @param pdb2sel_string2=sel_string2,
#' @param ref deprecated to delete
#' @param sub when working on multible subunits, list of subunit, default c("A","B","C","D"),
#' @param subseqB sequence of subunits of the second atomselection, default c(1:3,4:6,7:9,10:12),
#' @param stride time interval for ts()
#' @param start starting time for ts()
#' @param overall All the data are collected as a single vector, to get an overall description of the dataset
#' @keywords coordinates 
#' @export
#' @examples
#' pdb=protein.pdb
#' trj=protein.trj             #trajectory 
#' sel_string1="///80///K/"    #selection
#' sel_string2="///81///K/"           
#' pdb2 <- xrays.pdb[["Code1K4C"]]         #reference
#' stride=Stride
#' start=First_frame
#' trj2 <- NULL
#' pdb2sel_string1=sel_string1
#' pdb2sel_string2=sel_string2
#'
#' ref="mean"
#' sub=c("A","B","C","D")
#' subseqB=c(1:3,4:6,7:9,10:12)
#' stride=1
#' start=1
#' overall=FALSE

dist.trj <- function(pdb, trj, sel_string1, sel_string2, pdb2=NULL,trj2=NULL,
                     pdb2sel_string1=sel_string1, pdb2sel_string2=sel_string2,
                     ref="mean", sub=c("A","B","C","D"), subseqB=c(1:3,4:6,7:9,10:12),
                     stride=1, start=1, overall=FALSE) {

  ## debug
  
  require(bio3d)
  ## small array with the selected atoms (matrix(x,y,z,x,y,z,ncol=3))
  sel.trj.A <- atom.select2data.frame(pdb=pdb, trj=trj, sel_string=sel_string1)
  sel.trj.B <- atom.select2data.frame(pdb=pdb, trj=trj, sel_string=sel_string2)

  ## pdb2 and trj2 contain the reference coords
  if (!is.null(pdb2)) {
    print("selecting atom in the reference")
    ## small array with the selected atoms (matrix(x,y,z,x,y,z,ncol=3))
    sel.trj2.A <- atom.select2data.frame(pdb=pdb2,trj=trj2, sel_string=pdb2sel_string1)
    sel.trj2.B <- atom.select2data.frame(pdb=pdb2,trj=trj2, sel_string=pdb2sel_string2)
  }    
  ## Compute the distance using dist.xyz from bio3d
  subcount <- 1
  bond.length <- NULL

  ref.bond.length <- NULL
  ## creating a dataframe of lenght(sub)
  for (s in sub) {
    rangestart <- subcount
    rangeend <-  subcount + 2
    
    bond.length <- cbind( bond.length, dist.xyz(sel.trj.A[,rangestart:rangeend], sel.trj.B[,subseqB[rangestart:rangeend]  ] , all.pairs=FALSE))

    ## storing ref trajectories bond lengths
    if (!is.null(pdb2)) {
      if (!is.null(trj2)) {
        ref.bond.length <- cbind( ref.bond.length, dist.xyz(sel.trj2.A[,rangestart:rangeend], sel.trj2.B[,subseqB[rangestart:rangeend]  ] , all.pairs=FALSE))
      } else {
        ## if conparing with a single pdb
        ref.bond.length <- cbind( ref.bond.length,
                                 sqrt(sum(
                                   (sel.trj2.A[rangestart:rangeend] - sel.trj2.B[subseqB[rangestart:rangeend]  ])^2
                                   )
                                      )
                                 )
      }
    }
    subcount <- subcount + 3
  }
  colnames(bond.length) <- sub

  ## if an additional traj (trj2) is provided, the ref is the average over that
  if (!is.null(pdb2)) {
    #ref <- mean(ref.bond.length)
    #print(class(ref.bond.length))
    ref <- apply(ref.bond.length,2,mean)
  } else {
    ref <- NULL
  }


  if (overall) {
    ## all the data are collected as a single vector, to get an overall description
    ## of the dataset
    bond.length <- as.vector(bond.length)
    ref <- NULL
  }
  
  bond.length.ts <- ts(bond.length, deltat=stride,start=start)

  return(list(
    x=bond.length.ts,
    time=time(bond.length.ts),
    deltat=stride,
    start=start,
    ref=ref
    )
  )
}
