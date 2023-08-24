#!/bin/bash
#PBS -N hmmer
#PBS -l nodes=1:ppn=28
#PBS -q short
#PBS -l walltime=00:30:00
#PBS -o /nlustre/users/chrisl/microplastics/data/stdouts
#PBS -e /nlustre/users/chrisl/microplastics/data/stdouts

module load hmmer-3.3.2
#cd /nlustre/users/chrisl/microplastics/data/hmm_out/profile_out
#cat *.hmm >> plastic_database
#hmmpress plastic_database 
pdb=/nlustre/users/chrisl/microplastics/data/hmm_out/profile_out/plastic_database
cd /nlustre/users/chrisl/microplastics/data/prodigal_out/proteins
out=/nlustre/users/chrisl/microplastics/data/hmm_out/profile_out/
for proteins in *_translations.faa
do
base=$(basename $proteins _translations.faa)
hmmsearch -E 1e-10 --tblout ${out}/${base}_result $pdb $proteins
done



