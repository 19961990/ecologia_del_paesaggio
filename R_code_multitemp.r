#Rcode analisi multitemporale di variazione della landcover
setwd("C:/lab/")
library(raster)
defor1 <- brick("defor1_.jpg")
defor2 <- brick("defor2_.jpg")
#defor 1
#names defor1_.1,defor1_.2,defor1_.3
#defor1_.1=NIR
#defor1_.2=RED
defor1_.3=GREEN
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")

#exercise della seconda data
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")
par(mfrow=c(2,2))plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")# PAR SERVE PER IL PLOT DI 2 OGGETTI INSIEME
#CLassificazione non supervisata di defor 1 e 2
library(RStoolbox) #prima chiamare r stoolbox e poi usare la funzione unsuperclass
defor1_c <- unsuperClass(defor1, nClasses=2)
d1c <- unsperClass(defor1, nClasses=2)
plot(defor1_c$map)
cl <- colorRampPalette(c('darkblue','blue','light blue'))(100)#ci facciamo un color rampe palette er visualizzare
plot(defor1_c$map, col=cl)
#ho ottenuto colori diversi dal prof quindi questa e la possibilita 2
cl <- colorRampPalette(c('green','black'))(100)
plot(defor1_c$map, col=cl)
#classificazione defor2
#exercise classificazione con classi l immagine satellitare di defor2
defor2_c <- unsuperClass(defor2, nClasses=2)
plot(defor2_c$map)
#
par(mfrow=c(2,1))
plot(defor1_c$map, col=cl)
plot(defor2_c$map, col=cl)

#la frequenza
freq(defor1_c$map)
#aree aperte 36827
#foreste  304465
totd1 <- 36827 +304465 
totd1 341292
#le proporzione

#percentuale delle nostre frequennze
 percent1 <- freq(defor_1c$map) * 100 / totd1= 0,00227940
#PERCENTUALI si mette su R percent1 per calcolare
#FORESTE=10.79047
#aree =89.20953
#la frequenza defor 2
 freq(defor2_c$map) #su R
 #foreste 179321
 #aree aperte 163405
 totd2 <- 179321 + 163405
totd2=342726
 percent2 <- freq(d2c$map) * 100 / totd2
 percent2
 #foreste 52.32197
 #aree aperte 52.32197
 #vedere la copertura forestale prima e dopo la deforestazione
cover <- c("Agriculture","Forest")
before <- c(10.7,89.20)
after <- c(47.67,52.32)
#creare colonna con dati che decidiamo con dataframe
output <- data.frame(cover,before,after)
View(output) : cover before after
1 Agriculture   10.7 47.67
2      Forest   89.2 52.32
10.7904752.32197

library(ggplot2)#per plottare le mappe raster







