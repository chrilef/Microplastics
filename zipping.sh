#!/bin/bash
#PBS -N zipping
#PBS -l nodes=1:ppn=12
#PBS -l walltime=30:00:00
#PBS -q normal
#PBS -o /nlustre/users/chrisl/microplastics/data/output/                                                                
#PBS -e /nlustre/users/chrisl/microplastics/data/output/  
cd /nlustre/users/chrisl/microplastics/data/fastp/reads/
for file in *.fastq
do
bgzip $file -@ 12  
done
