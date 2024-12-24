#!/bin/csh

set profit_dir=/Users/busra/Software/ProFitV3.1/src

$profit_dir/profit <<_Eod_ >> cdrh2_rmsd_results.txt
     multi file.nam
     
     ATOMS N,CA,C,O

     # Specify global CDR zones and calculate RMSD
     ZONE CLEAR
     ZONE C.51-58        # CDRH2
     FIT
     RMS                 # Calculate RMSD for CDRH2
     
     quit
_Eod_
