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

#colours 
c23 <- c(
  "dodgerblue2", "#E31A1C", # red
  "green4",
  "#6A3D9A", # purple
  "black", "gold1",
  "skyblue2", "#FB9A99", # lt pink
  "palegreen2",
  "#CAB2D6", # lt purple
  "gray70", "khaki2",
  "maroon", "orchid1", "deeppink1", "blue1", "steelblue4",
  "darkturquoise", "green1", "yellow4", "yellow3",
  "darkorange4", "brown"
)
barplot(log(mx), col = c23, main = "title", ylab = "reads", horiz = FALSE)
legend("topleft",
       fill = c23,
       border = 'black',
       title = "Viruses",
       legend = virus,
       cex = 0.8
)       


##REGRESSÃO LINEAR

library(ggplot2)
#par(mfrow=c(2,2))

# peso <- c(45,50,60,55,58,56,48,53)
# altura <- c(1.54,1.56,1.65,1.60,1.65,1.63,1.58,1.59)
# plot(peso, altura)
# lm(altura ~ peso)
# ggplot(mapping = aes(peso, altura)) +
# geom_point() +
# geom_smooth(method = "lm")

#filtro
linhas <- c(3,4,5) #não tenho o valor de ct nessas linhas
Pool_25 <- Pool_25[-linhas,]

#----Kraken2----

# plot(log(Pool_25$Kraken2), log(Pool_25$CT),pch = 19, col = colours)
# lm(log(Pool_25$CT)~log(Pool_25$Kraken2))
# abline(lm(log(Pool_25$CT)~log(Pool_25$Kraken2)), col = 99)

#Valores
SQt = sum((mean(log(Pool_25$CT)) - log(Pool_25$CT))**2)
SQres = sum((predict(lm(log(Pool_25$CT)~log(Pool_25$Kraken2))) - log(Pool_25$CT))**2)
R2 = (SQt - SQres) / SQt

#Plot
reta <- ggplot(mapping = aes(log(Pool_25$Kraken2), log(Pool_25$CT))) +
  geom_point(aes(color = Pool_25$Virus), size = 3) +
  geom_smooth(method = "lm", se = F) +
  geom_hline(yintercept = mean(log(Pool_25$CT))) +
  labs(
    x = "Reads",
    y = "Cq-Value",
    title = "Kraken2",
    subtitle = print(paste0("R2 ",(100*round(R2,4)),"%")),
    color = "Viruses"
  )
reta

#Adequação a reta média
reta + geom_segment(aes(x = log(Pool_25$Kraken2), y = log(Pool_25$CT),
               xend = log(Pool_25$Kraken2), yend = mean(log(Pool_25$CT))), color="red")

#Adequação a reta de regressão
reta + geom_segment(aes(x = log(Pool_25$Kraken2), y = log(Pool_25$CT),
                 xend = log(Pool_25$Kraken2), yend = predict(lm(log(Pool_25$CT) ~ log(Pool_25$Kraken2)))), color="purple")

#----Kaiju-----

# plot(log(Pool_25$Kaiju), Pool_25$CT)
lm(log(Pool_25$CT)~log(Pool_25$Kaiju))
# abline(lm(Pool_25$CT~log(Pool_25$Kaiju)),col = 6)

#Valores
SQres = sum((predict(lm(log(Pool_25$CT)~log(Pool_25$Kaiju))) - log(Pool_25$CT))**2)
R2 = (SQt - SQres) / SQt

#Plot
reta <- ggplot(mapping = aes(log(Pool_25$Kaiju), log(Pool_25$CT))) +
  geom_point(aes(color = Pool_25$Virus), size = 3) +
  geom_smooth(method = "lm", se = F) +
  geom_hline(yintercept = mean(log(Pool_25$CT))) +
  labs(
    x = "Reads",
    y = "Cq-Value",
    title = "Kaiju",
    subtitle = print(paste0("R2 ",(100*round(R2,4)),"%")),
    color = "Viruses"
  )
reta

#Adequação a reta média
reta + geom_segment(aes(x = log(Pool_25$Kaiju), y = log(Pool_25$CT),
                        xend = log(Pool_25$Kaiju), yend = mean(log(Pool_25$CT))), color="red")

#Adequação a reta de regressão
reta + geom_segment(aes(x = log(Pool_25$Kaiju), y = log(Pool_25$CT),
                        xend = log(Pool_25$Kaiju), yend = predict(lm(log(Pool_25$CT) ~ log(Pool_25$Kaiju)))), color="purple")


#----Diamond----

# plot(log(Pool_25$Diamond[1:2]), log(Pool_25$CT[1:2]))
lm(log(Pool_25$CT)~log(Pool_25$Diamond))
# abline(lm(log(Pool_25$CT[1:2])~log(Pool_25$Diamond[1:2])),col = 74)

#Valores

SQres = sum((predict(lm(log(Pool_25$CT)~log(Pool_25$Diamond))) - log(Pool_25$CT))**2)
R2 = (SQt - SQres) / SQt

#Plot
reta <- ggplot(mapping = aes(log(Pool_25$Diamond), log(Pool_25$CT))) +
  geom_point(aes(color = Pool_25$Virus), size = 3) +
  geom_smooth(method = "lm", se = F) +
  geom_hline(yintercept = mean(log(Pool_25$CT))) +
  labs(
    x = "Reads",
    y = "Cq-Value",
    title = "Diamond",
    subtitle = print(paste0("R2 ",(100*round(R2,4)),"%")),
    color = "Viruses"
  )
reta

#Adequação a reta média
reta + geom_segment(aes(x = log(Pool_25$Diamond), y = log(Pool_25$CT),
                        xend = log(Pool_25$Diamond), yend = mean(log(Pool_25$CT))), color="red")

#Adequação a reta de regressão
reta + geom_segment(aes(x = log(Pool_25$Diamond), y = log(Pool_25$CT),
                        xend = log(Pool_25$Diamond), yend = predict(lm(log(Pool_25$CT) ~ log(Pool_25$Diamond)))), color="purple")

#----CLARK----

# plot(log(Pool_25$CLARK[1:2]), log(Pool_25$CT[1:2]))
# lm(log(Pool_25$CT)~log(Pool_25$CLARK))
# abline(lm(log(Pool_25$CT[1:2])~log(Pool_25$CLARK[1:2])),col = 47)

#Valores
SQres = sum((predict(lm(log(Pool_25$CT)~log(Pool_25$CLARK))) - log(Pool_25$CT))**2)
R2 = (SQt - SQres) / SQt

#Plot
reta <- ggplot(mapping = aes(log(Pool_25$CLARK), log(Pool_25$CT))) +
  geom_point(aes(color = Pool_25$Virus), size = 3) +
  geom_smooth(method = "lm", se = F) +
  geom_hline(yintercept = mean(log(Pool_25$CT))) +
  labs(
    x = "Reads",
    y = "Cq-Value",
    title = "CLARK",
    subtitle = print(paste0("R2 ",(100*round(R2,4)),"%")),
    color = "Viruses"
  )
reta

#Adequação a reta média
reta + geom_segment(aes(x = log(Pool_25$CLARK), y = log(Pool_25$CT),
                        xend = log(Pool_25$CLARK), yend = mean(log(Pool_25$CT))), color="red")

#Adequação a reta de regressão
reta + geom_segment(aes(x = log(Pool_25$CLARK), y = log(Pool_25$CT),
                        xend = log(Pool_25$CLARK), yend = predict(lm(log(Pool_25$CT) ~ log(Pool_25$CLARK)))), color="purple")
