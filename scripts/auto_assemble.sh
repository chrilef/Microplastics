indir=/home/clefebvre/lustre/microbiome_lectures/trim_out
outdir=/home/clefebvre/lustre/microbiome_lectures/assem_out
mkdir $outdir
cd $indir
snum=3
for sample in *R1_001.fastq.gz
do
base=$(basename $sample _S0_L001_R1_001.fastq.gz)
forward=${base}_S0_L001_R1_001.fastq.gz
reverse=${base}_S0_L001_R2_001.fastq.gz
out=${snum}_assembly
cd /home/clefebvre/lustre/microbiome_lectures/assem_out
mkdir $out
outdir=/home/clefebvre/lustre/microbiome_lectures/assem_out/$out 
echo $outdir
#spades.py --sc -1 $forward -2 $reverse -t 24 -o $outdir 
snum=$((snum+1)) 
cd $indir
done
