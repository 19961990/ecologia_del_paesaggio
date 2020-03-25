#####Rspatial

install.packages ("sp")
##libreria sp
library (sp)
#dati da usare
data(meuse)
head(meuse)
#cordinate del data set
coordinates(meuse)=~x+y
#spplot dei dati di zinco
spplot(meuse,"zinc")
#  exercice spplot dei dati di rame
head(meuse)
#un altra possibilita per vedere i nomi delle 
names(meuse)
spplot(meuse,"copper")

#bubble
bubble(meuse,"zinc")
#exercise bubble del rame colorato rosso
bubble(meuse,"copper",col="red")

#foraminiferi(sofia) carbon capture(marco)
#array
foram <- c(10, 20, 35, 55, 67, 80)
carbon <- c(5, 15, 30, 70, 85, 99)
plot(foram,carbon,col="green",cex=2,pch=19)
#dati dall esterno sul covid 19
#cartella da creare su windows c:/lab
setwd("C:/lab")
#leggere la tabella
covid <- read.table("covid_agg.csv",head=TRUE)
