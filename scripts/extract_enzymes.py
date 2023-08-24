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
    enzyme_list = open ("unique_enzymes.txt",'r')

  
    for line1 in enzyme_list:
        infile = open (inp,'r')
        nextfile= line1.strip() + ".fasta"
        fout = open (nextfile,"w")
        for line2 in infile:
            if ">" in line2:
                curr_seq = line2.split("||")
                if (curr_seq[1] == line1.strip()):
                    fout.write(line2 +  "\n")
                    fout.write(infile.__next__()+  "\n")                             
        fout.close()
        infile.close()
        
def main():
    import sys,os
    extract(sys.argv[1])    
main()

