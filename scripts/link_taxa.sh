#logic: 
#take first contig from each hmm output
# see which bin contains the contig
#output full paths to bin->hmm output->corresponding taxonomy 
#use name of bin to see where in the gtdb-tk summary table it is 


bin_dir=/mnt/lustre/users/clefebvre/from_wonko/maxbin_out/filtered_bins
profile_dir=/mnt/lustre/users/clefebvre/from_wonko/hmm_out/profile_out/results
gtdb_dir=/mnt/lustre/users/clefebvre/from_wonko/taxonomy/classify
out_dir=/mnt/lustre/users/clefebvre/from_wonko/profile_bin_matches
#count_contigs=1
for i in "$profile_dir"/*;
do
first_line=$(sed -n 4p $i)
first_contig=$(echo "$first_line" | cut -d '-' -f 1)
count_contigs=$((count_contigs+1))
trim_contig=$(echo "$first_contig" | sed 's/_[^_]*$//')
matched_contig=$(grep -rHl $trim_contig $bin_dir)
matched_bin=$(basename "$matched_contig")
matched_bin=$(basename "$matched_contig" ".fasta")
first_line=$(sed -n 4p $i)
first_contig=$(echo "$first_line" | cut -d '-' -f 1)
taxa_result=$(grep -r --include=\*summary.tsv $matched_bin $gtdb_dir | awk -F '\t' '{print $2}') 
echo "$matched_contig->$i->$taxa_result" >> $out_dir
done

