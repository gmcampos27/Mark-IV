#Diretório
setwd('path')

#biblioteca
library(readr)
library(viridis)
library(tidyverse)
library(ggplot2)
library(ggsci)
library(wesanderson)

#Dado
data <- read_delim("DoençasFebris.csv", delim = ',')
virus <- data$virus
data <- replace(x = data, list = is.na(data), values = 0)
pool <- colnames(data[2:14])

##Filtro, caso necessário

mx <- as.matrix(data[-1]) ##tirou a coluna de vírus
rownames(mx) <- virus


#cores

c39 <- c(
  "dodgerblue2", "#E31A1C", # red
  "green4",
  "#6A3D9A", # purple
  "#FF7F00", # orange
  "black", "gold1",
  "skyblue3", "#FB9A99", # lt pink
  "palegreen2",
  "#CAB2D6", # lt purple
  "#FDBF6F", # lt orange
  "gray70", "khaki2",
  "maroon", "orchid1", "deeppink1", "blue1", "red",
  "darkturquoise", "grey", "yellow", "yellow3",
  "darkorange4", "brown", "#3182BDFF", "#E6550DFF", "#739B58FF", "#3B1B53FF", "#6BD76BFF",
  "#D3333B", "#5DB1DDFF", "#C75127FF", "#CC33FFFF", "#CCFFFFFF", "#66FFFF", "#00FF00FF",
  "#E6A0C4", "#7294D4"
)

length(c39)
col = pal_ucscgb("default")(19)
library("scales")
show_col(pal_ucscgb("default")(19))

#Objetos

virus_name <- rep(virus, 13)

pool_number <- rep(pool, each = 39)

mylist <- list()

for (i in 2:14){
  join_virus <- data[1:39,i]
  soma <- sum(data[1:39,i])
  percent <-  (join_virus/soma)*100
  mylist[[i]] <- percent
}

df <- data.frame(virus_name, pool_number)
dftest <- data.frame(mylist[2:14])

percent_df <- data.frame(Pool.1=unlist(dftest, use.names = F))
join(df, percent_df)
df <- data.frame(virus_name, pool_number, percent_df)

df["percent"] <- percent_df$Pool.1

data1 <- df
data1$pool_number <- factor(data1$pool_number, levels = c("Pool 1", "Pool 2", "Pool 3", "Pool 4", "Pool 7", "Pool 8", "Pool 9", "Pool 10", "Pool 11", "Pool 12", "Pool 13", "Pool 14" ,"Pool 15"))

p <- ggplot(data1, aes(x = pool_number, y = percent, fill = virus_name)) + 
  geom_bar(stat="identity", width=0.5, colour="black") + scale_fill_manual(values = c39)
p + ggtitle("Frebile Illness") + xlab("Pool") + ylab("Reads (%)") + labs(fill = "Viruses")

