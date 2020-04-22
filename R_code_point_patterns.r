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
attach(covid)
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
covid <- ppp (lon,lat, c(-180,180), c(-90,90))






