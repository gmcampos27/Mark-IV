import pandas as pd
from openpyxl import Workbook

data = pd.read_csv('C:/Users/USUARIO/Dropbox/PC (3)/Desktop/USP/Metagenômica/scaffolds_above_500_vs_nt_qcov70_uniq.tsv', delimiter='\t', names=['qseqid', 'sallseqid', 'pident', 'length', 'qcovs', 'qstart', 'qend', 'sstart', 'send', 'evalue', 'bitscore', 'staxids', 'scomnames'], header= None)

data.columns

data.head(5)
data.drop('scomnames', axis = 1)

data.to_excel('scaffolds_final.xlsx')