library(ggtree)
library(ape)
library(ggplot2)
library(phangorn)
library(tidyr)
library(phytools)
library(tidyverse)
library(Biostrings)
library(RColorBrewer)
library(treeio)

#Definindo diretorio de trabalho
setwd("path")

#Carregando a arvore .treefile e os metadados .txt separados por tab

tree <- read.beast("nipa_aln_V4RELSKYLINE20MLroot-combined.tree") # importa a arvore. pacote ape
#rooted_tree <- midpoint(tree) # faz o root midpoint. pacote phangorn

p <- ggtree(tree, mrsd="2019-06-10") + 
  theme_tree2() + geom_text(aes(label=node), hjust=-.2, size=) #+ geom_treescale(x = 1999, y = 1)  + layout_dendrogram(), aes(color = posterior)
p

#msaplot(p=ggtree(rooted_tree), fasta="nipa_aln_V4.fasta")

metadata <- read.table("paises_metadados.txt", sep="\t", header=TRUE,check.names=FALSE, stringsAsFactor=F) #importa metadados

p <- p %<+% metadata
p + geom_tippoint(aes(color= Country), size = 4, shape = 19) +
  geom_nodepoint() + theme(legend.position = 'left') #+  geom_text2(aes(label=label), size = 3, vjust = -1)


p +
  geom_tippoint(aes(color= Country), size = 4, shape = 19) +
  geom_nodepoint(aes(fill = posterior), shape = 21, size = 1) +
  theme_tree2() + theme(legend.position = 'right')


#ÁRVORE FINAL 
#Bibliotecas
library(ggplot2)
library(ape)
library(repr)
library("readxl")
library('gridExtra')
#library(tidyverse)
library(dplyr)
library(hrbrthemes)
library(ggpubr)
library(cowplot)
library(ggthemes)
library(viridis)
library(ggrepel)
library("ggsci")
library(ggalt)
library("Hmisc")
library("scales")

# load pacakges
library(ggtree)
library(tidyverse)
library(tidytree)
library(ape)
library(treeio)

#cores
palette <-c("cornflowerblue", "cadetblue2","chartreuse", "aquamarine4","darkgoldenrod1","chocolate4","deepskyblue2", 'dodgerblue3',  "firebrick2","coral2","peru", "blueviolet", "darkorchid2","antiquewhite","darkorange1","deeppink1", "darkred",  "yellowgreen", "cyan2",   "magenta",  "rosybrown",  "thistle4","red")

#Importar a árvore

tree_niv <- read.beast("nipa_aln_V4RELSKYLINE20MLroot-combined.tree")

metadados <- read_excel('metadados_final.xlsx')
metadados$Clade <- as.character(metadados$clade)

# transform dates
metadados$Date <- as.Date(cut(metadados$date,
  breaks = "week",
  start.on.monday = FALSE))

metadados$Date2 <- as.Date(cut(metadados$date,
  breaks = "2 week",
  start.on.monday = FALSE))

metadados$Date3 <- as.Date(cut(metadados$date,
  breaks = "1 month",
  start.on.monday = FALSE))

p_niv1 <- ggtree(tree_niv, mrsd="2019-06-10", as.Date=TRUE,color='black',size=0.1) %<+% metadados + theme_tree2()
p_niv1# + geom_text(aes(label=node), hjust=-.2, size=3)

p_niv2<-p_niv1 +
  scale_fill_manual(values = c('dodgerblue3','darkseagreen4','hotpink3','purple3'),name='Sampling locations',na.value="grey90")+
  #geom_tippoint(fill='black',size=2, align=F, color='black',shape=21, stroke=0.1) +
  geom_tippoint(aes(fill=location),size=3, color='black',shape=21, stroke=0.1) +
  #geom_tippoint(aes(
  # subset=(location=='Paraguay' & location=="REDE")),size=5, align=F, color='red3',shape=21, stroke=0.5) +
  scale_x_date(date_labels = "%B-%Y",date_breaks = "24 months") +
  theme(axis.text=element_text(size=5)) +
  #expand_limits(y = 11000) +
  ggplot2::ylim(0, 70)+
  theme(axis.text.x = element_text(size=8.5,hjust = 1,vjust=0.5, angle=90))+
  guides(fill = guide_legend(override.aes = list(size=5)))

p_niv2

#transformar em numeric
ggtree(tree_niv,mrsd="2019-06-10")  +
  geom_nodelab(aes(x=branch, label=round(posterior, 2)), vjust=-.5, size=3) +
  theme(legend.position=c(.1, .8))


metaDATA_NIV <- data.frame(Genotype = metadados$genotype,Clade = metadados$clade, Host = metadados$host, Location =metadados$location)
rownames(metaDATA_NIV) <- metadados$name


p_niv <- ggtree(tree_niv, mrsd="2019-06-10")%<+% metadados +
  theme(legend.position = "left")  + 
  theme_tree2() +
  geom_tippoint(aes(fill=location), shape = 21, size= 3) +
  scale_x_continuous(breaks = c(1998, 2000, 2002, 2004, 2006, 2008, 2010, 2012, 2014, 2016, 2018, 2020))+
  ggplot2::ylim(0, 65) #+ geom_nodelab(aes(x=branch, label=round(posterior, 2)), vjust=-.5, size=3)# + geom_cladelab(node=99, label="A", offset =-40, offset.text = -20) + geom_cladelab(node=85, label="B", offset =-40, offset.text = -20) + geom_cladelab(node=72, label="C", offset =  -40, offset.text = -20) + geom_cladelab(node=82, label="D", offset =  -40, offset.text = -20) + geom_cladelab(node=64, label="E", offset = - 39, offset.text = -19.95)

p_niv

gheatmap(p_niv, metaDATA_NIV, offset = 0.01, width=0.15, font.size=3, colnames_position= "top", colnames_angle = 0, colnames_offset_y = 0.5, hjust = 0.5, legend_title = "Values")  + 
  scale_fill_manual(values= palette) +
  scale_y_continuous(expand=c(0, 0.3)) + theme(legend.justification=c(0, 1),
    legend.background = element_rect(),
    legend.key = element_blank(),
    legend.key.size = unit(.8, 'cm'),
    title = element_blank())
