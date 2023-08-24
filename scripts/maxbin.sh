#!/bin/bash
#PBS -N maxbin
#PBS -l nodes=1:ppn=28
#PBS -q normal
#PBS -l walltime=30:00:00
#PBS -o /nlustre/users/chrisl/microplastics/data
#PBS -e /nlustre/users/chrisl/microplastics/data

module load maxbin-2.2.6
cd /nlustre/users/chrisl/microplastics/data/maxbin_inp
#iterate through every contig in input directory

readDir=/nlustre/users/chrisl/microplastics/data/fastp/reads
for id in *contigs.fasta*
do
#extract identifier
sampleID=$(basename $id _contigs.fasta )
#create output for each sample
out=/nlustre/users/chrisl/microplastics/data/maxbin_out/${sampleID}_maxbin
#find the R1 and R2 based on contig identifer
forward=${sampleID}_R1.fastq.gz
reverse=${sampleID}_R2.fastq.gz
#run maxbin: eg: 55_contig.fa 55_R1.fastq.gz 55_R2.fastq.gz 55_maxbin
run_MaxBin.pl -contig $id -reads /nlustre/users/chrisl/microplastics/data/fastp/reads/$forward -reads2 /nlustre/users/chrisl/microplastics/data/fastp/reads/$reverse -out $out -thread 28
done
