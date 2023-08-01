#!/bin/bash
#PBS -N trimming
#PBS -l nodes=1:ppn=28 
#PBS -q short
#PBS -l walltime=00:30:00
#PBS -o /nlustre/users/chrisl/microplastics/data/output
#PBS -e /nlustre/users/chrisl/microplastics/data/output

#This is a simple script to run trimmomatic on our samples. Here we can can take in arguments (files) containing the r1 and r2. - to be fixed
#Credit: Hubbard Center for Genome Studies (HCGS)

module load trimmomatic-0.36

forward="/nlustre/users/chrisl/microplastics/data/input/rawdata/20082D-07-01_S24_L001_R1_001.fastq.gz"
reverse="/nlustre/users/chrisl/microplastics/data/input/rawdata/20082D-07-01_S24_L001_R2_001.fastq.gz" 

cd /nlustre/users/chrisl/microplastics/data/output/trim_out

java -jar $TRIMMOMATIC PE -threads 28 $forward $reverse \  
    paired_forward \ 
    unpaired_forward \
    paired_reverse \ 
    unpaired_reverse \
    ILLUMINACLIP:/nlustre/users/chrisl/microplastics/data/output/adapters/TruSeq3-PE-2.fa:2:30:10 \
    SLIDINGWINDOW:5:28 \
    MINLEN:50 \
    TRAILING:3 \
    LEADING:3
