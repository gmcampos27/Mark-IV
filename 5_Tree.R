#author: Gabriel Montenegro de Campos
#date: 13/11/22


#Verificar a existência do Bioconductor e do ggtree

# if (!require("BiocManager", quietly = TRUE))
#   install.packages("BiocManager")

# install.packages("tidyverse")
# BiocManager::install("ggtree")

##Bibliotecas

library(ggtree)
library(tidyverse)
library(tidytree)

#Diretório
setwd("path")

#Dados

#exemplo
tree <- read.tree("example_aln.treefile")

MRCA(tree,"Whale","Human")

#tree
ggtree(tree, color="black", size=1, linetype=1) + geom_tiplab(as_ylab=TRUE, color='firebrick') + ggtitle("Árvore Filogenética") +
  geom_cladelabel(node=31, label="Pool 1 & Y96",
                  color="blue", offset=0.01) + 
  geom_point2(aes(subset=(node==1)), shape=21, size=5, fill='purple') + geom_point2(aes(subset=(node==9)), shape=21, size=5, fill='green') + geom_cladelabel(node=1, label="...",color="blue", offset=0.01)
