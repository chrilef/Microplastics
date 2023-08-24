#!/bin/bash
#PBS -N metaSPAdes
#PBS -l nodes=1:ppn=24
#PBS -q bigmem
#PBS -l walltime=720:00:00
#PBS -o /nlustre/users/chrisl/microplastics/data/testMAG
#PBS -e /nlustre/users/chrisl/microplastics/data/testMAG

#this script good for stripping forward and reverse read identifiers
#currently its running metaSPAdes but it can be substituted

module load SPAdes-3.15.0
cd /nlustre/users/chrisl/microplastics/data/testMAG
for sample in *R1*
do
base=$(basename $sample _R1.fastq.gz)
out=/nlustre/users/chrisl/microplastics/data/${base}Spades
forward=${base}_R1.fastq.gz
reverse=${base}_R2.fastq.gz
metaspades.py -1 $forward -2 $reverse -o $out -t 24
done

