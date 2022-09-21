##Gabriel Montenegro de Campos
##30-08-22

##Diretório

setwd("path")

##Bibliotecas
library(viridis)
library(readr)
library(RColorBrewer)

##Dados
Pool <- read_csv("file") #não precisar ser .csv
View(Pool)

#FILTROS

virus <- Pool$Virus

Pool <- Pool[-5] #CLARK
Pool <- Pool[-3:-4] #kaiju e Diamond
Pool <- Pool[-2] #Kraken2

#mx[is.null(mx)] <- 1


mx <- as.matrix(Pool[-1]) ##tirou a coluna de vírus
rownames(mx) <- virus
log(mx)
View(mx)

colours <- brewer.pal(6, 'Set1') #6 vírus
barplot(log(mx), col = colours, main = "Comparação dos Classificadores", ylab = "log(Nº de Reads)", horiz = FALSE, ylim = c(0,35))
legend('topleft',
       fill = colours,
       border = 'black',
       title = "Viruses",
       legend = virus,
       cex = 0.7

)       

# library(ggplot2)
# ggplot(Pool_13, aes(Virus,Pool_13$Kaiju))+
# geom_bar(stat = "identity", fill = "green",
#         color = "black", width = 0.40)
