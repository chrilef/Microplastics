from pathlib import Path
#from shutil import rmtree
from textwrap import dedent
from itertools import islice

import csv #just this time for sample sheet
with open("SampleSheet.csv") as infile:
	idToNumber={x["SampleId"]:str(x["Number"])
		for x in csv.DictReader(infile)}

def nameToId(filename):
	return filename[:filename.index("_L00")].removeprefix("2008")

def makeBatches(everything,numberOfGroups):
	it=iter(everything)
	groupSize=int(len(list(everything))/numberOfGroups)
	lists=[list(islice(it,groupSize))
		for _ in range(numberOfGroups+1)]
	return [x for x in lists if x]

projectName="microplastics"
programName="fastp"
numberOfJobs=6
logpath=Path.home()/f"{projectName}/out/{programName}"
if not logpath.exists():
	logpath.mkdir(parents=True)
workdir=Path(f"/nlustre/users/chrisl/{projectName}/data")
inputFiles=list((workdir/"input/rawdata").glob("*_R1_*.fastq*"))
outpath=workdir/programName
if  not outpath.exists():
	outpath.mkdir(parents=True)

fileToNumber={x.name:idToNumber[nameToId(x.name)]
	for x in inputFiles}

for n,i in enumerate(makeBatches(inputFiles,numberOfJobs)):
	batchNumber=n+1
	logout=logpath/f"batch{batchNumber}.txt"
	with open(Path(__file__).absolute().parent/f"{batchNumber}{programName}.job",'w') as scriptfile:
		scriptfile.write(dedent(f'''\
			#!/usr/bin/bash
			#PBS -N {batchNumber}{programName}
			#PBS -q normal
			#PBS -l nodes=1:ppn=16
			#PBS -l walltime=30:00:00
			#PBS -k oe
			#PBS -j oe
			#PBS -o {logout}
			#PBS -m abe
			#PBS -M u21652938@tuks.co.za
			
			cd {workdir}
			module load fastp-0.23.2
			'''))
		for j in i:
			read1=str(j.relative_to(workdir))
			read2=read1.replace("_R1","_R2")
			sampleNumber=fileToNumber[j.name].zfill(2)
			outPrefix=str(outpath.relative_to(workdir))
			out1=sampleNumber+"_R1"+"".join(j.suffixes)
			out2=out1.replace("_R1","_R2")
			scriptfile.write(
				f"fastp -i {read1} -I {read2} -o {outPrefix}/reads/{out1} -O {outPrefix}/reads/{out2} \
					--detect_adapter_for_pe -cpD -w 16 -h {outPrefix}/reports/{sampleNumber}.html -j {outPrefix}/reports/{sampleNumber}.json\n")
	
