#!/bin/bash
#PBS -N checkM2_55
#PBS -l nodes=1:ppn=24
#PBS -q bigmem
#PBS -l walltime=02:00:00
#PBS -o /nlustre/users/chrisl/microplastics/data/maxbin_out/
#PBS -e /nlustre/users/chrisl/microplastics/data/maxbin_out/

module load checkm2
source /apps/anaconda3-2023.03/etc/profile.d/conda.sh
source activate checkm2
bins=/nlustre/users/chrisl/microplastics/data/maxbin_out/55bins
out=/nlustre/users/chrisl/microplastics/data/maxbin_out/55bins/checkm	

checkm2 predict --threads 24 -x fasta --input $bins --output-directory $out

