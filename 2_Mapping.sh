#After we trimmed, we should be able to mapping our result to the Human reference Genome (or GRCh38, avaliable on NCBI)

$echo bwa mem -t 12 -P /genomes/Human/GRCh38_latest_genomic.fna /Reports/Pool_Trimmed_R1.fastq.gz /Reports/Pool_Trimmed_R2.fastq.gz > /mapping/Pool_mapping.bam

#getting unmapped:
$echo samtools view -b -f 4 /mapping/Pool_mapping.bam > /mapping/Pool_unmapped.bam
# we are deleting the file original to save space
$echo rm Pool_mapping.bam
count=$(samtools view -c /mapping/Pool_unmapped.bam)
echo -e "There are $count unmapped reads!\n" #just in case tou wanna know how many reads are unmapped
$echo samtools fastq -1 Pool_unmapped.R1.fastq.gz -2 Pool_unmapped.R2.fastq.gz /mapping/Pool_unmapped.bam #now you have Paired-end files again!
$echo mv Pool_unmapped.R1.fastq.gz /mapping/
$echo mv Pool_unmapped.R2.fastq.gz /mapping/
# delete not needed files
$echo rm /mapping/Pool_unmapped.bam
