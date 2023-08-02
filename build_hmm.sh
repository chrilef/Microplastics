#!/bin/bash
#PBS -N hmmer
#PBS -l nodes=1:ppn=28
#PBS -q normal
#PBS -l walltime=30:00:00
#PBS -o /nlustre/users/chrisl/microplastics/data/stdouts
#PBS -e /nlustre/users/chrisl/microplastics/data/stdouts

module load hmmer-3.3.2

inp=/nlustre/users/chrisl/microplastics/data/hmm_out/PlasticDB_aligned.fasta
cd /nlustre/users/chrisl/microplastics/data/
mkdir hmm_out
cd hmm_out

hmmbuild plastic_profile.hmm $inp


