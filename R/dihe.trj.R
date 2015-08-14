#' Dihedral angles from Molecular Dynamics Trajectories in Matrix
#'
#' Wrap for torsion.xyz from bio3d package to compute dihedral angles and return them in a convinient matrix format
#' @param pdb,
#' @param trj,
#' @param dihesel,
#' @param sub
#' @export
#' @examples
#' pdb=protein.pdb
#' trj=protein.trj 
#' L81.chi <- "//81///N,CA,CB,CG/"
#' ts(
#'   torsion.dcd(
#'      pdb=pdb, trj=dcd, 
#'      L81.chi, subunits)
#' deltat=0.5,start=10)

dihe.trj <- function(pdb, trj, dihesel, sub) {

  torsion.sel <- function(sel, pdbfile, trjfile) {
    xyz <- lapply(sel,function(x) atom.select2data.frame(pdbfile, trjfile, sel_string=x))
    xyz.matrix <- do.call(cbind,xyz)
    xyz.vector <- as.vector(t(xyz.matrix))
    return(torsion.xyz(xyz.vector))
  }

  dihedral.mat <- matrix(
    paste ("/",rep(subunits,each=length(dihesel)),dihesel, sep=""),
    ncol=length(dihesel), byrow=T
    )
  

  torsion.mat <- apply(dihedral.mat,1,torsion.sel, pdbfile=pdb, trjfile=trj)

}
