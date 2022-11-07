# 1a etapa: pegar tamanho dos scaffolds
$echo grep '>' scaffolds_pool_9.fasta | cut -f 4 -d '_' > scaffolds_length.txt

# 2a etapa: pegar o id dos scaffolds
$echo grep '>' scaffolds_pool_9.fasta  > scaffolds_ids.txt

# 3a etapa: unir os arquivos e fazer um filtro para recuperar scaffolds com tamanho acima de 500 pb
$echo paste scaffolds_ids.txt scaffolds_length.txt | awk '$2 > 500' | cut -f 1 | sed 's/>//g' > scaffolds_ids_above_500.txt
$echo seqtk subseq scaffolds_pool_9.fasta scaffolds_ids_above_500.txt > scaffolds_pool9_above_500.fasta

# 4a etapa: fazer blast dos scaffolds contra o banco nt
$echo sbatch -n 80 --wrap 'blastn -query scaffolds_pool9_above_500.fasta -db /mnt/project2/database/ncbi-blast+/nt -outfmt "6 qseqid sallseqid pident length qcovs qstart qend sstart send evalue bitscore staxids scomnames" -out scaffolds_pool9_above_500_vs_nt.tsv -num_threads 80'

# 5a etapa: filtra por query coverage acima de 70%
$echo cat scaffolds_pool9_above_500_vs_nt.tsv | awk '$5 > 70' > scaffolds_pool9_above_500_vs_nt_qcov70.tsv

# 6a etapa: filtra resultados por ids "únicos" de scaffolds
$echo sort -r -n -k 5 scaffolds_pool9_above_500_vs_nt_qcov70.tsv | awk '!_[$1]++' > scaffolds_pool9_above_500_vs_nt_qcov70_uniq.tsv

# 7a etapa: pega a coluna do staxids e joga no https://www.ncbi.nlm.nih.gov/Taxonomy/TaxIdentifier/tax_identifier.cgi

# 8 etapa: limpa a saída do site e faz a união dos arquivos utilizando o pandas
