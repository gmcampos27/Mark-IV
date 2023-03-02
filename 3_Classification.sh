#!/bin/bash
#Now that we have everything unmapped, we need to classify then. For this, as in my study, we use 4 Taxonomic Classifiers, presented here
#All of then use 16 threads, but feel free to change this parameter
#Basically, you will use the unmapped file as input, and for output it will be generated a report that we move to /results folder
#The Database must be installed!
echo -e "----------KRAKEN2-------------"
$echo kraken2 -db /mnt/project2/database/kraken2/db/ --threads 16 --paired /mapping/Pool_unmapped.R1.fastq.gz /mapping/Pool_unmapped.R2.fastq.gz --report Pool_kraken.tsv
$echo mv Pool_kraken.tsv /results
echo -e "\a\a\aDone, 1/4\a\a\a\n"
echo "-------------KAIJU------------"
$echo time kaiju -z 12 -t nodes.dmp -f kaiju_db_viruses.fmi -i Pool_unmapped.fastq.gz -o Pool_kaiju.out
$echo kaiju2table -t nodes.dmp -n names.dmp -r species -u -e -o Pool_kaiju.tsv Pool_kaiju.out #convert to .tsv file or any other you like
$echo mv Pool_kaiju.tsv /results
echo -e "\a\a\aDone, 2/4\a\a\a\n"
echo "----------DIAMOND------------"
echo "Database creation"
$echo diamond makedb --in nr.gz --db nr #how to make a viruses database in Diamond
$echo time diamond blastx -d viruses.dmnd --verbose --outfmt 100 -q Pool_unmapped.fastq.gz -o Pool_diamond.daa
$echo daa-meganizer -i Pool_diamond.daa -mdb megan-map-Jan2021.db
echo -e "\a\a\aDone, 3/4\a\a\a\n"
echo "-------CLARK---------"
echo "Database creation"
echo bash ./download_RefSeq db viruses #how to make a viruses database in CLARK
echo bash ./set_targets db viruses
$echo bash ./classify_metagenome.sh -O Pool_unmapped.fastq.gz -R Pool_clark -n 16
$echo bash ./estimate_abundance.sh -F Pool_clark.csv -D db/viruses/
echo -e "\a\a\aDone, 4/4\a\a\a\n"
