#!/bin/bash
#PBS -N hmmer
#PBS -l nodes=1:ppn=12
#PBS -q normal
#PBS -l walltime=30:00:00
#PBS -o /nlustre/users/chrisl/microplastics/data/stdouts
#PBS -e /nlustre/users/chrisl/microplastics/data/stdouts

module load hmmer-3.3.2

profile=/nlustre/users/chrisl/microplastics/data/hmm_out/plastic_profile.hmm
proteins=/nlustre/users/chrisl/microplastics/data/prodigal_out/merged.faa
#proteins=/nlustre/users/chrisl/microplastics/data/prodigal_out/test.fasta
cd /nlustre/users/chrisl/microplastics/data/hmm_out
rm plastic_profile.hmm.h3*
hmmpress $profile
#hmmscan --tblout queries $profile $proteins 
hmmscan --tblout queries $profile $proteins

