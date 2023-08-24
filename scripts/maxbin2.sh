#!/bin/bash
#PBS -N maxbin_57
#PBS -l nodes=1:ppn=28
#PBS -q normal
#PBS -l walltime=30:00:00
#PBS -o /nlustre/users/chrisl/microplastics/data
#PBS -e /nlustre/users/chrisl/microplastics/data

module load maxbin-2.2.6
cd /nlustre/users/chrisl/microplastics/data/maxbin_inp

#extract identifier
sampleID=57

#create output for each sample
out=/nlustre/users/chrisl/microplastics/data/maxbin_out/57_maxbin

#find the R1 and R2 based on contig identifer
forward=${sampleID}_R1.fastq.gz
reverse=${sampleID}_R2.fastq.gz

#run maxbin: eg: 55_contig.fa 55_R1.fastq.gz 55_R2.fastq.gz 55_maxbin
run_MaxBin.pl -contig 57_contigs.fasta -reads /nlustre/users/chrisl/microplastics/data/fastp/reads/$forward -reads2 /nlustre/users/chrisl/microplastics/data/fastp/reads/$reverse -out $out -thread 28
