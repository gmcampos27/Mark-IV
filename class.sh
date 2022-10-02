#!/bin/bash
#getting unmapped:
$echo samtools view -b -f 4 /mapping/Pool_mapping.bam > /mapping/Pool_unmapped.bam
# we are deleting the file original to save space
$echo rm Pool_mapping.bam
count=$(samtools view -c /mapping/Pool_unmapped.bam)
echo -e "There are $count unmapped reads!\n"
$echo samtools fastq -1 Pool_unmapped.R1.fastq.gz -2 Pool_unmapped.R2.fastq.gz /mapping/Pool_unmapped.bam
$echo mv Pool_unmapped.R1.fastq.gz /mapping/
$echo mv Pool_unmapped.R2.fastq.gz /mapping/
# delete not needed files
$echo rm /mapping/Pool_unmapped.bam
#you don`t need to use the time function
echo -e "----------KRAKEN2-------------"
$echo time kraken2 -db /mnt/project2/database/kraken2/db/ --threads 16 --paired /mapping/Pool_unmapped.R1.fastq.gz /mapping/Pool_unmapped.R2.fastq.gz --report Pool_kraken.tsv
$echo mv Pool_kraken.tsv /results
echo -e "\a\a\aDone, 1/4\a\a\a\n"
echo "-------------KAIJU------------"
$echo time kaiju -z 12 -t nodes.dmp -f kaiju_db_viruses.fmi -i Pool_unmapped.fastq.gz -o Pool_kaiju.out
$echo kaiju2table -t nodes.dmp -n names.dmp -r species -u -e -o Pool_13_kaiju.tsv Pool_kaiju.out
$echo mv Pool_kaiju.tsv /results
echo -e "echo -e "\a\a\aDone, 2/4\a\a\a\n"
echo "----------DIAMOND------------"
echo "Database creation"
$echo diamond makedb --in nr.gz --db nr
$echo time diamond blastx -d viruses.dmnd --verbose --outfmt 100 -q Pool_unmapped.fastq.gz -o Pool_diamond.daa
$echo daa-meganizer -i Pool_diamond.daa -mdb megan-map-Jan2021.db
echo -e "\a\a\aDone, 3/4\a\a\a\n"
echo "-------CLARK---------"
$echo bash ./classify_metagenome.sh -O Pool_unmapped.fastq.gz -R Pool_clark -n 16
$echo bash ./estimate_abundance.sh -F Pool_clark.csv -D db/viruses/
echo -e "\a\a\aDone, 4/4\a\a\a\n"
