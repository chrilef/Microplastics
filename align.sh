#!/bin/bash
#PBS -N align
#PBS -l nodes=1:ppn=28
#PBS -q normal
#PBS -l walltime=30:00:00
#PBS -o /nlustre/users/chrisl/microplastics/data/stdouts
#PBS -e /nlustre/users/chrisl/microplastics/data/stdouts

module load muscle-3.8.31

inp=/nlustre/users/chrisl/microplastics/data/prodigal_out/PlasticDB.fasta
out=/nlustre/users/chrisl/microplastics/data/hmm_out/PlasticDB_aligned.fasta


muscle -in $inp -out $out
 


