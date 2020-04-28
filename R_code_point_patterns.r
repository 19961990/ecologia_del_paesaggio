#CODICE PER ANALISI  DEI POINT PATTERNS
install.packages("ggplot2")
install.packages("spatstat")
library("ggplot2")#comando alternativo require ggplot per chiamare la funzione
library("spatstat")

setwd("C:/lab")
#importare i dati
covid <- read.table("covid_agg.csv",head=TRUE)
head(covid)
covid
plot(covid$country,covid$cases)
plot(covid$country,covid$cases,las=0)#parallele.$ o attach covid permette di collegare un pezzo a un altro
plot(covid$country,covid$cases,las=1) # horizontal labels.las mette in verticale  
plot(covid$country,covid$cases,las=3)#perpandiculars labels
plot(covid$country,covid$cases,las=3,cex.lab=0.5,cex.axis=0.5) # vertical labels.cex.lab o cex.axis permette di ingrandire diminuire le dimensione del graph
#ggplot2
data(mpg)
head(mpg)

#data
#aes
#tipo di geometria
ggplot(mpg,aes(x=displ,y=hwy)) + geom_point() #per i punti
ggplot(mpg,aes(x=displ,y=hwy)) + geom_line() #per le linee
ggplot(mpg,aes(x=displ,y=hwy)) + geom_polygon() #per poligoni
#ggplot per visualizzre la distribuzione spaziale del covid
ggplot(covid,aes(x=lon,y=lat,size=cases)) + geom_point()#grandezza dei punti o paesi size uguale a colona  chi est cases
#density
#create dataset for spatstat
attach(covid) #dataset originali
covidsppp<-(lon,lat,c(-180,180),c(-90,90))
 
d<- density(covids)
plot(d)
points(covids)

> ppp(x.coordinates,y.coordinates,x.range,y.range)

plot(d)
points(covids,pch=19,cex=0.5) #pch point character

#SAVE the Rdata
setwd("C:/lab")
load("point_pattern.RData") # inerire l'RData nominato ieri
ls()
library(spatstat)
plot(d)

#palette per chiamare i colori cl
cl <- colorRampPalette(c('yellow','orange','red'))(100) # 100 quanto livelli di colore vogliamo,100 gradazione di colore
plot(d,col=cl) # CL l ogetto

# Exercise: plot the density of the point pattern with a differnt color palette.plot della mappa della densita dal verde a blu
cl <- colorRampPalette(c('green','blue'))
plot(d,col=cl)#per plottare sul grafico
points(covids)
# inserire le coastlines sui dati iol nella cartella lab paesi della costa
coastlines <- readOGR("ne_10m_coastline.shp") #read quello dentro la cartella labinstall.packages("rgdal")
install.packages("rgdal")
library(rgdal) #per leggere file vettoriale

coastlines <- readOGR("ne_10m_coastline.shp")
plot(coastlines, add=T)
plot(coastlines, col="yellow", add=T) #add aggiungere le coastlines
plot(coastlines, col="blue", add=T)
#excercise plot della mappa di densita con una nuova colorazione  e aggiunta delle coastlines
cl <- colorRampPalette(c('red','orange','yellow','green', 'blue'))(100)
plot(coastlines, col="yellow", add=T)

#EXERCISE CARicare il worksace point patten Rdata (load(",.,") e creare 
library(spatstat)
library(rgdal) # for the coastlines

setwd("C:/lab")
load("point_pattern.RData") #per aggiungere punti si usa points pattern
ls()

cl5 <- colorRampPalette(c('cyan', 'purple', 'red')) (200) 
plot(d, col=cl5, main="density")
points(covids)
coastlines <- readOGR("ne_10m_coastline.shp")
plot(coastlines, add=T)


#interpolazione
head(covid) #per vedere la tabella di covid
view(covid) #per vedere tutti i paesi
marks(covids) <- covid$cases  # marks per pescare i valori dentro alla colonna che ci interessa
 library(spatstat) #a l interno ci sono valori che vogliamo interpolare
marks(covids) <- covid$cases
s <- Smooth(covids) #significa mappa continua dei covid puni sulla base dei casi di covid 
plot(s)
#exercice plot(S) with points and coastlines
cl5 <- colorRampPalette(c('cyan', 'purple', 'red')) (200) 
plot(s, col=cl5, main="density")
points(covids)
coastlines <- readOGR("ne_10m_coastline.shp")
plot(coastlines, add=T)

text(covids)
#chiudiamo l esercizio con la mappa finale

par(mfrow=c(2,1))

# densità
cl5 <- colorRampPalette(c('cyan', 'purple', 'red')) (200) 
plot(d, col=cl5, main="density")
points(covids)
coastlines <- readOGR("ne_10m_coastline.shp")
plot(coastlines, add=T)


# interpolazione del numero di casi
cl5 <- colorRampPalette(c('cyan', 'purple', 'red')) (200) 
plot(s, col=cl5, main="estimate of cases")
points(covids)
coastlines <- readOGR("ne_10m_coastline.shp")
plot(coastlines, add=T)

###san marino
setwd("C:/lab")
#libbrary spatstat
load("Tesi.RData")    
ls()
head(Tesi)
attach(Tesi)
#SUMMARY TESI
#x varia da 12.42 a 12.46
#y varia da 43.91 a 43.93
#point pattern x,y,c(xmin,xmax),x,y,c(ymin,ymax)
Tesippp <- ppp(Longitude, Latitude, c(12.41,12.47), c(43.9,43.95))
# creare la mappa di densita
dT <- density(Tesippp)
dev.off()
plot(dT)
plot(dT)
points(Tesippp, col="green")
 
######
setwd("C:/lab")
load("sanmarino.RData")
library(spatstat)
ls()

#dT=DENSITY MAP,Tesi =dataset originale,Tesi_ppp=POINT PATTERN
  plot(dT)
points(Tesippp, col="green")
    
head(Tesi)

marks(Tesippp) <- Tesi$Species_richness # marks e il valore incolato al point pattern associato a una colonna dove catturare i valori
#interpolazione
interpol <- Smooth(Tesippp)
plot(interpol)
points(Tesippp, col="green")
library(rgdal)#  RGDAL PER APRIRE QUALSIASI FILE VECTORIALE
sanmarino <-  readOGR("San_Marino.shp")
# plot POLIGONO
plot(sanmarino)
plot(interpol, main="Species richness", add=T)
points(Tesippp,col="green")
plot(sanmarino, add=T)

#EXERCISE PLOT MULTIFRAME DI DENSITA  E INTERPOLAZIONE 
par(mfrow=c(2,1)
plot(dT, main="Density of points")
points(Tesippp,col="green")

plot(interpol, main="Estimate of species richness")
points(Tesippp,col="green")

 #esercizio   
par(mfrow=c(1,2)) 

plot(dT, main="Density of points")
points(Tesippp,col="green")

plot(interpol, main="Estimate of species richness")
points(Tesippp,col="green")    
    
    
    


