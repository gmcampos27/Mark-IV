#This is used in case you want to see everything spades has assembled

# 1st step: get the size of the scaffolds
$echo grep '>' scaffolds_pool.fasta | cut -f 4 -d '_' > scaffolds_length.txt

# 2nd step: get the scaffolds id
$echo grep '>' scaffolds_pool.fasta  > scaffolds_ids.txt

# 3rd step: merge the files and make a filter to recover scaffolds with a size above 500 bp
$echo paste scaffolds_ids.txt scaffolds_length.txt | awk '$2 > 500' | cut -f 1 | sed 's/>//g' > scaffolds_ids_above_500.txt
$echo seqtk subseq scaffolds_pool.fasta scaffolds_ids_above_500.txt > scaffolds_pool_above_500.fasta

# 4th step: blast the scaffolds against the nt bank
$echo sbatch -n 80 --wrap 'blastn -query scaffolds_pool_above_500.fasta -db database/ncbi-blast+/nt -outfmt "6 qseqid sallseqid pident length qcovs qstart qend sstart send evalue bitscore staxids scomnames" -out scaffolds_pool_above_500_vs_nt.tsv -num_threads 80'

# 5th step: filter by query coverage above 70%
$echo cat scaffolds_pool_above_500_vs_nt.tsv | awk '$5 > 70' > scaffolds_pool_above_500_vs_nt_qcov70.tsv

# 6th step: filter results by "unique" scaffold ids
$echo sort -r -n -k 5 scaffolds_pool9_above_500_vs_nt_qcov70.tsv | awk '!_[$1]++' > scaffolds_pool9_above_500_vs_nt_qcov70_uniq.tsv

# 7th step: take the staxids column and put it in https://www.ncbi.nlm.nih.gov/Taxonomy/TaxIdentifier/tax_identifier.cgi

# 8th step: clean the site output and merge the files using pandas (Python)
