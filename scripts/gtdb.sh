#!/bin/bash
#PBS -N gtdb-tk
#PBS -l nodes=1:ppn=24
#PBS -q bigmem
#PBS -l walltime=24:00:00
#PBS -o /nlustre/users/chrisl/microplastics/data/taxonomy 
#PBS -e /nlustre/users/chrisl/microplastics/data/taxonomy

#module load gtdbtk-2.1.1
#source /apps/anaconda3-2023.03/etc/profile.d/conda.sh
#source activate gtdbtk-2.1.1

module load anaconda3-2022.05.oli
source /apps/anaconda3-2022.05.oli/etc/profile.d/conda.sh
export GTDBTK_DATA_PATH=/nlustre/data/gtdbtk/release207_v2
module load prodigal-2.6.3
module load hmmer-3.3.2
module load pplacer-19
module load fastani
outdir=/nlustre/users/chrisl/microplastics/data/taxonomy 
inp=/nlustre/users/chrisl/microplastics/data/maxbin_out/filtered_bins/
gtdbtk classify_wf --genome_dir $inp --extension fasta --out_dir $outdir --cpus 24
