RMD
=====
Version     : 0.0.0.1	
Author      : Salvatore M. Cosseddu 2013-2015


Description
-----------
The package provides useful R functions and wrappers to analyse MD simulations. 

### Depend on ###
[bio3d](http://thegrantlab.org/bio3d/index.php)

### Functions ###

Please, refer to the documentation of each function by typing ?<functionName> 

- coord.data.frame.R  
- dihe.trj.R          
- dist.trj.R          
- filled.contour.lines
- free.energy.R       
- ma.R                
- qfilled.contour.R   
- rmdfilled.contour.R 
- rmdpalettes.R       
- rmdsmooth.spline.R  
- surf.smooth.spline.R

<!-- ### Order parameter functions ### -->

<!-- #### coord.data.frame #### -->

<!-- Atom coordinates to data frame -->

<!-- - Description: -->
<!--   Create a data frame with the cordinates of the selected atoms. It -->
<!--   is based on bio3d functions. -->

<!-- - Usage: -->

<!-- 		coord.data.frame.R(pdb, trj = NULL, sel_string) -->
     
<!-- - Arguments: -->

<!-- 		pdb: Structure object of class pdb as read by read.pdb() funcion -->
<!-- 			of bio3d lib. -->
<!-- 		trj: (Optional) trajectory as read by read.dcd() funcion of bio3d -->
<!-- 			lib. -->
<!-- 		sel_string: Selection of atom for bio3d function atom.select(), refer -->
<!-- 			to manual (es. "///71///CD/") -->

<!-- - Examples: -->

<!-- 		pot.pdb <- read.pdb(pot.pdbfile) -->
<!-- 		pot.trj <- read.dcd(pot.dcdfile) -->
<!-- 		K80 <- "///80///K/" -->
<!-- 		coord.data.frame (pot.pdb, pot.trj, K80) -->


<!-- ---------- -->

<!-- #### dihe.trj #### -->

<!-- Dihedral angles from Molecular Dynamics in Matrix -->

<!-- - Description: -->
<!--   Wrap for torsion.xyz from bio3d package to compute dihedral angles -->
<!--   and return them in a convinient matrix format -->

<!-- - Usage: -->

<!-- 		dihe.trj(pdb, trj, dihesel, sub) -->
     
<!-- - Arguments: -->

<!-- 		pdb: structure object from read.pdb, -->
<!-- 		trj: trajector object form read.dcd, -->
<!-- 		dihesel: selection string for atom.select(), -->
<!-- 		sub: deprecate (to check) -->

<!-- - Examples: -->

<!-- 		pdb=protein.pdb -->
<!-- 		trj=protein.trj -->
<!--         L81.chi <- "//81///N,CA,CB,CG/" -->
<!--         ts( -->
<!--           torsion.dcd( -->
<!--              pdb=pdb, trj=dcd, -->
<!--              L81.chi, subunits) -->
<!--         deltat=0.5,start=10) -->

<!-- ---------- -->

<!-- #### dist.trj #### -->

<!-- Atom distances from Molecular Dynamics Trajectories -->

<!-- - Description: -->
<!--   Take trajectory and pdb objects, 2 selection and return time -->
<!--   series of distances between the atom in selection1 and selection2 -->
<!--   according to sub and subseqB. It is based on bio3d functions. -->

<!-- - Usage: -->

<!-- 		dist.trj(pdb, trj, sel_string1, sel_string2, pdb2 = NULL, trj2 = NULL, -->
<!-- 		pdb2sel_string1 = sel_string1, pdb2sel_string2 = sel_string2, -->
<!-- 		ref = "mean", sub = c("A", "B", "C", "D"), subseqB = c(1:3, 4:6, 7:9, -->
<!-- 		10:12), stride = 1, start = 1, overall = FALSE) -->
     
<!-- - Arguments: -->

<!-- 		pdb: Structure object of class pdb as read by read.pdb() funcion -->
<!-- 			of bio3d lib. -->
<!-- 		trj: (Optional) trajectory as read by read.dcd() funcion of bio3d -->
<!-- 			lib. -->
<!-- 		sel_string1: First selection of atom for bio3d function atom.select(), -->
<!-- 			refer to manual (es. "///71///CD/") -->
<!-- 		pdb2: pdb of a reference (optional, default NULL) -->
<!-- 		trj2: dcd of the reference (optional, default NULL) -->
<!-- 		ref: deprecated to delete -->
<!-- 		sub: when working on multible subunits, list of subunit, default -->
<!-- 			c("A","B","C","D") -->
<!-- 		subseqB: sequence of subunits of the second atomselection, default -->
<!-- 			c(1:3,4:6,7:9,10:12) -->
<!-- 		stride: time interval for ts() -->
<!-- 		start: starting time for ts() -->
<!-- 		overall: All the data are collected as a single vector, to get an -->
<!-- 			overall description of the dataset -->
<!-- 		sel_string1: Second selection of atom for bio3d function atom.select() -->
<!-- 		pdb2sel_string1=sel_string1: -->
<!-- 		pdb2sel_string2=sel_string2: -->

<!-- - Examples: -->

<!-- 		pdb=protein.pdb -->
<!--         trj=protein.trj             #trajectory -->
<!--         sel_string1="///80///K/"    #selection -->
<!--         sel_string2="///81///K/" -->
<!--         pdb2 <- xrays.pdb\[["Code1K4C"]]         #reference -->
<!--         stride=Stride -->
<!--         start=First_frame -->
<!--         trj2 <- NULL -->
<!--         pdb2sel_string1=sel_string1 -->
<!--         pdb2sel_string2=sel_string2 -->

<!--         ref="mean" -->
<!--         sub=c("A","B","C","D") -->
<!--         subseqB=c(1:3,4:6,7:9,10:12) -->
<!--         stride=1 -->
<!--         start=1 -->
<!--         overall=FALSE -->

<!-- ### Time series ### -->

<!-- #### ma ####  -->

<!-- Simple moving average procedure -->

<!-- - Description: -->
   
<!--         Apply a moving average procedure on time series -->
   
<!-- - Usage: -->
   
<!--         ma(x, window.length) -->
        
<!-- - Arguments: -->
   
<!--           x: any object containing the time series (es. data.frame, ts) -->
<!-- 		  window.length: length of the windows on which averages are computed -->
   
<!-- - Examples: -->
   
<!--         infile <- "test.data" -->
<!--         window.ll <- 20 -->
        
<!--         x <- read.table(infile) -->
<!--         x <- ma(x, window.ll) -->
<!--         write.table(x,file=paste("ma",infile,sep="_"), quote=F, row.names=F, col.names=F) -->

<!-- ---------- -->


____________

## COPYRIGHT ##

Copyright © 2013-2015
Salvatore M Cosseddu, University of Warwick and VU University Amsterdam					  
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.  
This is free software: you are free to change and redistribute it.         	    
There is NO WARRANTY, to the extent permitted by law.          		    

