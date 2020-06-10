#R  code exams
### 1 R CODE PRIMO.r
#primo codice in R
install.packages("sp")# facciamo dialogare R con l'esterno , il pachetto sp svillupa funzione  per dati spaziali JK
# require(sp)è un altro comando per far partire le librerie JK
library(sp) #relazionati a dati spaziali  .()  si usa perche R richiede spiegazioni dell'argomento JK
data(meuse) #data è il datum, meuse è il dataset a l'intrno del paccheto sp
data(meuse)
meuse
head(meuse)# head per vedere la tabelle di meuse.head permette di vedere un set, le 6 prime righe JK
names(meuse)# names permette di vedere  i nomi delle variabili a l'interno del set JK
summary(meuse)# fornisce la possibilità di fare un sommario del dataset JK
pairs(meuse) # la funzione pairs mostra un grafico con tutte le variabili sulla diagonale del grafico e vari plot che che vediamo sono le correlazione in modogafico tra le varie variabili JK
#la funzione pairs con cadmio rame  e piombo JK
pairs(~ cadmium + copper + lead , data = meuse)

# Exercise: ripetere la funzione pairs appena fatta aggiungendo oltre a tutti gli altri elementi il zinco 
pairs(~ cadmium + copper +lead +zinc , data = meuse)
#metodo per fare il subset di un database in R si chiama dataframe veloce selezionando alcuni variabili,la funzione pairs è stata riscritta mettiamo il data set meuse e quali colonne ci interessa JK
#con a funzione names il cadmio il rame e il piombo  e lo zinco erano alla terza quarta e quinta e sesta variabili quindi si fa un meuse da 3 a 6 JK
pairs(meuse[,3:6]) #si mettono le funzioni dentro la parentesi tonda JK
# cambiamento coloridei punti JK
pairs(meuse[,3:6], col="red")# a funzione col si usa per colore. red si mette tra "" perche è un etichetta JK
#cambiare il charattere dei punti a l'interno del grafico JK
pairs(meuse[,3:6], col="red", pch=19)#[] indica il subset, pch è il point character JK
#per cambiare  il carattere , chiudere,aprire. JK
#su google si scrive pch e nelle immagini ci sono serie di carattere dove si può scegliere il codice che vogliamo usare in questo caso per chiudere il cerchio si è usato il 19 JK
pairs(meuse[,3:6], col="red", pch=19, cex=3)
#per aumentare la dimensione o ridurre  i point caracter  si usa  caracter exageration cex JK
#se cex=1 rimane uguale, se cex=2 2 volte più grande,se cex=0,1 riduzione di metà JK
#mettiamo un titolo con la funzione main il titolo si chiama primo pairs JK
pairs(meuse[,3:6], col="red", pch=19, cex=3, main="Primo pairs")

# Exercise: do the same for the relationship between elevation and the elements
#ripetere il pairs precedente aggiungendo anche l'elevazione
pairs(meuse[,3:7], col="red", pch=19, cex=3, main="Primo pairs",elev)

#con comando source andiamo a prendere un patch di coordinate a l'esterno
# panels from outside
#il nome panel.correlation si usa  in R,serve per qualsiasi variabile x,y JK
# panel.correlations <- function(x, y, digits=1, prefix="", cex.cor)
# {
#     usr <- par("usr"); on.exit(par(usr))
#     par(usr = c(0, 1, 0, 1))
#     r1=cor(x,y,use="pairwise.complete.obs")
#     r <- abs(cor(x, y,use="pairwise.complete.obs"))
# 
#     txt <- format(c(r1, 0.123456789), digits=digits)[1]
#     txt <- paste(prefix, txt, sep="")
#     if(missing(cex.cor)) cex <- 0.9/strwidth(txt)
#     text(0.5, 0.5, txt, cex = cex * r)
# }
# panel smoothing è un plot di punti con un certo pch e con lois un smoother 
# panel.smoothing <- function (x, y, col = par("col"), bg = NA, pch = par("pch"),
#     cex = 1, col.smooth = "red", span = 2/3, iter = 3, ...)
# {
#     points(x, y, pch = pch, col = col, bg = bg, cex = cex)
#     ok <- is.finite(x) & is.finite(y)
#     if (any(ok))
#         lines(stats::lowess(x[ok], y[ok], f = span, iter = iter),
#             col = 1, ...)
# }
#la funzione
# panel.histograms <- function(x, ...)
# {
#   usr <- par("usr"); on.exit(par(usr))
#   par(usr = c(usr[1:2], 0, 1.5) )
#   h <- hist(x, plot = FALSE)
#    breaks <- h$breaks; nB <- length(breaks)
#    y <- h$counts; y <- y/max(y)
#    rect(breaks[-nB], 0, breaks[-1], y, col="white", ...)
# }

# pairs(meuse[,3:6], lower.panel = panel.correlations, upper.panel = panel.smoothing, diag.panel = panel.histograms)

# EXERCISE: mettere come lower panel lo smoothing, come diagonal panel gli istogrammi e come upper panel le correlazioni 

# pairs(meuse[,3:6], lower.panel = panel.smoothing, upper.panel = panel.correlations, diag.panel = panel.histograms)


### funzione plot

plot(meuse$cadmium,meuse$copper)

attach(meuse)

plot(cadmium,copper) 
#per cambiare il tipo di cattere si usa pch=17 pe triangolini  JK
plot(cadmium, copper, pch=17, col="green", main="primo plot")
#cambiare labels del grafico prima erano cadmium e copper,l'argomento per cambiare la funzione è xlab e ylab JK
plot(cadmium, copper, pch=17, col="green", main="primo plot", xlab="cadmio", ylab="rame") 
#cambiare la grandezza delle etichette possiamo usare cex.lab ,dimensione dei labels a l'interno del grafico cex= JK
plot(cadmium, copper, pch=17, col="green", main="primo plot", xlab="cadmio", ylab="rame", cex.lab=2, cex=2) 



# 2 R CODE SPATIAL
#R spatial funzioni spaziali in ecologia del paesaggio
install.packages("sp")
library sp
head(meuse)
data(meuse)
#plot cadmium e lead
#alleghiamo il data frame    JK
attach(meuse)
plot(cadmium,lead,col="red",pch=19,cex=2)
#exercise plot di copper  e zinco con simbolo triangolo  codice 17 e colore verde
plot(copper,zinc,col="green",pch=17,cex=2)
#cambiare le etichette  JK
plot(copper,zinc,col="green",pch=17,cex=2,xlab="rame",ylab="zinco")
# multiframe o multipanel  JK
par(mfrow=c( 1,2))
plot(cadmium,lead,col="red",pch=19,cex=2)
plot(copper,zinc,col="green",pch=17,cex=2)
#invertiamo grafici rigga/colonna colonna rigga
#davvanti a serie di numeri e caratteri si usa la c in R(numero di righe,numero di colonne)JK
#è stato creato un multipanel con la funzione  par,fatto da une righa e 2 colonne ,in queste 2 colonne abbiamo inserito un plot del cadmio e piombo e nela seconda righa un plot di rame e sinco JK
par(mfrow=c( 2,1))
plot(cadmium,lead,col="red",pch=19,cex=2)
plot(copper,zinc,col="green",pch=17,cex=2)

#multigrame automatico   
install.packages("GGally") #estensione di ggplot2
library(GGaly) #
ggpairs(meuse[3:6])
#spatial
head(meuse)#il dataset è meuse
#se spieghiamo al software che abbiamo bisogno di utilizzare le coordinate JK
#in R dataset si chiama dataframe
#con coordinates si piegha al software dove sono le coordinate x e y per fare questa operazione a l'interno del dataset meuse ci ricordiamo che c'è una colonna con xy JK
coordinates (meuse)=~x+y # la tilde si usa per raggruppare un gruppo di colonne JK
#funzione per plotare dati spaziali
plot(meuse)
#funzione spplot per plottare i dati spazialmente 
spplot(meuse,"zinc") #èuna funzione dentro la libreria sp, e serve a plottare i dati JK

3 R CODE SPATIAL 2.r
#####Rspatial

install.packages ("sp")
## si richiama libreria sp se stato istallato prima
library (sp)
#dati da usare
data(meuse)
head(meuse)
#cordinate del data set
coordinates(meuse)=~x+y
#spplot dei dati di zinco
spplot(meuse,"zinc")
#  exercice spplot dei dati di rame
head(meuse) # con head si da un occhiata al dataseted è la prima parte del database cioè le 6 prime righe JK
#un altra possibilita per vedere i nomi delle colonne  JK 
names(meuse) #funzione names permette di vedere i nomi JK
spplot(meuse,"copper")

#bubble è una funzione del pacchetto sp,è come spplotcioè un modo per plottare i dati e permette di avere grafici più carini JK
bubble(meuse,"zinc")# meuse il dataset di sp e zinco la variabile ed è dichiarato con le ""
#exercise bubble del rame colorato rosso
bubble(meuse,"copper",col="red")#red è una stringa di testo per questo è tra ""

#amettiamo che Sofia a da campionare i foraminiferi a terra in varie zone (6) e amettiamo che un certo plot abbiamo  misurato la quantità di foraminiferida 0 a 100
#quindi nel primo sarà 10 foraminiferi,nel secondo 20,nel terzo 35,nel quarto 50.nel quinto 67,nel sesto 80 in R.JK
#foraminiferi(sofia) carbon capture(marco) , sono i nostri dataset JK 
#si scrive array
#si crea in R un oggetto
foram <- c(10, 20, 35, 55, 67, 80) #c davvanti a serie di numeri JK
carbon <- c(5, 15, 30, 70, 85, 99) # <- verso foraminiferi permette di nominarelo JK
#il plot ci permette di cambiare colore e quindi usiamo la funzione col JK
plot(foram,carbon,col="green",cex=2,pch=19)#col per colore,la dimensione è cex e pch point caracter JK
#l'esercizio serve per creare  2 oggetti la colonna foram e carbon per plottarle insieme,poi si crea un oggetto basandosi sulla tabella su didattia online JK
#dati dall esterno sul covid 19   
#spieghiamo al software qual'è la cartella che utilizzeremo da cui in avanti a l'interno del computer JK
#cartella da creare su windows ("c:/lab")  
#indicare al software quale cartella dobbiamo usare.per usare o settare la cartella giusta useremo il comando set  e la cartella del lavoro è working directory
setwd("C:/lab")#usiamo la stringa di testo per spiegare al software quale percorso useremo per fare questo mettiamole ""
covid <- read.table("covid_agg.csv",head=TRUE)
#leggere la tabella    
head(covid)# lo abbiamo fatto direttamente su R JK
covid
covid <- read.table("covid_agg.csv",head=TRUE) #read,table per leggere la le tabelle,covid_agg.csv è il file
#si crea una cartella chiamata Lab dove mettiamo tutto quello che carichiamo nel mputer e con quale lavoreremo nel corso JK
#spieghiamo in R che abbiamo un header e mettiamo head. TRUE si scrive sempre in maiuscolo JK
#si associano funzioni a un nome a la nostra tabella ,per fare questo andiamo a l'inizio del nostro codice JK
#covid_agg.csv è tra "" perche si va a l'estero del software



4 R CODE POINT PATTERN
#CODICE PER ANALISI  DEI POINT PATTERNS
install.packages("ggplot2")# comando alternativo require(ggplot2),mpg è uno dei dataset del pacchetto ggplot 2 JK
install.packages("spatstat")
library("ggplot2")
library("spatstat")
setwd("C:/lab") #
#importare i dati  
covid <- read.table("covid_agg.csv",head=TRUE)
head(covid)
covid
plot(covid$country,covid$cases)
plot(covid$country,covid$cases,las=0)#parallele.$ o attach covid permette di collegare un pezzo a un altro JK
plot(covid$country,covid$cases,las=1) # horizontal labels.las mette in verticale  JK
plot(covid$country,covid$cases,las=3)#perpandiculars labels  JK
plot(covid$country,covid$cases,las=3,cex.lab=0.5,cex.axis=0.5) # vertical labels.cex.lab o cex.axis permette di ingrandire diminuire le dimensione del graph  JK
#ggplot2
data(mpg)
head(mpg)

install(ggplot)
library(ggplot)
#data
#aes, aestetiscs sono variabili ,servono per visualizzare JK
#per il tipo di geometria che vogliamo usare  si usa geom.()+
ggplot(mpg,aes(x=displ,y=hwy)) + geom_point() #per i punti, hwy sono variabili numeriche presi a caso JK
ggplot(mpg,aes(x=displ,y=hwy)) + geom_line() #per le linee  JK
ggplot(mpg,aes(x=displ,y=hwy)) + geom_polygon() #per poligoni JK
#per cambiare il tipo di geometria
#esempio applichiamo il ggplot per visualizzare questa distribuzione spaziale  del covid,il dataset è covid
#ggplot per visualizzare la distribuzione spaziale del covid,names permette di vedere dati di covid
#per cambiare versione di cases  la lattitudine y e la longitudine x di punti lo andiamo a cambiare in funzione  del numero di casi JK
#inseriamo la variazione della grandezza dei punti in funzione di numero di casi che c'è per ogni punto che corrisponde a un paese JK
#come geometria geom.point e si mette dentro R
ggplot(covid,aes(x=lon,y=lat,size=cases)) + geom_point()#grandezza dei punti o paesi  si indica con size ,cases sono le colonne JK
#esercizio sul point pattern analisi
#misura della densità del covid nel mondo
#create dataset for spatstat
install(spatstat)# si usa per fare meglio una mappa di densità
library(spatstat) #per richiamare spatstat
#spieghiamo al software che vogliamo usare un point pattern a l'interno di spatsat e usiamo la funzione ppp JK
#bisogna inserire le coordinate x,y e il rangedentro al dataset -180 a +180 long e -90 a 90 latt
covidsppp<-(lon,lat,c(-180,180),c(-90,90))# c serve....
 #prima di lanciare la funzione facciamo attach
attach(covid) # covid è il dataset originali JK
library(spatstat)
d<- density(covids)
plot(d) # d la densità
points(covids)#covids è il nuovo dataset che useremo per la parte spaziale della densità JK

> ppp(x.coordinates,y.coordinates,x.range,y.range) #ppp è una funzione,è il dataset for spatstat. JK
#plot della densità
plot(d)
#per inserire  anche i punti sopra al plot precedente senza cancellarlo rifacendo un altro plot possiamo scrivere un altro funzione  che si chiama points JK
#plottare i punti 
points(covids,pch=19,cex=0.5) #pch point character
#aggiungere i nomi dei vari paesi,sono sopra la mappa di densità
#SAVE the Rdata
setwd("C:/lab")
load("point_pattern.RData") # inserire l'RData nominato ieri JK
ls() #list
library(spatstat)
plot(d)

#palette per chiamare i colori cl JK
cl <- colorRampPalette(c('yellow','orange','red'))(100) # 100 quanto livelli di colore vogliamo,100 gradazione di colore  JK
plot(d,col=cl) # CL l ogetto

# Exercise: plot the density of the point pattern with a differEnt color palette.plot della mappa della densità dal verde a blu
cl <- colorRampPalette(c('green','blue'))
plot(d,col=cl)#per plottare sul grafico JK
points(covids)
# inserire le coastlines sui dati iol nella cartella lab paesi della costa JK
coastlines <- readOGR("ne_10m_coastline.shp") #read quello dentro la cartella labinstall.packages("rgdal")
install.packages("rgdal")
library(rgdal) #per leggere file vettoriale JK

coastlines <- readOGR("ne_10m_coastline.shp")
plot(coastlines, add=T)
plot(coastlines, col="yellow", add=T) #add aggiungere le coastlines  JK
plot(coastlines, col="blue", add=T)
#excercise plot della mappa di densita con una nuova colorazione  e aggiunta delle coastlines
cl <- colorRampPalette(c('red','orange','yellow','green', 'blue'))(100)
plot(coastlines, col="yellow", add=T)

#EXERCISE CARicare il worksace point patten Rdata (load(",.,") e creare un garfico della mappa di densità
library(spatstat)
library(rgdal) # for the coastlines

setwd("C:/lab")
load("point_pattern.RData") #per aggiungere punti si usa points pattern  JK
ls()

cl5 <- colorRampPalette(c('cyan', 'purple', 'red')) (200) # color rampe palette stabilisce la legenda
plot(d, col=cl5, main="density")
points(covids)
coastlines <- readOGR("ne_10m_coastline.shp")
plot(coastlines, add=T)


#interpolazione
head(covid) #per vedere la tabella di covid  JK
view(covid) #per vedere tutti i paesi  JK
marks(covids) <- covid$cases  # marks per pescare i valori dentro alla colonna che ci interessa  JK
library(spatstat) #a l interno ci sono valori che vogliamo interpolare
marks(covids) <- covid$cases
s <- Smooth(covids) #significa mappa continua dei covid punti sulla base dei casi di covid JK
plot(s) #smooth è s e significa mappa continua dei covid punti sulla base dei casi JK
#exercice plot(S) with points and coastlines
cl5 <- colorRampPalette(c('cyan', 'purple', 'red')) (200) 
plot(s, col=cl5, main="density")
points(covids)
coastlines <- readOGR("ne_10m_coastline.shp")
plot(coastlines, add=T)

text(covids)
#chiudiamo l esercizio con la mappa finale JK

par(mfrow=c(2,1))

# densità JK
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

#dT=DENSITY MAP,Tesi =dataset originale,Tesi_ppp=POINT PATTERN JK
  plot(dT)
points(Tesippp, col="green")
    
head(Tesi)

marks(Tesippp) <- Tesi$Species_richness # marks e il valore incolato al point pattern associato a una colonna dove catturare i valori  JK
#interpolazione
interpol <- Smooth(Tesippp)
plot(interpol)
points(Tesippp, col="green")
library(rgdal)#  RGDAL PER APRIRE QUALSIASI FILE VECTORIALE JK
sanmarino <-  readOGR("San_Marino.shp")
# plot POLIGONO JK
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


5 R  CODE TELERIL.r
#codice R per analisi immagini satellitari
#packages raster
install.packages("raster")
library (raster)
# setwd("C:/lab/")
p224r63 <- brick("p224r63_2011_masked.grd")
p224r63_2011 <- brick("p224r63_2011_masked.grd") o plot( p224r63) per plottare l imagine sul grafico  JK

pairs(p224r63_2011m) # time consuming

    load("teleril")
    ls()
p224r63_2011 <- p224r63
library (raster)

# plotRGB
# B1: blue
# B2: green
# B3: red
# B4: near infrared (nir)
# B5: medium infrared
# B6: thermal infrared
# B7: medium infrared
cl <- colorRampPalette(c('black','grey','light grey'))(100) #
 p224r63_2011 <- p224r63
> l <- colorRampPalette(c('black','grey','light grey'))(100) # 
> plot(p224r63_2011,col=cl)
#esempio grey scale low amount of colours  
cllow <- colorRampPalette(c('black','grey','light grey'))(5) # 
> plot(p224r63_2011, col=cllow)
#names(p224r63_2011) {1}"B1_sre"B2_sre""B3_sre"B4_sre"B5_sre"B6_bt""B7_sre"
clb <- colorRampPalette(c('dark blue','blue','light blue'))(100) #
plot(
 #attach(dataframe)
 plot(p224r63_2011$B1_sre)
  plot(p224r63_2011$B1_sre, col=clb)
  #attach(dataframe)non funziona con il pachetto raster 
  #simbolo che lega la colonna(la banda al dataset(immagine satellitare: $)  
  
  #esercizio plottare la banda del l infrarosso vicino con 
  #colorrampalette che varia dal rosso all arancione al giallo #
  clnir <- colorRampPalette(c('red','orange','yellow'))(100) #
plot(p224r63_2011$B4_sre, col=clnir)
  #  multiframe di 4 bando 4 bands
  # blue
clb <- colorRampPalette(c('dark blue','blue','light blue'))(100) # 
plot(p224r63_2011$B1_sre, col=clb)
  par(mfrow=c(2,2))
  # green
clg <- colorRampPalette(c('dark green','green','light green'))(100) # 
plot(p224r63_2011$B2_sre, col=clg)
 # red
  clr <- colorRampPalette(c('dark red','red','light red'))(100) # 
plot(p224r63_2011$B3_sre, col=clr)
 # nir  
  clnir <- colorRampPalette(c('red','orange','yellow'))(100) #
plot(p224r63_2011$B4_sre, col=clnir) 
#per chiudere i  GRAFICI . dev.off() jk

#natural colors
#3 componenti  R red G green B blue 3 bande
# plotRGB e la funfione che permette di capire cosa sono RGB jk
# B1: blue
# B2: green
# B3: red
# B4: near infrared (nir)
# plotRGB(p224r63_2011,r=3,g=2,b=1) vedere i colori come a occhio nudo sul immagine satellitare  jk
#strectch=Lin  funzione per tirare JK
    
plotRGB(p224r63_2011, r=3, g=2, b=1)
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
#nir 
# false colour jk
 plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
  
plotRGB(p224r63_2011,r=3,g=2,b=1,scale=1000,stretch="Lin")
plotRGB(p224r63_2011,r=4,g=3,b=2,scale=1000,stretch="Lin")
#salvataggio
 pdf("primografico.pdf)#png("primografico".png")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
dev.off()
  
#multiframe
par(mfrow=c(1,2))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
#nir nella componente  R red
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")  #Lin per lineare jk
#excercise nir nella componente green si vede la parte della vegetazione.la parte nuda del suola viola.G green
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
#nir nella componente blue le piante saranno blu e solo nudo giallo JK
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")
#--------------- 1988 comando per la prossima volta
  # dopo pasqua 
library (raster) 
setwd("C:/lab/")    
load("teleril")  
ls()#list jk
p224r63_1988 <- brick("p224r63_1988_masked.grd")  #p per patch,  e funzione BRICK per importare dentro R JK
p224r63_1988 <- brick("p224r63_1988_masked.grd")  #brick per importare le immagini satellitari tutti insieme
plot(p224r63_1988)
# multiframe
par(mfrow=c(2,2))

# blue
clb <- colorRampPalette(c('dark blue','blue','light blue'))(100) # 
plot(p224r63_1988$B1_sre, col=clb)

# green
clg <- colorRampPalette(c('dark green','green','light green'))(100) # 
plot(p224r63_1988$B2_sre, col=clg)

# red
clr <- colorRampPalette(c('dark red','red','pink'))(100) # 
plot(p224r63_1988$B3_sre, col=clr)

# nir
clnir <- colorRampPalette(c('red','orange','yellow'))(100) # 
plot(p224r63_1988$B4_sre, col=clnir)
  dev.off()  
 # B1: blue - 1
# B2: green - 2
# B3: red - 3
# B4: near infrared (nir) - 4  
plotRGB(p224r63_1988, r=3, g=2, b=1, stretch="Lin") 
#exercice plot the imagee using the nir on the "r"component in the RGB space
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
 
#plot delle 2 immagine 1988 e 2011 facciamo un multi panel per questo usiamo par  JK
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin") 
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")

#agiungere un titolo al grafico si usa name  JK  
par(mfrow=c(2,1))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin", main="1988")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin", main="2011") 
#chiudere il multiframe par  JK  
dev.off() 
#spectral indices 
# dvi1988 = nir1988-red1988
# per collegare data set a l immagine ,<- per ridurre un ogetto a un altro cosi senza parantesi dopo, sre è il sensore JK
dvi1988 <- p224r63_2011$B4_sre-p224r63_2011$B3_sre
plot(dvi1988)
#exercicce calculate dvi for 2011
dvi2011 <- p224r63_2011$B4_sre-p224r63_2011$B3_sre #sre significa  difference vegetationion index JK
plot(dvi2011)
#esempio palette di  colore del dvi
cldvi <- colorRampPalette(c('light blue','light green','green'))(100) # 
plot(dvi2011, col=cldvi)
# multitemporal analysis
#analisi multitemporale   per mostrare vegetazioni che hanno subito più o meno stress  JK 
difdvi <- dvi2011 - dvi1988
plot(difdvi)    
cldifdvi <- colorRampPalette(c('red','white','blue'))(100) # col è color rampe palette JK
plot(difdvi, col=cldifdvi) 
#visualize the output
#multiframe 1998rgb,2011 rgb,difdiv
par(mfrow=c(3,1))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plot(difdvi, col=cldifdvi)  
dev.off()   
#modificare la grana o resoluzione con aggregate JK
p224r63_2011lr <- aggregate(p224r63_2011, fact=10) #lr significa low resolution, fact o fattore è l argomento o il pixel JK
p224r63_2011
p224r63_2011lr
par(mfrow=c(2,1))
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011lr, r=4, g=3, b=2, stretch="Lin")
#lower resolution
p224r63_2011lr50 <- aggregate(p224r63_2011, fact=50) 
p224r63_2011lr50    
#original 30m risampled  a 1500m JK
par(mfrow=c(3,1))
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011lr, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011lr50, r=4, g=3, b=2, stretch="Lin")    
    
dvi2011lr50 <- p224r63_2011lr50$B4_sre - p224r63_2011lr50$B3_sre 
 dev.off()
 # immagine 1988 con bassa resoluzione JK
plot(dvi2011lr50) 
 p224r63_1988lr50 <- aggregate(p224r63_1988, fact=50)  
dvi1988lr50 <- p224r63_1988lr50$B4_sre - p224r63_1988lr50$B3_sre 
 #differenza dei 2 indici di vegetazione   DI 2011 ler del 1988 lr 50
 difdvilr50 <- dvi2011lr50 - dvi1988lr50
 #multiframe con 2 dati finali per avere la grana giusta con quella a alta e bassa risoluzione JK
 par(mfrow=c(2,1))
plot(difdvi, col=cldifdvi)
plot(difdvilr50, col=cldifdvi)



6 R CODE LANDCOVER
setwd("C:/lab/") 
#pacchetto Rstoolbox istallato prima .C si usa per istallare 2 pachetti diversi ma nello stesso tempo JK
#pachetto raster richiamato perche già istallato JK
library(raster)
library(RStoolbox)
p224r63_2011 <- brick("p224r63_2011_masked.grd")
#LANDSat bands 1b,2g,3r,4nir

#RGB
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
#classificazione con unsuperclass
p224r63_2011c <- unsuperClass(p224r63_2011, nClasses=4)
plot(p224r63_2011c$map)
#stabilire la legenda con color rampe palette
clclass <- colorRampPalette(c('red', 'green', 'blue', 'black'))(100) 
plot(p224r63_2011c$map, col=clclass)
#in funzione del numero di classi aumenta l incertezza del algoritmo  automatico 
#riportando classi legermente differente
p224r63_2011c <- unsuperClass(p224r63_2011, nClasses=4)
plot(p224r63_2011c$map)
 ## $map
## class : RasterLayer
## dimensions : 1499, 2967, 4447533 (nrow, ncol, ncell)
## resolution : 30, 30 (x, y)
## extent : 579765, 668775, -522705, -477735 (xmin, xmax, ymin, ymax)
## crs : +proj=utm +zone=22 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0
## source : /tmp/RtmpLk7kFO/raster/r_tmp_2020-04-21_120509_19330_40285.grd
## names : layer
## values : 1, 4 (min, max)



7 R CODE MULTITEMP.r
#Rcode analisi multitemporale di variazione della landcover
setwd("C:/lab/")
library(raster)
defor1 <- brick("defor1_.jpg")
defor2 <- brick("defor2_.jpg")
#defor 1
#names defor1_.1,defor1_.2,defor1_.3
 library(RStoolbox)
#defor1_.1=NIR
#defor1_.2=RED
defor1_.3=GREEN
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")

#exercise della seconda data
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")
par(mfrow=c(2,2))plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")# PAR SERVE PER IL PLOT DI 2 OGGETTI INSIEME
#CLassificazione non supervisionata di defor 1 e 2
library(RStoolbox) #prima chiamare r stoolbox e poi usare la funzione unsuperclass  JK
defor1_c <- unsuperClass(defor1, nClasses=2)
d1c <- unsperClass(defor1, nClasses=2)
plot(defor1_c$map)
cl <- colorRampPalette(c('darkblue','blue','light blue'))(100)#ci facciamo un color rampe palette Per visualizzare JK
plot(defor1_c$map, col=cl)
#ho ottenuto colori diversi dal prof quindi questa è la possibilita 2  JK
cl <- colorRampPalette(c('green','black'))(100)
plot(defor1_c$map, col=cl)
#classificazione defor2
#exercise classificazione con classi l immagine satellitare di defor2
defor2_c <- unsuperClass(defor2, nClasses=2)
plot(defor2_c$map)
#mappe ottenute
par(mfrow=c(2,1))
plot(defor1_c$map, col=cl)
plot(defor2_c$map, col=cl)

#la frequenza JK
freq(defor1_c$map)
#aree aperte 36827
#foreste  304465
totd1 <- 36827 +304465 
totd1 341292
#le proporzione

#percentuale delle nostre frequenze JK
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

library(ggplot2)#per plottare le mappe raster  JK

# O5 MAGGIO
library(raster)
setwd("C:/lab/")
load("defor.RData")
ls()
par(mfrow=c(1,2))
cl <- colorRampPalette(c('black','green'))(100) # 
plot(d1c$map, col=cl)
plot(d2c$map, col=cl)
#percentuale di foresta attuale e quella prcedente
library(ggplot2)
ggplot(output, aes(x=cover, y=before, color=cover)) + #cover e la copertura ,geom barre sono le barre a creare, fill è la colorazione a l interno delle barre sara bianca  JK
geom_bar(stat="identity", fill="white") # identity significa.......
dev.off()

#exercise plot histograms of landcover after deforestation
ggplot(output, aes(x=cover, y=after, color=cover)) +
geom_bar(stat="identity", fill="white")
install.packages("gridExtra")
library(gridExtra)
#grid.arrange(p1, p2, nrow = 1) # this needs griExtra  JK
#histograms of % di deforestazione

grafico1 <- ggplot(output, aes(x=cover, y=before, color=cover)) + 
geom_bar(stat="identity", fill="white")

grafico2 <- ggplot(output, aes(x=cover, y=after, color=cover)) + 
geom_bar(stat="identity", fill="white")
#exercise use grid arrange to plot 2 graphs
library(gridExtra)
grid.arrange(grafico1, grafico2, nrow = 1)

#06 mmaggio
library(ggplot2)
    
cover <- c("Agriculture","Forest")
before <- c(10.9,89.1)
after <- c(48.2,51.8)

output <- data.frame(cover,before,after)
output
library(gridExtra) # oppure: require(Extra) JK
grafico1 <- ggplot(output, aes(x=cover, y=before, color=cover)) +
geom_bar(stat="identity", fill="white")
grafico2 <- ggplot(output, aes(x=cover, y=after, color=cover)) +
geom_bar(stat="identity", fill="white")
grid.arrange(grafico1, grafico2, nrow = 1)
grafico1 <- ggplot(output, aes(x=cover, y=before, color=cover)) + 
geom_bar(stat="identity", fill="white") +
ylim(0, 100)

grafico2 <- ggplot(output, aes(x=cover, y=after, color=cover)) + 
geom_bar(stat="identity", fill="white") +
ylim(0, 100)
grid.arrange(grafico1, grafico2, nrow = 1)
# esempio sul significato del $
# mappageologica <- geomap(im_sat,nClasses=....)
# plot(mappageologica$lito)
# plot(mappageologica$lineaments)


8 RCODE MULTITEMP NO2
#R code for analysing NO2 data from USA
library(raster)
setwd("C:/lab/")
EN01 <- raster("EN_0001.png")
plot(EN01)
# EXERCISE importare tutte le immagine
 # EN <- stack(c("EN_0001.png","EN_0002.png","EN_0003.png","EN_0004.png","EN_0005.png","EN_0006.png","EN_0007.png","EN_0008.png","EN_0009.png","EN_0010.png","EN_0011.png","EN_0012.png","EN_0013.png")) importare le immagini tutte insieme  l'una su l' altra con a funzione stack  JK
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
# brick
# EN01 <- brick("EN_0001.png")
# EN02 <- brick("EN_0002.png")
# EN03 <- brick("EN_0003.png")
# EN04 <- brick("EN_0004.png")
# EN05 <- brick("EN_0005.png")
# EN06 <- brick("EN_0006.png")
# EN07 <- brick("EN_0007.png")
# EN08 <- brick("EN_0008.png")
# EN09 <- brick("EN_0009.png")
# EN10 <- brick("EN_0010.png")
# EN11 <- brick("EN_0011.png")
# EN12 <- brick("EN_0012.png")
# EN13 <- brick("EN_0013.png")

# brick
# writeRaster(EN01[[3]], "snow2000r.tif")
 
#per cambiare colori
 cl <- colorRampPalette(c('red','orange','yellow'))(100) #
    
cl <- colorRampPalette(c('red','orange','yellow'))(100) # 
plot(EN01, col=cl)
plot(EN13, col=cl)
#per vederle inseme
par(mfrow=c(1,2))
plot(EN01, col=cl)
plot(EN13, col=cl)
# PER VEDERE DIFFERENZE  JK
dev.off()
 # close the window
difno2 <- EN13 - EN01
cldif <- colorRampPalette(c('blue','black','yellow'))(100) #
plot(difno2, col=cldif)
par(mfrow=c(4,4))
 # PLOT ALL THE DATA
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
# put all files into the folder  JK

rlist=list.files(pattern=".png", full.names=T)

#save raster into list
#con lappy

list_rast=lapply(rlist, raster)

#con ciclo for JK
list_rast=list()
for(i in 1:length(rlist)){
  r=raster(rlist[[i]])
  list_rast[[i]]=r} 
#6 maggio
setwd("C:/lab/")
load("EN.RData")
setwd("C:/lab/esa_NO2")
rlist <- list.files(pattern=".png")# list file e la lista dei file a l interno della cartella  JK
rlist #vedere la lista
listafinale <- lapply(rlist, raster)
listafinale
    
EN <- stack(listafinale)

cl <- colorRampPalette(c('red','orange','yellow'))(100) #
 cl <- colorRampPalette(c('red','orange','yellow'))(100) # 
plot(EN, col=cl)

#12 05 2020
library(raster) #importa file a l interno di... JK
setwd("C:/lab/") 
setwd("C:/lab/esa_NO2")
rlist <- list.files(pattern=".png")
listafinale <- lapply(rlist, raster) #applicare LA FUNZIONE raster alla lista finale JK
listafinale
 # make a stack   
EN <- stack(listafinale) # STACK è una serie di bande insieme a l interno di un immagine. EN è il pachetto JK
EN <- stack(EN01,EN02,EN03,EN04,EN05,EN06,EN07,EN08,EN09,EN10,EN11,EN12,EN13)
 
difEN <- EN$EN_0013 - EN$EN_0001
cld <- colorRampPalette(c('blue','white','red'))(100) # 
plot(difEN, col=cld)
plot(EN, col=cl)
 boxplot(EN)#per avere diagramma   finale e vedere come variano le cose JK
 
 boxplot(EN, horizontal=T)
 boxplot(EN, horizontal=T,outline=F)
 
 boxplot(EN, horizontal=T,outline=F,axes=T)
 
 
 
 9 R CODE SNOW
 setwd("C:/lab/")
install.packages("ncdf4")
library(ncdf4)
library(raster)
snowmay <- raster("c_gls_SCE500_202005180000_CEURO_MODIS_V1.0.1.nc")
cl <- colorRampPalette(c('darkblue','blue','light blue'))(100)
#esercizio plot snow cover with the cl palette
#import snow data,importare tutti i file insIeme
setwd("C:/lab/snow")
# put all files into the folder

rlist=list.files(pattern=".png", full.names=T)
rlist <- list.files(pattern=".tif")
rlist # permette di vedere la lista delle immagini sul documento dentro R JK

list_rast <- lapply(rlist, raster)
#save raster into list
#con lappy
list_rast=lapply(rlist, raster)
snow.multitemp <- stack(list_rast)
plot(snow.multitemp,col=cl)
#plotttare la prima e l ultima immagine  JK
par(mfrow=c(1,2))
plot(snow.multitemp$snow2000r, col=cl)
plot(snow.multitemp$snow2020r, col=cl)
#plottare le 2 con un limite di 250
par(mfrow=c(1,2))
plot(snow.multitemp$snow2000r, col=cl, zlim=c(0,250))
plot(snow.multitemp$snow2020r, col=cl, zlim=c(0,250))
dev.off()
# vedere la differenza tra le 2 mappe con colore diverso dal dif cl JK
difsnow = snow.multitemp$snow2020r - snow.multitemp$snow2000r
difsnow = snow.multitemp$snow2020r - snow.multitemp$snow2000r
cldiff <- colorRampPalette(c('blue','white','red'))(100) 
plot(difsnow, col=cldiff)

## prediction

require(raster)
require(rgdal)
predicted.snow.2025.norm <- 
#since code tak time u can download 
predicted.snow.2025.norm <- raster("predicted.snow.2025.norm.tif")
plot(predicted.snow.2025.norm, col=cl)



10 R CODE PATCHES.r
setwd("C:/lab/")
library(raster) 
# writeRaster(d1c$map,"d1c.tif")
# writeRaster(d2c$map,"d2c.tif")
d1c <- raster("d1c.tif")#caricare la prima mappa,usare la funzione brick per caricare tutte le bande e raster per un solo bando JK
d2c <- raster("d2c.tif") # land cover 1= agriculture, land cover 2=forest
par(mfrow=c(1,2))#con par mettiamo più plot a l interno del grafico finale JK
cl <- colorRampPalette(c('green','black'))(100) #
plot(d1c,col=cl)
plot(d2c,col=cl)
cellStats(d1c.forest.patches, max)#number of patches identified
 
par(mfrow=c(1,2))#la mappa coretta perche la foresta è la classe 2 e quella dell algicultura la classe 1 JK
cl <- colorRampPalette(c('black','green'))(100) #cellStats(d1c.forest.patches, max)#number of patches identified
plot(d1c,col=cl)
plot(d2c,col=cl)
 # Exercise: repeat the whole process for d2c
# land cover 1= agriculture, land cover 2=forest
d2c.cat.for <- reclassify(d2c, cbind(1, NA))

d2c.forest.patches <- clump(d2c.cat.for)
cl <- colorRampPalette(c('dark 
blue','blue','green','orange','yellow','red'))(100) # 
plot(d2c.forest.patches,col=cl)

cellStats(d2c.forest.patches, max)#number of patches identified
#per annullare alcuni valori  si usa Cbind NA attraverso la funzione reclassify JK
d1c.for <- reclassify(d1c, cbind(1,NA))
par(mfrow=c(1,2))
cl <- colorRampPalette(c('black','green'))(100) #
plot(d1c,col=cl)
plot(d1c.for)
par(mfrow=c(1,2))
cl <- colorRampPalette(c('black','green'))(100) #
plot(d1c,col=cl)
plot(d1c.for, col=cl)
d2c.for <- reclassify(d2c, cbind(1,NA))#reclassifcare la classe 1 JK
par(mfrow=c(1,2))
plot(d1c)
plot(d2c)
#creare i patch
install.packages("igraph")
library(igraph) # for pacthes
d1c.for.pacthes <- clump(d1c.for)
d2c.for.pacthes <- clump(d2c.for)
writeRaster(d1c.for.pacthes, "d1c.for.patches.tif")# writE raster  usato per scrivere  i file d1c e d2c nella cartella lab JK
writeRaster(d2c.for.pacthes, "d2c.for.patches.tif")
#plottare le mappe uno accanto a l altro JK
par(mfrow=c(1,2))
plot(d1c.for.pacthes)
plot(d2c.for.pacthes
clp <- colorRampPalette(c('dark blue','blue','green','orange','yellow','red'))(100) # 
par(mfrow=c(1,2))
plot(d1c.for.pacthes, col=clp)
plot(d2c.for.pacthes, col=clp)
#si aggiunge la funzione time per avere before and after deforestation JK
time <- c("Before deforestation","After deforestation")
npatches <- c(301,1212)

# plot results:
time <- c("Before deforestation","After deforestation")
npatches <- c(568,1920)
output <- data.frame(time,npatches)#output per vedere il plot finale JK
attach(output)
library(ggplot2)
ggplot(output, aes(x=time, y=npatches, color="red")) + geom_bar(stat="identity", fill="white")
#l altra avevamo visto la variazione dell aria adesso abbiamo visto la variazione dei patch JK
 

##11 R CODE CROP
setwd("C:/lab/snow/") 
#caricare tutte le immagini snow con raster o apply   
#richiamare library raster
rlist <- list.files(pattern="snow")  #in questo caso non tif
rlist    
#save raster into list
  #con lapply   
list_rast <- lapply(rlist, raster)
# uso della funzione stack     
snow.multitemp <- stack(list_rast) 
 #plottare tutta le immagine snow     
  clb <- colorRampPalette(c('dark blue','blue','light blue'))(100) # per plottare le immagini tutti insieme
plot(snow.multitemp,col=clb)   
 # fare lo zoom di un certa extensione  
  snow.multitemp  
  plot(snow.multitemp$snow2010r, col=clb) 
    
extension <- c(6, 18, 40, 50)
zoom(snow.multitemp$snow2010r, ext=extension)
    
extension <- c(6, 18, 35, 50)
zoom(snow.multitemp$snow2010r, ext=extension)
extension <- c(6, 20, 35, 50)
zoom(snow.multitemp$snow2010r, ext=extension)
#disegnare l'estensione con draw extend()
#lanciare prima lo plot dell'immagine originale poi disegnare un rettangolino su l'estenzione JK
plot(snow.multitemp$snow2010r, col=clb)
 zoom(snow.multitemp$snow2010r, ext=drawExtent())
 zoom(snow.multitemp$snow2010r, ext=drawExtent())
 plot(snow.multitemp$snow2010r, col=clb)
 zoom(snow.multitemp$snow2010r, ext=drawExtent())
 
#fare un crop che taglia l'immagine sulla zona che vogliamo ritagliare
extension <- c(6, 20, 35, 50)
snow2010r.italy <- crop(snow.multitemp$snow2010r, extension)
plot(snow2010r.italy, col=clb)    
 #exercice  crop the italy extend to whole stack back of snow   
 snow.multitemp.italy <- crop(snow.multitemp, extension)
 plot(snow.multitemp.italy, col=clb)
plot(snow.multitemp.italy, col=clb, zlim=c(20,200)) #zlimp serve per limitare la legenda per tutte le immagini JK
     
#boxplot o previsione con la funzione prediction  #permette di prendere i valori delle immagini per vedere come varia la neve esattamente durante gli anni JK
boxplot(snow.multitemp.italy, horizontal=T,outline=F)
     
     

#12 SPECIES Distribution MODELING     
 #non acciamo il setw perche usiamo il paccheto sdm    
install.packages("sdm") 
 library(raster)
library(rgdal)    
 #carichiamo il file a l interno di rgdal 
 system.file("external/species.shp", package="sdm") 
system.file("external/species.shp", package="sdm")
[1] "C:/Users/HP/Documents/R/win     
 species <- shapefile(file)    
plot(species)
#visualizzare le presenze dalle assenze
plot(species[species$Occurrence == 1,],col='blue',pch=16) per punti uguale a 1 colorati in blu poi aggiungiamo plot uguaali a 0 colorato in rosso    
points(species[species$Occurrence == 0,],col='red',pch=16) i punti dove la specie e assente  
 
path <- system.file("external", package="sdm") 

lst <- list.files(path=path,pattern='asc$',full.names = T) #
 preds <- stack(lst)
 
cl <- colorRampPalette(c('yellow','orange','red')) (100)
 cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl)
plot(preds$elevation, col=cl)
 #tutti i punti dove la specie e presente ? quindi sta bene in bassa elevation
points(species[species$Occurrence == 1,], pch=16)
# con la temperatura vegiamo come si comporta ?qui li piaciono temperature medio basse o basse
plot(preds$temperature, col=cl)
points(species[species$Occurrence == 1,], pch=16)
per le precipitazione come si comporta? e intermedia quindi
plot(preds$precipitation, col=cl)
points(species[species$Occurrence == 1,], pch=16)
#indice di vegetazione
plot della nostra vegetazione con nostro punto a l interno
plot(preds$vegetation, col=cl)
points(species[species$Occurrence == 1,], pch=16)
#model
dati <- sdmData(train=species, predictors=preds)
m1 <- sdm(Occurrence ~ elevation + precipitation + temperature + vegetation, data=d, methods='glm')
p1 <- predict(m1, newdata=preds)
plot(p1, col=cl)
points(species[species$Occurrence == 1,], pch=16)
#EXAM PROJECT






 
    
     
     
     
