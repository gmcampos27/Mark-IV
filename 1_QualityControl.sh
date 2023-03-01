#!/bin/bash
#quality control
#we use fastqc to analyse the quality the sequences before trimming
echo "Quality Control"
$for x in /path_to_file/*fastq.gz; do: #this for loop should go through all the files and run fastqc for all files ending with .fastq.gz and store then in /before folder
  fastqc "$x" -o /QC/Reports/before/
done
echo -e "/a/a/aFirst fastQC done!/a/a/a/n"
#Next: Trimming using fastP
for f1 in /file_to_path/*.fastq.gz; do
  f2=${f1%%.fastq.gz}"_2_sequence.fq.gz"
  fastp -i $f1 -I $f2 -q 30 -g -x -c -h "/QC/Reports/$f1.html" -o "/QC/Reports/trimmed-$f1" -O "/QC/Reports/trimmed-$f2"
done
#fastp is use to trimmed adaptor and poly-sequences 
#The parameters used in this case are as it follows:
#-q 30: quality equals or more than 30
#-g: trimming poli-G
#-x: trimming poli-X
#-c: overrepresented sequences
#-h: report as HTML file
#after that, we need to see if our sequence is better than before, using, again, fastQC
$for x in /path_to_file/*fastq.gz; do:
  fastqc "$x" -o /QC/Reports/after
done
