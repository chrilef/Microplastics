#!/bin/bash
#PBS -N hmmer
#PBS -l nodes=1:ppn=28
#PBS -q normal
#PBS -l walltime=30:00:00
#PBS -o /nlustre/users/chrisl/microplastics/data/stdouts
#PBS -e /nlustre/users/chrisl/microplastics/data/stdouts

module load hmmer-3.3.2

cd /nlustre/users/chrisl/microplastics/data/hmm_out/
mkdir profile_out
cd /nlustre/users/chrisl/microplastics/data/hmm_out/aligned_enzymes

for enzyme in *.fasta
do
base=$(basename $enzyme .fasta)
out=/nlustre/users/chrisl/microplastics/data/hmm_out/profile_out/${base}.hmm    
hmmbuild $out $enzyme  
done



