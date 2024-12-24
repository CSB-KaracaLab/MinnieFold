#!/bin/csh

set profit_dir=/Users/busra/Software/ProFitV3.1/src

$profit_dir/profit <<_Eod_ >> cdrh3_rmsd_results.txt
     multi file.nam
     
     ATOMS N,CA,C,O

     # Specify global CDR zones and calculate RMSD
     ZONE CLEAR
     ZONE A.97-106       # CDRH3
     FIT
     RMS                 # Calculate RMSD for CDRH3
     
     quit
_Eod_
