# library(googledrive)
# drive_find(n_max = 30)

##Gabriel Montenegro de Campos
##10-10-22

##Diretório

setwd("C:/Users/gabri/Dropbox/PC/Desktop/USP/Metagenômica/Dados")

##Bibliotecas
library(viridis)
library(readr)
library(ggsci)

##Dados
df <- read_csv("data_poster.csv")
View(df)

virus <- df$Viruses

#Piechart do controle positivo 1
c1 <- as.matrix(df$controle_pos_1)
rownames(c1) <- virus

c1 <- subset(c1,c1 != 0)
View(c1)

col_sci <-  pal_ucscgb("default", alpha = 0.7)(7) #paleta de cores

piepercent<- round(100*c1/sum(c1), 1)


pie(c1, col = col_sci, labels = piepercent, main = "Controle Positivo 1")
legend("topleft",
       cex= 1,
       virus,
       fill = col_sci,
       legend = rownames(c1))

#Piechart do controle positivo 2

c2 <- as.matrix(df$controle_pos_2)
rownames(c2) <- virus

c2 <- subset(c2,c2 != 0)
View(c2)

piepercent<- round(100*c2/sum(c2), 1)


pie(c2, col = col_sci, labels = piepercent, main = "Controle Positivo 2")
legend("topleft",
       cex= 1,
       virus,
       fill = col_sci,
       legend = rownames(c2))

#Piechart do controle positivo 4

c4 <- as.matrix(df$controle_ps_4)
rownames(c4) <- virus

c4 <- subset(c4,c4 != 0)
View(c4)

piepercent<- round(100*c4/sum(c4), 1)


pie(c4, col = col_sci, labels = piepercent, main = "Controle Positivo 4")
legend("topleft",
       cex= 1,
       virus,
       fill = col_sci,
       legend = rownames(c4))
