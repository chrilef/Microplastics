#!/bin/bash
#PBS -N align.sh
#PBS -l nodes=1:ppn=28
#PBS -q normal
#PBS -l walltime=05:00:00
#PBS -o /nlustre/users/chrisl/microplastics/data/stdouts
#PBS -e /nlustre/users/chrisl/microplastics/data/stdouts

# module load muscle-3.8.31
module load mafft-7.407

inp=/nlustre/users/chrisl/microplastics/data/hmm_out/profile_out/ideonella.faa
out=/nlustre/users/chrisl/microplastics/data/hmm_out/profile_out/ideonella_aligned
seqfile=ideonella.faa
# muscle -in $seqfile -out ideonella_aligned
mafft --anysymbol --thread 28 --auto $inp > $out



