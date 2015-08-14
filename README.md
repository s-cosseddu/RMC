RMD
=====
General function to analyse MD simulations. 
Version     : 0.0.0.1	
Author      : Salvatore M. Cosseddu 2013-2015


Description
-----------
The package provide useful functions and wrappers to analyse MD simulations. 

### Depend on ###
[bio3d](http://thegrantlab.org/bio3d/index.php)

### coord.data.frame  ###

Atom coordinates to data frame

- Description:
  Create a data frame with the cordinates of the selected atoms. It
  is based on bio3d functions.

- Usage:
  coord.data.frame.R(pdb, trj = NULL, sel_string)
     
- Arguments:
  pdb: Structure object of class pdb as read by read.pdb() funcion
      of bio3d lib.
  trj: (Optional) trajectory as read by read.dcd() funcion of bio3d
      lib.
  sel_string: Selection of atom for bio3d function atom.select(), refer
      to manual (es. "///71///CD/")

- Examples:

		pot.pdb <- read.pdb(pot.pdbfile)
		pot.trj <- read.dcd(pot.dcdfile)
		K80 <- "///80///K/"
		coord.data.frame (pot.pdb, pot.trj, K80)

____________

## COPYRIGHT ##

Copyright © 2013-2015
Salvatore M Cosseddu, University of Warwick and VU University Amsterdam					  
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.  
This is free software: you are free to change and redistribute it.         	    
There is NO WARRANTY, to the extent permitted by law.          		    

