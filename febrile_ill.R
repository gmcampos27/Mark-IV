##Gabriel Montenegro de Campos
##19-08-22

##Diretório

setwd("path")

##Bibliotecas
library(viridis)
library(readr)

##Dados
All <- read_csv("file.csv")
View(All)

virus <- file$viruses

##Filtro, caso necessário

mx <- as.matrix(All[-1]) ##tirou a coluna de vírus
rownames(mx) <- virus
View(mx)

##Barplot

#cores

c25 <- c(
  "dodgerblue2", "#E31A1C", # red
  "green4",
  "#6A3D9A", # purple
  "#FF7F00", # orange
  "black", "gold1",
  "skyblue2", "#FB9A99", # lt pink
  "palegreen2",
  "#CAB2D6", # lt purple
  "#FDBF6F", # lt orange
  "gray70", "khaki2",
  "maroon", "orchid1", "deeppink1", "blue1", "steelblue4",
  "darkturquoise", "green1", "yellow4", "yellow3",
  "darkorange4", "brown"
)


barplot(mx, col = c25, main = "Febrile Illnesses", xlab = "Pool", ylab = "Reads", ylim = c(0,8000))
legend(x = 2,  y = 7000,
       fill = c25,
       border = 'black',
       title = "Viruses",
       legend = virus,
       cex = 0.9
)

##Gráficos usando o ggplot2
print("thinking...")
