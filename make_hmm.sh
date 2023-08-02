#!/bin/bash
#PBS -N hmmer
#PBS -l nodes=1:ppn=28
#PBS -q normal
#PBS -l walltime=30:00:00
#PBS -o /nlustre/users/chrisl/microplastics/data/stdouts
#PBS -e /nlustre/users/chrisl/microplastics/data/stdouts

module load hmmer-3.3.2

inp=/nlustre/users/chrisl/microplastics/data/prodigal_out/PlasticDB.fasta
cd /nlustre/users/chrisl/microplastics/data/
mkdir hmm_out

cd hmm_out
touch tmpfile.fasta

i=1
while read -r line
do
if [[ $line == *">"* ]];then
 echo $line > 'tmpfile.fasta'
 curr_id=$line
 read line
 curr_seq=$line
 echo $line >> 'tmpfile.fasta'
hmmbuild ${i}.hmm tmpfile.fasta
i=$((i+1))
fi
echo $i
done < $inp
 


