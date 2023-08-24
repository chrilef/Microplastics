cd /nlustre/users/chrisl/microplastics/data/maxbin_out/allbins
infile=/nlustre/users/chrisl/microplastics/data/maxbin_out/medqual.txt
outdir=/nlustre/users/chrisl/microplastics/data/maxbin_out/filtered_bins/

while read -r line 
do
	cp ${line}.fasta $outdir
done < $infile
#awk '{ sub("\r$", ""); print }' winfile.txt > unixfile.txt converts windows txt file to unix
