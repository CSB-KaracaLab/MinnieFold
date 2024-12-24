#!/bin/csh

set profit_dir=/Users/busra/Software/ProFitV3.1/src

$profit_dir/profit <<_Eod_ >> cdrl3_rmsd_results.txt
     multi file.nam
     
     ATOMS N,CA,C,O

     # Specify global CDR zones and calculate RMSD
     ZONE CLEAR
     ZONE B.94-102       # CDRL3
     FIT
     RMS                 # Calculate RMSD for CDRL3
     
     quit
_Eod_
