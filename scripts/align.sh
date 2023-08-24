#!/bin/bash
#PBS -N align.sh
#PBS -l nodes=1:ppn=28
#PBS -q short
#PBS -l walltime=00:30:00
#PBS -o /nlustre/users/chrisl/microplastics/data/stdouts
#PBS -e /nlustre/users/chrisl/microplastics/data/stdouts

module load muscle-3.8.31

inp=/nlustre/users/chrisl/microplastics/data/hmm_out/extracted_enzymes
cd /nlustre/users/chrisl/microplastics/data/hmm_out/
mkdir aligned_enzymes  
cd $inp 
for enzyme in *.fasta
do 
out=/nlustre/users/chrisl/microplastics/data/hmm_out/aligned_enzymes/$enzyme 
muscle -in $enzyme -out $out
done 


