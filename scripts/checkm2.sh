#!/bin/bash
#PBS -N checkM2_59
#PBS -l nodes=1:ppn=24
#PBS -q bigmem
#PBS -l walltime=10:00:00
#PBS -o /nlustre/users/chrisl/microplastics/data/maxbin_out/test59/stdio
#PBS -e /nlustre/users/chrisl/microplastics/data/maxbin_out/test59/stdio

module load checkm2
source /apps/anaconda3-2023.03/etc/profile.d/conda.sh
source activate checkm2
bins=/nlustre/users/chrisl/microplastics/data/maxbin_out/test59/bins
out=/nlustre/users/chrisl/microplastics/data/maxbin_out/test59/quality_bins

checkm2 predict --threads 24 -x fasta --input $bins --output-directory $out

