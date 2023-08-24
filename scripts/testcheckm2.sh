#!/bin/bash
#PBS -N checkM2_59
#PBS -l nodes=1:ppn=12
#PBS -q normal
#PBS -l walltime=02:00:00
#PBS -o /nlustre/users/chrisl/microplastics/data/output
#PBS -e /nlustre/users/chrisl/microplastics/data/output

module load checkm2
source /apps/anaconda3-2023.03/etc/profile.d/conda.sh
source activate checkm2

checkm2 testrun --threads 12
