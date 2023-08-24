#
cd /nlustre/users/chrisl/microplastics/data/fastp/reads
 
for sample in *R1*
do
base=$(basename $sample _R1.fastq.gz)
forward=${base}_R1.fastq.gz
reverse=${base}_R2.fastq.gz
echo $forward
done

