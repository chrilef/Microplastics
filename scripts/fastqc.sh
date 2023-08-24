#!/bin/bash
#PBS -N fastqc_sample1
#PBS -l nodes=1:ppn=28
#PBS -q short
#PBS -l walltime=00:30:00
#PBS -o /nlustre/users/chrisl/microplastics/data/output/trim_out
#PBS -e /nlustre/users/chrisl/microplastics/data/output/trim_out

module load fastqc-0.11.7 
file1="/nlustre/users/chrisl/microplastics/data/output/trim_out"
cd $file1


#for i in *.gz
for i in *.fastq
do
   	fastqc -t 28 $i -o $out1
        #fastqc $i -o .
done


