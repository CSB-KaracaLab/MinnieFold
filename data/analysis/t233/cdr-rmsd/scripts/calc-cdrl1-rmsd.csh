#!/bin/csh

set profit_dir=/Users/busra/Software/ProFitV3.1/src

$profit_dir/profit <<_Eod_ >> cdrl1_rmsd_results.txt
     multi file.nam
     
     ATOMS N,CA,C,O

     # Specify global CDR zones and calculate RMSD
     ZONE CLEAR
     ZONE D.27-37        # CDRL1
     FIT
     RMS                 # Calculate RMSD for CDRL1
     
     quit
_Eod_
