import csv
import re
def readfile():
    s1="C:/Users/chris/Desktop/taxonomy/gtdbtk.bac120.summary.tsv"
    with open (s1) as file:
        cfile=csv.reader(file, delimiter="\t")
        for line in cfile:
            if line[0].__contains__("55_"):
                with open('Documents/55.csv', 'a',newline='') as newfile1:
                    writer1 = csv.writer(newfile1)
                    writer1.writerow ([line[0],line[1]])
            if line[0].__contains__("57_"):
                with open('Documents/57.csv', 'a', newline='') as newfile2:
                    writer2 = csv.writer(newfile2)
                    writer2.writerow ([line[0],line[1]])
            if line[0].__contains__("59_"):
                with open('Documents/59.csv', 'a', newline='') as newfile3:
                    writer3 = csv.writer(newfile3)
                    writer3.writerow ([line[0],line[1]])      
    file.close()
    newfile1.close()
    newfile2.close()
    newfile3.close()   
def main():
    readfile()

main()
