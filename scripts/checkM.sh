#!/bin/bash
#PBS -N checkM2_59
#PBS -l nodes=1:ppn=14
#PBS -q normal
#PBS -l walltime=05:00:00
#PBS -o /nlustre/users/chrisl/microplastics/data
#PBS -e /nlustre/users/chrisl/microplastics/data

module load checkm2

bins=/nlustre/users/chrisl/microplastics/data/maxbin_out/59_bins/bins
out=/nlustre/users/chrisl/microplastics/data/maxbin_out/59_bins/quality_bins

checkm2 predict --threads 14 --input $bins --output-directory $out

