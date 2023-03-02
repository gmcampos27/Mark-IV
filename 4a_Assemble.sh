#!/bin/bash

## Genome of Interest


# For assembling the genomes, there are two possibilities: 
#(1) generate a file in the standard Kraken format and select the specific virus to assemble or use a reference

echo -e "individual assembly"
$echo time kraken2 -db database/kraken2/db/ --threads 16 --paired -1 /mapping/Pool_unmapped.R1.fastq.gz -2 /mapping/Pool_unmapped.R2.fastq.gz --output Pool.kraken

#the extraction itself, passing the ID as a parameter

$echo python extract_kraken_reads.py -k Pool.kraken -s1 /mapping/Pool_unmapped.R1.fastq.gz -s2 /mapping/Pool_unmapped.R2.fastq.gz -o virus_R1.fastq -o2 virus_R2.fastq --fastq-output -t 

# some taxids:
# 11250: Human orthopneumovirus
# 37124: Chikungunya virus
# 11676: Human immunodeficiency virus 1

#assembling command

$echo spades.py -1 enta_R1.fastq -2 enta_R2.fastq -t 10 -o spades_output

#(2) Assembling by reference

echo -e "assembling by reference"

$echo trimmomatic PE -phred33 /mapping/Pool_unmapped.R1.fastq.gz /mapping/Pool_unmapped.R2.fastq.gz Pool_R1_paired.fq.gz Pool_R1_unpaired.fq.gz Pool_R2_paired.fq.gz Pool_R2_unpaired.fq.gz -threads 10 SLIDINGWINDOW:4:15

$echo cat Pool_R1_unpaired.fq.gz Pool_R2_unpaired.fq.gz > Pool_unpaired.fq.gz

$echo spades.py -1 Pool_R1_paired.fq.gz -2 Pool_R2_paired.fq.gz -s Pool_unpaired.fq.gz -t 32 -k 21,33,55,77 --trusted-contigs genomes/ref.fasta -o spades_output/
