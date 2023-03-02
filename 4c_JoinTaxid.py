import pandas as pd
import os


# df = pd.read_excel('file.xlsx')

# taxIDs = pd.read_csv('tax.txt', sep = '\t')

# print(taxIDs.columns)

# print(df.columns)

# taxUseful = taxIDs[['taxid', 'taxname']]

# joined = pd.merge(df, taxUseful, how='left', left_on='staxids', right_on='taxid')

# joined

# join = joined.to_excel('joined.xlsx', index = False)

interst = "species"
data = pd.read_excel('join.xlsx')
print(data.columns)
virus = data[data['taxname'] == interest]
print(virus)
