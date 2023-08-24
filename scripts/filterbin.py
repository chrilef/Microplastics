import csv

def readfile():
    # s1="/nlustre/users/chrisl/microplastics/data/maxbin_out/55bins/checkm/quality_report.tsv"
    # s2="/nlustre/users/chrisl/microplastics/data/maxbin_out/57bins/checkm/quality_report.tsv"
    # s3="/nlustre/users/chrisl/microplastics/data/maxbin_out/59bins/checkm/quality_report.tsv"

    s1="Documents/55quality_report.tsv"
    s2="Documents/57quality_report.tsv"
    s3="Documents/59quality_report.tsv"

    # infiles= ["C:/Users/chris/Documents/59checkm.csv"]
    infiles= [s1,s2,s3]
    outpath = "C:/Users/chris/Documents/mediumqual.txt" 
    outfile = open (outpath,'a')
    for i in infiles:
        with open (i) as file:
            cfile=csv.reader(file, delimiter="\t")
            for line in cfile:
                if line[0] == "Name":
                    next(file)
                elif (float (line[1]) >= 50) and (float (line[2]) <= 10):
                    outfile.write(line[0] + "\n")
        file.close()
    outfile.close()
def main():
    readfile()
main()
