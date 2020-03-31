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
covids<-ppp(lon,lat,c(-180,180),c(-90,90))

library(spatstat)
library(rgdal)

> ppp(x.coordinates,y.coordinates,x.range,y.range)
load("point_pattern.RData") # inerire l'RData nominato ieri

# inserire le coastlines sui dati iol nella cartella lab
coastlines <- readOGR("ne_10m_coastline.shp")

plot(d)
points(covids,pch=19,cex=0.5) #pch point character
plot(coastlines, col="yellow", add=T)

# Exercise: plot the density of the point pattern with a differnt color palette

cl <- colorRampPalette(c('yellow','orange','red'))(100) # 
plot(d,col=cl)
points(covids,pch=19,cex=0.5)
plot(coastlines, col="blue", add=T)





