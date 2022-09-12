#!/bin/bash
#quality control
#we use fastqc to analyse the quality the sequences before trimming
echo "Quality Control"
$echo fastqc rawData/Poll_L001_R1_001.fastq.gz /rawData/Poll_L001_R2_001.fastq.gz -o /QC/Reports/before
echo -e "/a/a/aFirst fastQC done!/a/a/a/n"
$echo fastp -i /rawData/Pool_L001_R1_001.fastq.gz -o /QC/Pool_trimmed_R1.fastq.gz -I /rawData/Pool_L001_R2_001.fastq.gz -O QC/Pool_trimmed_R2.fastq.gz -q 30 -g -x -c -h QC/after/fastp.html
#fastp is use to trimmed adaptor and poly-sequences 
#after that, we need to see if our sequence is better than before, using, again, fastQC
$echo fastqc /QC/Pool_trimmed_R1.fastq.gz /QC/Pool_trimmed_R2.fastq.gz -o /QC/Reports/after
