#!/bin/csh

set profit_dir=/Users/busra/Software/ProFitV3.1/src

$profit_dir/profit <<_Eod_ >> cdrl2_rmsd_results.txt
     multi file.nam
     
     ATOMS N,CA,C,O

     # Specify global CDR zones and calculate RMSD
     ZONE CLEAR
     ZONE B.55-57        # CDRL2
     FIT
     RMS                 # Calculate RMSD for CDRL2
     
     quit
_Eod_

