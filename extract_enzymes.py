# This code reads through the PlasticDB sequences and extracts each enzyme into its own group

def extract(inp):
    infile = open(inp)
    unique_enzymes = list ()
    out = open ("unique_enzymes.txt",'w')
    for line in infile:
        if ">" in line:
            curr_seq = line.split("||")
            if not (unique_enzymes.__contains__(curr_seq[1])):
                unique_enzymes.append(curr_seq [1])
                out.write(curr_seq[1] + "\n")

    out.close()
    infile.close()
    infile = open (inp,'r')
    out = open ("unique_enzymes.txt",'r')
    i=0
    for line1 in out:
        # print (line1)
        for line2 in infile:
            if ">" in line2:
                curr_seq = line2.split("||")
                print (curr_seq[1])
                if str (line1.strip()) in curr_seq[1]:
                    print ("yes")
                    nextfile= str(i) + ".fasta"
                    fout = open (line1.strip(),"a")
                    fout.write(line2.strip() +  "\n")
                fout.close()
        
        

def main():
    import sys,os
    extract(sys.argv[1])    
main()