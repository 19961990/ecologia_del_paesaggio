setwd("C:/lab/")
library(raster)
d1c <- raster("d1c.tif")#caricare la prima mappa,usare la funzione brick per caricarebtutte le bande e rastrer per un solo bando
d2c <- raster("d2c.tif")
par(mfrow=c(1,2))#con par mettiamo piu plot a l interno del grafico finale
cl <- colorRampPalette(c('green','black'))(100) #
plot(d1c,col=cl)
plot(d2c,col=cl)

par(mfrow=c(1,2))#la mappancoretta perche la foresta e la classe 2 e quella dell algicultura la classe 1
cl <- colorRampPalette(c('black','green'))(100) #
plot(d1c,col=cl)
plot(d2c,col=cl)
#per annullare alcuni valori  si usa Cbind NA attraverso la funzione reclassify
d1c.for <- reclassify(d1c, cbind(1,NA))
par(mfrow=c(1,2))
cl <- colorRampPalette(c('black','green'))(100) #
plot(d1c,col=cl)
plot(d1c.for)
par(mfrow=c(1,2))
cl <- colorRampPalette(c('black','green'))(100) #
plot(d1c,col=cl)
plot(d1c.for, col=cl)
d2c.for <- reclassify(d2c, cbind(1,NA))#reclassifcare la classe 1
par(mfrow=c(1,2))
plot(d1c)
plot(d2c)
#creare i patch
install.packages("igraph")
library(igraph) # for pacthes
d1c.for.pacthes <- clump(d1c.for)
d2c.for.pacthes <- clump(d2c.for)
writeRaster(d1c.for.pacthes, "d1c.for.patches.tif")# writw raster  usato per scrivere  i file d1c e d2c nella cartella lab
writeRaster(d2c.for.pacthes, "d2c.for.patches.tif")
#plottare le mappe uno accanto a l altro
par(mfrow=c(1,2))
plot(d1c.for.pacthes)
plot(d2c.for.pacthes
clp <- colorRampPalette(c('dark blue','blue','green','orange','yellow','red'))(100) # 
par(mfrow=c(1,2))
plot(d1c.for.pacthes, col=clp)
plot(d2c.for.pacthes, col=clp)
#si aggiunge la funzione time per avere before and after deforestation
time <- c("Before deforestation","After deforestation")
npatches <- c(301,1212)


output <- data.frame(time,npatches)#output per vedere il plot finale
attach(output)
library(ggplot2)
ggplot(output, aes(x=time, y=npatches, color="red")) + geom_bar(stat="identity", fill="white")
#l altra avevamo visto la variazione dell aria adesso abbiamo visto la variazione dei patch










