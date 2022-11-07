import pandas as pd
import os


# df = pd.read_excel('C:/Users/gabri/Dropbox/PC/Desktop/USP/Metagenômica/scaffolds_above_500_vs_nt_qcov70_uniq.xlsx')

# taxIDs = pd.read_csv('C:/Users/gabri/Dropbox/PC/Desktop/USP/Metagenômica/tax_report.txt', sep = '\t')

# print(taxIDs.columns)

# print(df.columns)

# taxUseful = taxIDs[['taxid', 'taxname']]

# joined = pd.merge(df, taxUseful, how='left', left_on='staxids', right_on='taxid')

# joined

# join = joined.to_excel('C:/Users/gabri/Dropbox/PC/Desktop/USP/Metagenômica/pool9_a2_blast-scaffolds_taxID_data_nome.xlsx', index = False)

data = pd.read_excel('C:/Users/gabri/Dropbox/PC/Desktop/USP/Metagenômica/pool9_a2_blast-scaffolds_taxID_data_nome.xlsx')
print(data.columns)
virus = data[data['taxname'] == 'Coxsackievirus A2']
print(virus)