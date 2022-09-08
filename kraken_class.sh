#!/bin/bash
#getting unmapped:
$echo samtools view -b -f 4 /mapping/Pool_mapping.bam > /mapping/Pool_unmapped.bam
# we are deleting the file original to save space
$echo rm /project/svetoslav_slavov/metaviromaHumano/noHost/Pool_mapping.bam
count=$(samtools view -c /mapping/Pool_unmapped.bam)
echo -e "There are $count unmapped reads!\n"
$echo samtools fastq -1 Pool_unmapped.R1.fastq.gz -2 Pool_unmapped.R2.fastq.gz /mapping/Pool_unmapped.bam
$echo mv Pool_unmapped.R1.fastq.gz /mapping/
$echo mv Pool_unmapped.R2.fastq.gz /mapping/
# delete not needed files
$echo rm /mapping/Pool_unmapped.bam
#you don`t need to use the time function
$echo time kraken2 -db /mnt/project2/database/kraken2/db/ --threads 16 --paired /mapping/Pool_unmapped.R1.fastq.gz /mapping/Pool_unmapped.R2.fastq.gz --report Pool_kraken.tsv
$echo mv Pool_kraken.tsv /results
echo -e "\a\a\aDone, sir\a\a\a\n"
