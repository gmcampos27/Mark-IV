#!/bin/bash
#passos para pegar o unmapped:
echo -e "Sistema iniciado"
$echo samtools view -b -f 4 /mnt/project2/svetoslav_slavov/metaviromaHumano/noHost/Unmapped/NF16.bam > /mnt/project2/svetoslav_slavov/metaviromaHumano/noHost/Unmapped/NF16_unmapped.bam
# we are deleting the original to save space
$echo rm /mnt/project2/svetoslav_slavov/metaviromaHumano/noHost/Unmapped/NF16.bam
count=$(samtools view -c /mnt/project2/svetoslav_slavov/metaviromaHumano/noHost/Unmapped/NF16_unmapped.bam)
echo -e "There are $count unmapped reads!\n"
$echo samtools fastq -1 /mnt/project2/svetoslav_slavov/metaviromaHumano/noHost/Unmapped/NF16.R1.fastq.gz -2 /mnt/project2/svetoslav_slavov/metaviromaHumano/noHost/Unmapped/NF16.R2.fastq.gz /mnt/project2/svetoslav_slavov/metaviromaHumano/noHost/Unmapped/NF16_unmapped.bam
# delete not needed files
$echo rm /mnt/project2/svetoslav_slavov/metaviromaHumano/noHost/Unmapped/NF16_unmapped.bam
$echo sbatch -n 16 --wrap 'kraken2 -db /database/kraken2/db/ --threads 16 --paired /mnt/project2/svetoslav_slavov/metaviromaHumano/noHost/Unmapped/NF16.R1.fastq.gz /mnt/project2/svetoslav_slavov/metaviromaHumano/noHost/Unmapped/NF16.R2.fastq.gz --report /mnt/project2/svetoslav_slavov/metaviromaHumano/metadata/NFebril/NF16_kraken.tsv'
echo -e "\a\a\aConcluido, senhor. A amostra foi submetida à análise\a\a\a\n"
