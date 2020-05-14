#R code for analysing NO2 data from USA
library(raster)
setwd("C:/lab/")
EN01 <- raster("EN_0001.png")
plot(EN01)
# EXERCISE importare tutte le immagine
EN02 <- raster("EN_0002.png")  
plot(EN02) 
EN03 <- raster("EN_0003.png")
plot(EN03)
EN04 <- raster("EN_0004.png")
plot(EN04)
EN05 <- raster("EN_0005.png")
plot(EN05)
EN06 <- raster("EN_0006.png")
plot(EN06)
EN07 <- raster("EN_0007.png")
plot(EN07)
EN08 <- raster("EN_0008.png")
plot(EN08)
EN09 <- raster("EN_0009.png")
plot(EN09)
EN010 <- raster("EN_00010.png")
plot(EN010)
EN011 <- raster("EN_00011.png")
plot(EN011)
EN012 <- raster("EN_00012.png")
plot(EN012)
EN013 <- raster("EN_00013.png")
plot(EN013)
#per cambiare colori
 cl <- colorRampPalette(c('red','orange','yellow'))(100) #
    
cl <- colorRampPalette(c('red','orange','yellow'))(100) # 
plot(EN01, col=cl)
plot(EN13, col=cl)
#per vederle inseme
par(mfrow=c(1,2))
plot(EN01, col=cl)
plot(EN13, col=cl)
# PER VEDERE DIFFERENZE
dev.off()
difno2 <- EN13 - EN01
cldif <- colorRampPalette(c('blue','black','yellow'))(100) #
plot(difno2, col=cldif)
par(mfrow=c(4,4))
plot(EN01, col=cl)
par(mfrow=c(4,4))
plot(EN01, col=cl)
plot(EN02, col=cl)
plot(EN03, col=cl)
plot(EN04, col=cl)
plot(EN05, col=cl)
plot(EN06, col=cl)
plot(EN07, col=cl)
plot(EN08, col=cl)
plot(EN09, col=cl)
plot(EN10, col=cl)
plot(EN11, col=cl)
plot(EN12, col=cl)
plot(EN13, col=cl)

 #Metodo per caricare tutti i file con ciclo for:
    
library(raster)

setwd("~/lab/esa_no2")
# put all files into the folder

rlist=list.files(pattern=".png", full.names=T)

#save raster into list
#con lappy

list_rast=lapply(rlist, raster)

#con ciclo for
list_rast=list()
for(i in 1:length(rlist)){
  r=raster(rlist[[i]])
  list_rast[[i]]=r} 
#6 maggio
setwd("C:/lab/")
load("EN.RData")
setwd("C:/lab/esa_NO2")
rlist <- list.files(pattern=".png")# list file e la lista dei file a l interno della cartella
rlist #vedere la lista
listafinale <- lapply(rlist, raster)
listafinale
    
EN <- stack(listafinale)

cl <- colorRampPalette(c('red','orange','yellow'))(100) #
 cl <- colorRampPalette(c('red','orange','yellow'))(100) # 
plot(EN, col=cl)

#12 05 2020
library(raster) #importa file a l interno di...
setwd("C:/lab/") 
setwd("C:/lab/esa_NO2")
rlist <- list.files(pattern=".png")
listafinale <- lapply(rlist, raster) #applicare LA FUNZIONE raster alla lista finale
listafinale
    
EN <- stack(listafinale) # STACK E una serie di bande insieme a l interno di un immagine. EN e il pachetto

difEN <- EN$EN_0013 - EN$EN_0001
cld <- colorRampPalette(c('blue','white','red'))(100) # 
plot(difEN, col=cld)
plot(EN, col=cl)
 boxplot(EN)#per avere diagramma
 
 boxplot(EN, horizontal=T)
 boxplot(EN, horizontal=T,outline=F)
 
 boxplot(EN, horizontal=T,outline=F,axes=T)
       
 


 














