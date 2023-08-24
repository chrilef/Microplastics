import csv

def readfile():
    gtdb_filepath = ""
    hmm_out_filepath = ""
    with open(gtdb_filepath, 'a', newline='\t') as file:
        gtdb_out=csv.reader(file, delimiter="\t")
    with open(hmm_out_filepath, 'a', newline='\t') as file2:
        hmm_result_out =csv.reader(file, delimiter="\t")
        hmm_result=1
        for line in gtdb_out: 
            with open ("link_tax_enzymes.tsv") as newfile:
                writer = csv.writer(newfile)
                writer.writerow ([line[0],line[1],hmm_result])
            hmm_result+=1
    file.close()
    file2.close()
    newfile.close()
    

def main():
    readfile()
main()
