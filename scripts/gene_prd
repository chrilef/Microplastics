#!/bin/bash
#PBS -N gene_pred_Prodigal
#PBS -l nodes=1:ppn=28
#PBS -q normal
#PBS -l walltime=30:00:00
#PBS -o /nlustre/users/chrisl/microplastics/data/stdouts
#PBS -e /nlustre/users/chrisl/microplastics/data/stdouts

module load prodigal-2.6.3

indir=/nlustre/users/chrisl/microplastics/data/maxbin_out/filtered_bins/
# cd /nlustre/users/chrisl/microplastics/data/
# mkdir prodigal_out
out=/nlustre/users/chrisl/microplastics/data/prodigal_out
cd $indir

x=1
for i in *.fasta
do
outcords=${out}/${x}_coords.gbk
translations=${out}/${x}_translations.faa
prodigal -i $i -o $outcords -a $translations
x=$((x+1))
done
