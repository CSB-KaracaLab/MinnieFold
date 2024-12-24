#!/bin/csh

set profit_dir=/Users/busra/Software/ProFitV3.1/src
$profit_dir/profit <<_Eod_ >> all.rmsd
     multi file.nam
     atom CA
     fit
     quit
_Eod_

