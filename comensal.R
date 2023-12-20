#Diretório
setwd('/Dados')

#biblioteca
library(readr)
library(viridis)
library(tidyverse)
library(plyr)
library(ggplot2)
library(ggsci)
library(wesanderson)
library(ggpubr)

#Dado
data_c <- read_delim("Comensais.csv", delim = ',')
virus <- data_c$virus
data_c <- replace(x = data_c, list = is.na(data_c), values = 0)
pool <- colnames(data_c[2:12])
# ttmdv <- virus[1:13]
# ttmv <- virus[14:28]
# ttv <- virus[29:56]
#sp <- c("Torque Teno midi Virus", "Torque Teno mini Virus", "Torque Teno Virus")

#cores

c56 <- c(
  "#FD6467",
  "#6A3D9A",
  "blue", 
  "#D9D0D3",
  "skyblue3", "pink1",
  "palegreen2",
  "#CAB2D6", 
  "#E7727A", 
  "gray70", "#79402E",
  "deeppink1", "#D67236", "#CC33FFFF",
  "darkturquoise", "grey", "#66FBAA",
  "darkorange", "brown", "#739B58FF", "#3B1B53FF",
  "red", "#CCFFFFFF", "#66FFFF", "green3", "#A5161C", "#0D8A53", "#F60072", "#BEEAD5", "#F18D8C", "#7C870D", "#1CFFAA", "#873B60", "#D888FA", "#F80DAA", "#F65A49", "#7500BD", "#EFBAEA", "#0047BC", "#8FEBAD", "#BB761C", "#FAC200", "#F462FF", "#AE2680", "#BE9B79", "#355500", "#F96A81", "#E694B1", "#A88CD5", "#6DA3DD", "#FC5CCD", "#1C85FF", "#8E70FF", "#BEAA16", "#0DACFD", "#A5BE0D"
)

#length(c56)

#cols = c("#DADAEB", "#9E9AC8", "#6A51A3")

#cor = ggsci::pal_igv(palette = c("default", "alternating"), alpha = 1)

#Objetos

virus_name <- rep(virus, 11)

pool_number <- rep(pool, each = 56)

# species <- rep(sp, times = c(13,15,28))
# speciess <- rep(species, each = 11)

mylist <- list()

for (i in 2:12){
  join_virus <- data_c[1:56,i]
  soma <- sum(data_c[1:56,i])
  percent <-  (join_virus/soma)*100
  mylist[[i]] <- percent
}

df <- data.frame(virus_name, pool_number)
dftest <- data.frame(mylist[2:12])

percent_df <- data.frame(Pool.1=unlist(dftest, use.names = F))
join(df, percent_df)
df <- data.frame(virus_name, pool_number, percent_df)

df["percent"] <- percent_df$Pool.1
df$Pool.1 <- NULL

#write.csv(df, "test.csv", row.names=FALSE)

df2 <- read_delim("test.csv", delim = ',')
table(df2$Type)
#tt <- with(df2[!duplicated(df2$pool_number), ], table(Type))

data2 <- df2
data2$pool_number <- factor(data2$pool_number, levels = c("Pool 1", "Pool 2", "Pool 3", "Pool 4", "Pool 5", "Pool 6", "Pool 7", "Pool 8", "Pool 9", "Pool 10", "Pool 11"))

p <- ggplot(data2, aes(x = pool_number, y = percent, fill = Type)) + 
  geom_bar(stat="identity", width=0.5, color = "black")
  theme_classic()
p + ggtitle("Commensal Viruses") + xlab("Pool") + ylab("Reads (%)") + labs(fill = "Viruses")



#Dado
data_ttv <- read_delim("TTVs.csv", delim = ',')
virus <- data_ttv$virus
data_ttv <- replace(x = data_ttv, list = is.na(data_ttv), values = 0)
pool <- colnames(data_ttv[2:12])


virus_name <- rep(virus, 11)

pool_number <- rep(pool, each = 3)

mylist <- list()

for (i in 2:12){
  join_virus <- data_ttv[1:3,i]
  soma <- sum(data_ttv[1:3,i])
  percent <-  (join_virus/soma)*100
  mylist[[i]] <- percent
}

df <- data.frame(virus_name, pool_number)
dftest <- data.frame(mylist[2:12])

percent_df <- data.frame(Pool.1=unlist(dftest, use.names = F))
join(df, percent_df)
df <- data.frame(virus_name, pool_number, percent_df)

df["percent"] <- percent_df$Pool.1
df$Pool.1 <- NULL


data3 <- df
data3$pool_number <- factor(data3$pool_number, levels = c("Pool 1", "Pool 2", "Pool 3", "Pool 4", "Pool 5", "Pool 6", "Pool 7", "Pool 8", "Pool 9", "Pool 10", "Pool 11"))
p <- ggplot(data3, aes(x = pool_number, y = percent, fill = virus_name)) + 
  geom_bar(stat="identity", width=0.5) + theme_classic()
p + ggtitle("Torque Teno Viruses") + xlab("Pool") + ylab("Reads (%)") + labs(fill = "Viruses")


#Dado
data <- read_delim("Doenças_Febris.csv", delim = ',')
virus <- data$virus
data <- replace(x = data, list = is.na(data), values = 0)
pool <- colnames(data[2:13])

#cores

c35 <- c("blue1", "yellow", "red", "purple", "brown", "black", "pink", "green", "firebrick", "skyblue", "gold1", "darkturquoise", "khaki3", "orange", "orchid", "deeppink1", "blue4", "steelblue4", "blue3", "yellow4", "darkorange4", "#B284BE", "#54626F", "#702963", "#00CC99")

length(c35)

#Objetos

virus_name <- rep(virus, 12)

pool_number <- rep(pool, each = 25)

mylist <- list()

for (i in 2:13){
  join_virus <- data[1:25,i]
  soma <- sum(data[1:25,i])
  percent <-  (join_virus/soma)*100
  mylist[[i]] <- percent
}

df <- data.frame(virus_name, pool_number)
dftest <- data.frame(mylist[2:13])

percent_df <- data.frame(Pool.1=unlist(dftest, use.names = F))
join(df, percent_df)
df <- data.frame(virus_name, pool_number, percent_df)

df["percent"] <- percent_df$Pool.1
df$Pool.1 <- NULL

data1 <- df
data1$pool_number <- factor(data1$pool_number, levels = c("Pool 1", "Pool 2", "Pool 3", "Pool 4", "Pool 5", "Pool 6", "Pool 7", "Pool 8", "Pool 9", "Pool 10", "Pool 11", "Pool 12"))

p <- ggplot(data1, aes(x = pool_number, y = percent, fill = virus_name)) + 
  geom_bar(stat="identity", width=0.5, colour="black") + scale_fill_manual(values = c35) +
  theme_classic()
p + xlab("Pool") + ylab("Reads (%)") + labs(fill = "Viruses")


#Dados
data4 <- read_delim("Total_Reads.csv", delim = ',')
data4 <- as.data.frame(data4)
brk <- seq(0,16, by = 2)
data4$virus <- factor(data4$virus,                                    # Change ordering manually
  levels = c("Influenza A virus", "Orthoherpesviridae", "Polyomaviridae", "Papillomaviridae", "Picornaviridae", "Respiratory Syncytial Virus"))


plt <- ggplot(data4) +
  geom_col(aes(log(Total), virus, fill = virus), width = 0.5) + scale_fill_manual(values = c("#bf9000","#fa8072","#f471e9","#48ca48","#19b0d8","#9989c9"))  + theme_classic() + theme(legend.position="none")
plt  +
  xlab("log(Nº Reads)") + ylab("Viral Family") + scale_x_continuous(breaks=brk)

