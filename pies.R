##Gabriel Montenegro de Campos
##14-09-22

##Diretório

setwd("path")

##Bibliotecas
library(viridis)
library(readr)
library(ggsci)

##Dados
Classificador <- read_csv("file")
View(Classificador)
viruses <- Classificador$Virus

par(mfrow=c(2,2))

##Kraken2

kr <- Classificador$Kraken2
kr <- as.matrix(kr) #transformar em matriz e remover a coluna dos vírus
rownames(kr) <- viruses
View(kr)


#Gráfico de Pizza do Kraken2

mypal = pal_tron("legacy", alpha = 1)(6) #paleta de cores

kr_piepercent <- round(100*log(mx[1:6,1])/sum(log(mx[1:6,1])),1)
#kr_piepercent<- round(100*(kr)/sum(kr), 1)
kr_piepercent <- subset(kr_piepercent,kr_piepercent != 0)
# kr_piepercent <- subset(kr_piepercent,kr_piepercent >= 0.5)


pie(log(kr), labels = kr_piepercent, col = mypal, main = "Kraken2 - Resultados")
legend("topleft", virus, cex = 0.8,
       fill = mypal,
       legend = viruses)

##Kaiju

kj <- Classificador$Kaiju
kj <- as.matrix(kj)
rownames(kj) <- viruses
View(kj)

#Gráfico de Pizza do Kaiju

kj_piepercent <- round(100*log(mx[1:6,2])/sum(log(mx[1:6,2]),1))
# kj_piepercent <- round(100*kj/sum(kj), 1)
kj_piepercent <- subset(kj_piepercent,kj_piepercent != 0)
# kj_piepercent <- subset(kj_piepercent,kj_piepercent > 0.5)


pie(log(mx[1:6,2]), labels = kj_piepercent, col = mypal, main = "Kaiju - Resultados")
legend("topleft", virus, cex = 0.8,
       fill = mypal,
       legend = viruses)

##Diamond

dm <- Classificador$Diamond
dm <- as.matrix(dm)
rownames(dm) <- viruses
View(dm)

#Gráfico de Pizza do Diamond

dm_piepercent <- round(100*log(mx[1:6,3])/sum(log(mx[1:6,3]),1))
# dm_piepercent <- round(100*dm/sum(dm), 1)
dm_piepercent <- subset(dm_piepercent,dm_piepercent != 0)
# dm_piepercent <- subset(dm_piepercent,dm_piepercent > 0.5)


pie(log(mx[1:6,3]), labels = dm_piepercent, col = mypal, main = "Diamond - Resultados")
legend("bottomright", virus, cex = 0.6,
       fill = mypal,
       legend = viruses)

##CLARK

cl <- Classificador$CLARK
cl <- as.matrix(cl)
rownames(cl) <- viruses
View(cl)

#Gráfico de Pizza do CLARK

cl_piepercent <- round(100*log(mx[1:6,4])/sum(log(mx[1:6,4]),1))
# cl_piepercent <- round(100*cl/sum(cl), 1)
cl_piepercent <- subset(cl_piepercent,cl_piepercent != 0)
# cl_piepercent <- subset(cl_piepercent,cl_piepercent >= 0.5)


pie(log(mx[1:6,4]), labels = cl_piepercent, col = mypal, main = "CLARK - Resultados")
legend("left", virus, cex = 0.8,
       fill = mypal,
       legend = viruses)
