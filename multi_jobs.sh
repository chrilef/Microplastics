cd /nlustre/users/chrisl/scripts
for file in *.job
do
qsub $file
done
