#!/bin/bash

JobName=$1  
scenario=$2  

colabfold_batch \
--jobname-prefix ${JobName}-scenario${scenario} \
--num-relax 0 \
--msa-mode mmseqs2_uniref_env \
--model-type alphafold2_multimer_v1 \
--num-recycle 3 \
--recycle-early-stop-tolerance 0.0 \
--rank multimer \
--max-seq 252 \
--max-extra-seq 1152 \
--pair-mode unpaired_paired \
--pair-strategy greedy \
--random-seed 0 \
--num-seeds 2 \
--use-dropout \
--save-all \
--host-url https://api.colabfold.com \
input/${JobName}.fasta results/${JobName}/s${scenario}
