#!/bin/bash
#PBS -N align.sh
#PBS -l nodes=1:ppn=28
#PBS -q short
#PBS -l walltime=00:30:00
#PBS -o /nlustre/users/chrisl/microplastics/data/stdouts
#PBS -e /nlustre/users/chrisl/microplastics/data/stdouts

module load muscle-3.8.31

inp=/nlustre/users/chrisl/microplastics/data/hmm_out/profile_out
cd $inp 
seqfile=ideonella.faa
muscle -in $seqfile -out 


