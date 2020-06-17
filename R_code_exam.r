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
## si richiama libreria sp è stato istallato prima
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
l'analisi del point pattern permette di stimare i valori che non possiamo misurare
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

#point pattern analisi:trasformare i punti delle mappe continui legati a punti di interpolazione
#EXERCISE caricare il workspace point patten.Rdata  ricorda che la funzione era (load(",.,") e creare un garfico della mappa di densità di punti che già esiste
#istallare il pacchetto spatstat e chiamare la libreria rgdal
library(spatstat)
library(rgdal) # for the coastlines
setwd("C:/lab")
#inserire tutti i dati che abbiamo salvato tra cui c'è d,plottare la densità usado il colorRampe palette.poi si rinomina il nome density in main JK
load("point_pattern.RData") #per aggiungere punti si usa points pattern  JK
ls() #per vedere la lista
#point pattern non aveva ancora salvato le coastlines  quindi qui c'è una bifurcazione 
cl5 <- colorRampPalette(c('cyan', 'purple', 'red')) (200) # color rampe palette stabilisce la legenda
plot(d, col=cl5, main="density")
#aggiunto al precedente plot punti con points con covids come point pattern creato con la funzione ppp
points(covids)
coastlines <- readOGR("ne_10m_coastline.shp")#readOGR serve per leggere questo file dove c'è coastline e per usarlo bisogna avere istallato la libreria rgdal. JK
plot(coastlines, add=T)#   
#andiamo a veder la densità dei paesi che hanno avuto il covid uno accanto a l'altro con l'interpolazione
#interpolazione va stimare i valori nelle zone dove non è stato fatto campione
#spieghiamo al sistema qual'è la variabile che vogliamo interpollare  quindi prima dobbiamo guadare i valori dei casi al'interno della tabella covid JK
head(covid) #per guardare la tabella di covid  per vedere la colonna cases JK
view(covid) o covid #per vedere tutta la tabella creare dei valori di interpollazione  JK
#marks o voto son delle etichette per ogni paese JK
#spieghiamo alla libreria spatstat che andiamo a pescare dei valori dentro cases con la funzione marks JK
#spieghiamo alla libreria che ci sono valori che vogliamo interpollare nel point pattern,lo asociamo a cases a l'interno di covids
marks(covids) <- covid$cases  # marks per pescare i valori dentro alla colonna che ci interessa  JK
library(spatstat) #a l interno ci sono valori che vogliamo interpolare
marks(covids) <- covid$cases #si può usare il $ o attach
#applichiamo la funzione Smooth(con la maiuscula) che mi da la mappa continua dei vari punti di covid
s <- Smooth(covids) # smooth significa mappa continua dei covid punti sulla base dei casi di covid , s è per la stima dei valori attraverso smooth JK
#plottare la mappa dei casi JK
plot(s) #smooth è s e significa mappa continua dei covid punti sulla base dei casi JK

#exercice plot(S) fare un plot(s) cambiando la palette e aggiungendo i punti coastlines il titolo main

#la mappa si chiama interpol e lo associamo con  <- alla funzione smooth sul nostro point pattern e si incolla su R
plot(dT, main="Density of points")
points(Tesippp,col="green")

plot(interpol, main="Estimate of species richness")
points(Tesippp,col="green") 

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
#associamo al nome san marino la funzione read OGR
sanmarino <-  readOGR("San_Marino.shp")
# plot POLIGONO JK
plot(sanmarino)
plot(interpol, main="Species richness", add=2) #così si aggiungono pezzi alla mappa precedente
points(Tesippp,col="green")
#per avere la mappa dei punti,per plottare sopra la mappa precedente
plot(sanmarino, add=2)#è la mappa finale
#per aggiungere coordinate si aggiunge la funzione ggplot

 #esercizio  multiframe della densitàe della e dell'interpolazione 
par(mfrow=c(1,2)) #plottiamo tutte le 2 mappe dello stesso grafico con la funzione par così abbiamo 2 righe ,1 colonna

plot(dT, main="Density of points")
points(Tesippp,col="green")

plot(interpol, main="Estimate of species richness")
points(Tesippp,col="green") 


5 R  CODE TELERIL.r
#si è carica il zip da iol e si mette nella cartella lab    
#codice R per analisi immagini satellitari
#packages raster
install.packages("raster")
library (raster)
setwd("C:/lab/")
#è previsto il codice brick    
p224r63 <- brick("p224r63_2011_masked.grd")#brick serve a importare immagini satellitare completamente in tutte le bande a l'interno di R JK
p224r63_2011 <- brick("p224r63_2011_masked.grd") o plot( p224r63) #per plottare l imagine sul grafico  JK

pairs(p224r63_2011m) # time consuming

 load("teleril")
 ls()
p224r63_2011 <- p224r63
library (raster)# richiamare raster JK
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
plot(p224r63_2011$B1_sre) #sre è il nome
plot(p224r63_2011$B1_sre, col=clb) #$ permette di collegare vari pezzi di oggetto,lo avevamo usato per collegare le clonne a loro dataset o le bande a loro dataset cioè a l'immagine JK
#attach(dataframe)non funziona con il pachetto raster 
#simbolo che lega la colonna(la banda al dataset(immagine satellitare: $) JK 
  
#esercizio: plottare la banda del l infrarosso vicino con 
 
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
#exercise:plot dvi 1988
#assegniamo l'oggetto dvi tramite<- a una funzione quindi è la differenza tra l'immagine nel infrarosso e nel rosso JK 
dvi1988 <- p224r63_1988$B4_sre-p224r63_1988$B3_sre #$ si usa per leggare ogni singola aun dataset in questo caso le bande a l'immagine JK
plot(dvi1988)#plot serve per plottare su R JK
#exercice calculate dvi for 2011
dvi2011 <- p224r63_2011$B4_sre-p224r63_2011$B3_sre #sre significa  difference vegetationion index ,B4 è la banda dell'infrarosso JK
#abbiamo usato appena un immagine che pixel per pixel  è la sostrazione dell' IRvicino e del Rosso se la pianta è sana il valore sarà alto JK
#plot del dvi di 1988 si usa plot che serve per plottaggio di qualsiasi oggetto JK
plot(dvi2011)#dvi legata alla vegetazione
#esempio palette di  colore del dvi
#questa rappresentazione va dal blue al verde
cldvi <- colorRampPalette(c('light blue','light green','green'))(100) # la funzione colorRampe palette si usa per aveere molte colore diverse JK
#plot dvi 2011
dvi2011 <- p224r63_2011$B4_sre-p224r63_2011$B3_sre 
plot(dvi1988)#plot serve per plottare su R
plot(dvi2011, col=cldvi)
# multitemporal analysis
#analisi multitemporale   per mostrare vegetazioni che hanno subito più o meno stress  JK 
#facciamo la differenza di dvi che è dif dvi lo assegniamo con  <-  con la div di 2011 e 1988 JK
difdvi <- dvi2011 - dvi1988 #difdvi è la differenza nell'indice di rilevazione JK
#abbiamo creato la nostra immagine che ci mostra quelle zone dove la vegetazione a sofferto di più JK
#plotiamo la dif dvi JK 
plot(difdvi) #difdiv la differenza di vegetation index JK
#cambiamo la legenda con la colorRampe palette e usiamo il red per valori alti,white per intermedi e blue per vaori bassi
cldifdvi <- colorRampPalette(c('red','white','blue'))(100) # col è la funzione per colore, cl è la colorRampe palette, JK
#con il plot si vede in R si vede la differenza di vegetazione JK
plot(difdvi, col=cldifdvi) 
#visualize the output 
#facciamo un par multiframe 1998rgb,2011 rgb,difdiv  per vedere le 3 immagini insieme.rgb significa red green blue JK
par(mfrow=c(3,1)) # 3.1 si usa per incollare l'immagine di 1998,2011,e la differenza di vegetazione nel tempo JK
#plottiamo la differenza di indice di vegetazione nel tempo, la prima immagine è quella del 1988(redgreen,blue),la seconda 2011 con le componente 4,3,2  JK
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin") #lin
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin") # lin
plot(difdvi, col=cldifdvi)  
dev.off()   
#modificare la grana o resoluzione con  con la funzione aggregate con cui possiamo aggreagare i vari pixel ecreamo un immagine con pixel più grande JK
#cominciamo con l'immagine del 2011
#a l'ogetto attribuamo aggregate che va a creare un immagine con risoluzioe bassa 
p224r63_2011lr <- aggregate(p224r63_2011, fact=10) #lr significa low resolution, fact o fattore ,quanto lo vogliamo cambiare o il pixel. JK
p224r63_2011 #è l'immagine JK
p224r63_2011lr # l'immagine a bassa risoluzione JK
par(mfrow=c(2,1)) #plottiamo 2 immagini qquella di 2011 originale e 2011 a bassa risoluzione
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011lr, r=4, g=3, b=2, stretch="Lin")
#lower resolution.risoluzione della nuova immagine
#per vedere le caratteristiche dell'immagine precedente p224r63_2011 e mettiamo dentro R si vede le sur caratteristiche e la resoluzione JK
p224r63_2011lr50 <- aggregate(p224r63_2011, fact=50) #50 volte il pixel
p224r63_2011lr50 #l'immagine a risoluzione 50   
#original 30m risampled  a 1500m JK
par(mfrow=c(3,1)) #plottiamo 3 immagini 2011,2011lr10 e 2011lr50 JK
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011lr10, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011lr50, r=4, g=3, b=2, stretch="Lin")    
# immagine 2011 con bassa risoluzione JK  
#usiamo un dvi 2011 lr 50 
dvi2011lr50 <- p224r63_2011lr50$B4_sre - p224r63_2011lr50$B3_sre 
dev.off() #CHIUDERE IL GRAFICO

#plot colorRampe palette di default di dvi 1988
 
#diminuire la risoluzione  e aggregate l'immagine di 1988 al fattore 50
# immagine 1988 con bassa risoluzione JK
p224r63_1988lr50 <- aggregate(p224r63_1988, fact=50)
#indice di vegetazione di 1988 a bassa resoluzione 
dvi1988lr50 <- p224r63_1988lr50$B4_sre - p224r63_1988lr50$B3_sre #sottrazione infra rosso e rosso
 #differenza dei 2 indici di vegetazione   Di 2011 e del 1988 lr 50 a meno resoluzione
 difdvilr50 <- dvi2011lr50 - dvi1988lr50
 
#abbiamo fatto la differenza dei div  bassa risoluzione  e lo possiamo plottare usando la color rampe palette di prima JK 
cldifdvi <- colorRampPalette(c('red','white','blue'))(100) # col è color rampe palette JK
plot(difdvi, col=cldifdvi)  
#multiframe con 2 dati ottenuta per avere la grana giusta con quella ad alta e bassa risoluzione JK
 par(mfrow=c(2,1))
plot(difdvi, col=cldifdvi) #dvi a risoluzione originale
plot(difdvilr50, col=cldifdvi)  #dvi a risoluzione bassa



6 R CODE LANDCOVER
setwd("C:/lab/") 
#pacchetto Rstoolbox istallato prima .C si usa per istallare 2 pachetti diversi ma nello stesso tempo JK
#pachetto raster richiamato perche già istallato JK
library(raster)
library(RStoolbox)
p224r63_2011 <- brick("p224r63_2011_masked.grd") #brick serve a importare un immagine satellitare JK
#LANDSat bands 1b,2g,3r,4nir

plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")#plot con le componente red,green,blu JK
#classificazione con unsuperclass
#class si scrive con la C maiuscula
#spieghiamo al software l'immagine di cui parliamo e il numero di classi
#uniamo la mappa a nostro modello p224r63
p224r63_2011c <- unsuperClass(p224r63_2011, nClasses=4)
plot(p224r63_2011c$map)
#stabilire la legenda con color rampe palette
clclass <- colorRampPalette(c('red', 'green', 'blue', 'black'))(100) 
plot(p224r63_2011c$map, col=clclass)
#dfinizione di classi aumenta l incertezza del'algoritmo  automatico di classificazione
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
library(RStoolbox) #prima chiamare Rstoolbox e poi usare la funzione unsuperclass  JK
defor1_c <- unsuperClass(defor1, nClasses=2)
d1c <- unsperClass(defor1, nClasses=2)
plot(defor1_c$map)
cl <- colorRampPalette(c('darkblue','blue','light blue'))(100)#ci facciamo un color rampe palette Per visualizzare JK
plot(defor1_c$map, col=cl)
#ho ottenuto colori diversi dal prof quindi questa è la possibilita 2  JK
cl <- colorRampPalette(c('green','black'))(100)
plot(defor1_c$map, col=cl)
#classificazione defor2
#exercise:classificazione con i 2 classi l immagine satellitare di defor2
#la funzione unsuperclass per a seconda mappa 2_c classifichiamo l'imagine defor 2  poi fare il suo plot JK
defor2_c <- unsuperClass(defor2, nClasses=2)
plot(defor2_c$map, col=cl)
dev.off()

#mappe ottenute dopo plottagio delle 2 mappe
par(mfrow=c(2,1)) #grafico con 2 righe e una colonna JK
plot(defor1_c$map, col=cl)
plot(defor2_c$map, col=cl)
#invertiamo e righe e le colonne
par(mfrow=c(1,2))
#stima dei valori
#la frequenza dei valori JK
freq(defor1_c$map)
#aree aperte 36827
#foreste  304465
totd1 <- 36827 +304465 
totd1 341292
#calcolare le proporzione o le percentuali della mappa 1 JK
percent1 <- freq(defor_1c$map) * 100 / totd1= 0,00227940
#PERCENTUALI si mette su R percent1 per calcolare. percentuale della mappa è uguale lla frequenza delle mappe per 100 diviso tot1 JK
#FORESTE=10.79047
#aree =89.20953
 
#mappa 2 
#la frequenza defor 2 freq(defor2_c$map) #su R
#foreste 179321
#aree aperte 163405
totd2 <- 179321 + 163405
totd2=342726
#calcolo della percentuale della mappa 2
percent2 <- freq(d2c$map) * 100 / totd2 
percent2 #percentuale 2
#foreste 52.32197
#aree aperte 52.32197
#vedere la copertura forestale prima e dopo la deforestazione
#creare in dataset con tutti dati a l'interno,abbiamo una colonna che si chiama cover e lo associamo con 2 valori che sono agriculture e foreste per la prima colonna JK 
cover <- c("Agriculture","Forest")
#nella seconda colonna sono i valori  di agricoltura per faoresta nella prima mappa chiamata defor prima della deforestazione,il c serve prima di mettere 2 valori nelle parantesi JK
#ater è per l'alatra colonna dopo la deforestazione  e inseriamo 2 valori a l'interno delle paratesi JK 
before <- c(10.7,89.20)
after <- c(47.67,52.32)
#creare un  dataframe finale o output con valore di foresta e aree aperta e le associamo al dtaframe con una funzione che è data.frame JK
output <- data.frame(cover,before,after)#data.frame crea una tabella con le colonne che decidiamo di chiamare befor e after
View(output) : cover before after #serve per visualizzare
1 Agriculture   10.7 47.67
2      Forest   89.2 52.32
10.7904752.32197
#plottaare i valori
library(ggplot2) o install packages(ggplot2) se non ancora installato # ggplot serve per plottare le mappe raster  JK

# O5 MAGGIO
library(raster)
setwd("C:/lab/")
load("defor.RData")# R.data salvato precedentemente
#defor.Rdata è il dataset 
ls()
par(mfrow=c(1,2)) #per avere le 2 immagini insieme
cl <- colorRampPalette(c('black','green'))(100) # 
plot(d1c$map, col=cl)#d1c è la classificazione che abbiamo fatto sull'immagine defor con il numero di classe uguale a 2
plot(d2c$map, col=cl)
#dopo il dataframe abbiamo una tabella con la copertura e la percentuale di copertura prima e dopo il disboscamento JK
#plottiamo le informazione JK 
library(ggplot2)
#andiamo a fare un grafico basatosulla libreria ggplot2,il dataset è output,cioè il dataset creato l'ultima volta,poi un dataframe conla copertura,la percentuale di prima deforestazione e dopo JK
#le aestetics del grafico saranno per la x la copertura del suolo l'agricoltura e la forestazione e la y la percentuale di copertura prima della deforstazione JK
#histogrammi della percentuale della copertura prima della deforestazione.il colore sarà funzione della copertura 
ggplot(output, aes(x=cover, y=before, color=cover)) + #cover e la copertura ,geom barre sono le barre a creare, fill è la colorazione a l interno delle barre sara bianca  JK
geom_bar(stat="identity", fill="white") # identity significa come statistica, che prendiamo direttamente i valori di copertura.geom.bar sono le barre che creamo. JK
#fill è la colorazione a l'interno delle barre JK
dev.off()

#exercise plot histograms of landcover after deforestation
library(ggplot2)
#creamo un grafico JK
ggplot(output, aes(x=cover, y=after, color=cover)) + #x la copertura e y la copertura dopo
geom_bar(stat="identity", fill="white")
dev.off() 
#nuovo grafico:plot dei 2 histogrammi insieme .la funzione par non funzioa con ggplot2 quindi bisogna instalare un altro pachetto che si chiama gridExtra JK 
install.packages("gridExtra")
library(gridExtra) o require(gridExtra)
#plot finale con tutti dati a l'internoe usiamo le funzione grid.arrange che va a prendere vari plot e le mette insieme a l'interno dello stesso grafico quindi gioca il ruolo di par JK
#plot1 e 2 mettiamo l'uno accanto a l'altro per farlo dobbiamo assegnare il precedente ggplot a dei nomi che veranno inseriti al'interno di grid.arrange JK
#grid.arrange(p1, p2, nrow = 1) # this needs griExtra  JK
#prendiamo il precedente ggplot e li riassegamo un nome come grafico1 e grafico 2 per i 2, per farlo si mette la <- verso il nome
#histograms of % di deforestazione
grafico1 <- ggplot(output, aes(x=cover, y=before, color=cover)) + 
geom_bar(stat="identity", fill="white")

grafico2 <- ggplot(output, aes(x=cover, y=after, color=cover)) + 
geom_bar(stat="identity", fill="white")
 
#exercise use grid arrange to plot 2 graphs
library(gridExtra)
#usiamo grid.arrange per fare un grafico che usa 2 grafici a l'interno di una stessa finestra JK
#usiamo grid.arrange si inserisce al posto di plot1 e 2 grafico 1 e 2,si assegna un numero di righe 1 JK
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
#attraverso la funzione raster andiamo a caricare a prima immagine,solo quelle png. JK
#la working directory della cartella lab,la prima immagine è EN0001png riassociamo l'immagine al nome EN01 JK
#usiamo sola banda che riguarda l'azoto e quindi raster va bene invece di brick che importa interi paccheti di immagini satellitare JK
# una volta importata il primo set la possiamo visualizzare con il plot di EN1 JK
library(raster) #importiamo e singole immagini con la funzione raster JK
setwd("C:/lab/")
EN01 <- raster("EN_0001.png")
plot(EN01) # il grafico dell'azoto a gennaio JK
# EXERCISE importare tutte le immagine 
#con un ciclo si dice al sistema di prendere immagini a 1 a 13 e le importa dentro R, per prendere tutte le immagine insieme insieme  l'una su l'altra con la funzione stack JK
#caricare tutti i file con ciclo for: 
EN <- stack(c("EN_0001.png","EN_0002.png","EN_0003.png","EN_0004.png","EN_0005.png","EN_0006.png","EN_0007.png","EN_0008.png","EN_0009.png","EN_0010.png","EN_0011.png","EN_0012.png","EN_0013.png"))  
#si può importare un immagine uno dopo l'altro con raster 
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
 
#plot delle 2 immagini iniziali e finali quindi inziamo con la colorRampe palette jk
cl <- colorRampPalette(c('red','orange','yellow'))(100) #il giallo è il valore massimo di ossido di azoto   
#plot digennaio 
plot(EN01, col=cl)
#plot di marzo 
plot(EN13, col=cl)
#per vederle inseme si usa l finzione par JK
par(mfrow=c(1,2))
plot(EN01, col=cl)
plot(EN13, col=cl)
dev.off() # close the window
 
# PER VEDERE DIFFERENZE tra e 2 immaginni JK
difno2 <- EN13 - EN01 #difno2 la differenza tra i 2
#sabiliamo un nuovo colorRampe palette o cl
cldif <- colorRampPalette(c('blue','black','yellow'))(100) #
#plot della differenza difno2 jk
plot(difno2, col=cldif)
dev.off()
# plottiamo tutte le mappe jk
# ci sono 2 metodi: 1 metodo
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
# 2 Metodo: 
#spiegamo al sftware che si va a usare una lista di file.ls() jk 
library(raster)
setwd("~/lab/esa_no2")
# put all files into the folder  JK
#per tutte le immagine a l'interno di un certo range dalla prima al totale della r.list uso raster per importare tutti quei file che sono a l'interno della lista di file JK
rlist=list.files(pattern=".png", full.names=T)
#andamo aprendere list.rast per farlo basandosi su raster rinominato r
#per ogni i immagine a l'interno della lista che spiego al software deve caricare le immagini ed è fatto da un ciclo che si chiama for perche lavora per ogni immagine JK
#list(files) è la lista JK
#prendiamo la lista e lo applichiamo  alla funzione raster JK
list_rast=lapply(rlist, raster)
#usiamo direttamente la lista che va da 1 a 13 e andiamo a catturare ogni singolo file che comincia con EN jk
#con ciclo for JK
list_rast=list()
for(i in 1:length(rlist)){ #lenght=intervallo
r=raster(rlist[[i]]) #i sono i file,le immagini, raster cattura le singole bande JK
list_rast[[i]]=r} 
#6 maggio
setwd("C:/lab/")
load("EN.RData")
 
setwd("C:/lab/esa_NO2")
 
rlist <- list.files(pattern=".png")# list file è la lista dei file a l interno della cartella  JK
rlist #vedere la lista
listafinale <- lapply(rlist, raster)
listafinale
    
EN <- stack(listafinale)

cl <- colorRampPalette(c('red','orange','yellow'))(100) #
 cl <- colorRampPalette(c('red','orange','yellow'))(100) # 
plot(EN, col=cl)

#12 05 2020
#usiamo esa_no2 a l'interno della cartella lab,con estesione .png 
library(raster) #importa file a l interno di R JK
setwd("C:/lab/") 
#importiamo dati che sono valori di di N02 da gennaio a marzo 
setwd("C:/lab/esa_NO2")
#usiamo le cartelle esno2 oltre alla cartella lab a l'interno della cartella lab ci sono dei file che sono tutti .png JK
#usiamo la funzione list.file per anadare a importare questi file e associamo alla lista un nome JK 
#se digitiamo il nome r.list vediamo che ci sono tutti file .png che abbiamo a disposizione 
rlist <- list.files(pattern=".png")
#la funzione lapply fa applicare la funzione raster alla lista che sono appena chiamati alla rlist.il nome sarà lista finale JK
listafinale <- lapply(rlist, raster) #applicare LA FUNZIONE raster alla lista finale JK
listafinale
#impacchetare tutti i file con la funzione stack che è la composizione di tanti file insieme jk  
EN <- stack(listafinale) # STACK è una serie di bande insieme a l interno di un immagine. EN è il pachetto JK
EN <- stack(EN01,EN02,EN03,EN04,EN05,EN06,EN07,EN08,EN09,EN10,EN11,EN12,EN13)
#la differenza a l'interno di queste immagine tra luglio e marzo è la curva di gennaio
difEN <- EN$EN_0013 - EN$EN_0001
#creamo un coloRampe palette per la differenza jk
cld <- colorRampPalette(c('blue','white','red'))(100) 
#plottiamo la differenza jk
plot(difEN, col=cld)
plot(EN, col=cl)
#plottiamo l'intero set con la nuova color Rampe palette,usiamo boxplot per la media  jk
boxplot(EN)#per avere diagramma   finale e vedere come varia l'azoto JK
boxplot(EN, horizontal=T)#boxplot horizzontale jk
boxplot(EN, horizontal=T,outline=F)#outline=falls per rimuovere outlayers jk
boxplot(EN, horizontal=T,outline=F,axes=T)#mettere le assi axis=TRUE jk
 
 
 
# 27 maggio 
9 R CODE SNOW
#andare sul sito copernicus e caricare una delle immagini  di cryosfere he è snow cover
setwd("C:/lab/")
install.packages("ncdf4")#serve utilizzare i dati nc da copernicus
library(ncdf4)
library(raster)#la funzione raster si usa per importare i dati JK
snowmay <- raster("c_gls_SCE500_202005180000_CEURO_MODIS_V1.0.1.nc")#tra le virgolette c'è l'immagine,snoway erve a....
cl <- colorRampPalette(c('darkblue','blue','light blue'))(100)
#esercizio plot snow cover with the cl palette
#import snow data,importare tutti i file insIeme
setwd("C:/lab/snow")
# put all files into the folder
#la lista di file con la funzione rlist ,con tutti file.png
rlist=list.files(pattern=".png", full.names=T)#rlist è la lista di file
rlist <- list.files(pattern=".tif")
rlist # permette di vedere la lista delle immagini sul documento dentro R JK
#tutti i file importati con il pachetto raster JK
#creare una lista dei singoli file che abbiamo a disposizione da 2000 a 2020 poi si applica con lapply  a funzione raser a ogni singolo file JK
list_rast <- lapply(rlist, raster)#lapply va applicare la funzione di riferimento a l'interno della lista di file JK
#Gli accordiamo a tutti un unico stack che si chiama snow.multitemp jk      
snow.multitemp <- stack(list_rast) 
list_rast <- lapply(rlist, raster)
list_rast=lapply(rlist, raster)
#plottiamo la nuova immagine jk
plot(snow.multitemp,col=cl)
#plotttare la prima e l ultima immagine  JK
par(mfrow=c(1,2))
plot(snow.multitemp$snow2000r, col=cl)
plot(snow.multitemp$snow2020r, col=cl)
#plottare le 2 con un limite di 250
par(mfrow=c(1,2))
plot(snow.multitemp$snow2000r, col=cl, zlim=c(0,250))#zlim è il range,il limite della legenda
plot(snow.multitemp$snow2020r, col=cl, zlim=c(0,250))
dev.off()
# vedere la differenza tra le 2 mappe con colore diverso dal dif cl JK
difsnow = snow.multitemp$snow2020r - snow.multitemp$snow2000r #legiamo attraverso $ l'immagine di 2020 allo stack
difsnow = snow.multitemp$snow2020r - snow.multitemp$snow2000r
cldiff <- colorRampPalette(c('blue','white','red'))(100) #cldiff èla colorRampe palette della differenza di copertura di neve
plot(difsnow, col=cldiff)

## prediction
require(raster)
require(rgdal)#rgdal serve a 
predicted.snow.2025.norm <- 
#since code tak time u can download 
predicted.snow.2025.norm <- raster("predicted.snow.2025.norm.tif")
plot(predicted.snow.2025.norm, col=cl)

  
 
#26maggio 
10 R CODE PATCHES.r
setwd("C:/lab/")
library(raster) 
library(ggplot2) 
# writeRaster(d1c$map,"d1c.tif")#d1c e d2c sono le mappe classificate dell'altra volta
# writeRaster(d2c$map,"d2c.tif")# la mappa è collegta aal processo di classificazione con il $
#con writeraster sono stati scritti questi file a l'interno della cartella lab
#per caricare i dati abbiamo 2 funzioni  brick o per caricare tutte le bande e raster per un solo bando JK,
#caricare una mappa con foreste contro tutto il resto quidi usiamo raster
#diamo un nome alle mappe quindi d1c.tif si chiama d1c e l'altra d2c.tif si chiama d2c,si carica i dati a l'interno di R 
d1c <- raster("d1c.tif")#caricare la prima mappa,assegnamo la mappa con  <- 
d2c <- raster("d2c.tif") # land cover 1= agriculture, land cover 2=forest
#facciamo un plot dei 2 file(agriculture,forest) con un par  e un colorRampe palette jk
par(mfrow=c(1,2))# tutti 2 insieme
cl <- colorRampPalette(c('green','black'))(100) 
plot(d1c,col=cl)#colore=cl colorRampe palette jk
plot(d2c,col=cl)
#invertire la colorRampe palette 
par(mfrow=c(1,2))#la mappa coretta perche la foresta è la classe 2 e quella della foresta e la 1 l'algicultura JK
cl <- colorRampPalette(c('black','green'))(100) #cellStats(d1c.forest.patches, max)#number of patches identified
plot(d1c,col=cl)
plot(d2c,col=cl)
#andiamo a fare in modo che nella nostra mappa la clasee che corrisponde a l'agricoltura vada a un valore nullo passiamo dalla mappa precedente in cui avevamo foreste e agricoltura jk
#ognuno classificata estreamo solo la foresta perche dopo faremo dei calcoli che riguarda la foresta e vogliamo andare a estrarre la foresta per fare questi calcoli JK
#per farlo basta annullare tutto quello che non è foressta e la funzione è cbind che elimina alcuni valori e li mettiamo con i non valori NA jk
#tutto attraverso la funzion reclassify del pachetto raster  e riclassifica una certa immagine raster quindi riassegna dei valori JK
#abbiamo assegnato il valore 2 alla foresta ,riclassifichiamo solo la mappa per etrarre solo la mappa jk
#prendiamo la mappa d1c applichiamo la funzione riclassify eliminando tutto quello che non è foresta e associamo la funzione a d1c category forest o d1cfor JK
#riclassificare la nuova immagine 
d1c.cat.for <- reclassify(d1c, cbind(1, NA))#il valore che annulliamo è 1
d1c.for <- reclassify(d1c, cbind(1,NA)) 
#ripresentare la mappa con un par
par(mfrow=c(1,2))
cl <- colorRampPalette(c('black','green'))(100) #
plot(d1c.for,col=cl)
plot(d1c.for) 
 
# Exercise: repeat the whole process for d2c
# land cover 1= agriculture, land cover 2=forest
d2c.cat.for <- reclassify(d2c, cbind(1, NA))#
d2c.for <- reclassify(d2c, cbind(1,NA))#reclassifcare la classe 1 JK
par(mfrow=c(1,2))
plot(d2c)
cl <- colorRampPalette(c('dark 
blue','blue','green','orange','yellow','red'))(100) # 
plot(d2c.forest.patches,col=cl)
#creare i patch.unire tutti i pixel vicino per creare ogni singola patch
#ragrupare i pixel vicini in una singola patch useremo la fumzione clump che aggrega pixel vicini e gli mette come singoli patch
install.packages("igraph")
library(igraph) # for pacthes
d1c.for.pacthes <- clump(d1c.for)#clump di tutti pixel di d1
d2c.for.pacthes <- clump(d2c.for)
d2c.forest.patches <- clump(d2c.cat.for)#clump significa aggregare
 
cellStats(d1c.forest.patches, max)#number of patches identified
 
writeRaster(d1c.for.pacthes, "d1c.for.patches.tif")# writeraster  usato per scrivere  i file d1c e d2c nella cartella lab JK
writeRaster(d2c.for.pacthes, "d2c.for.patches.tif")
 
#plottare le 2 mappe uno accanto a l altro JK
par(mfrow=c(1,2))
plot(d1c.for.pacthes)
plot(d2c.for.pacthes
clp <- colorRampPalette(c('dark blue','blue','green','orange','yellow','red'))(100) # 
par(mfrow=c(1,2))
#creare una nuova colorRampe palette clp      
plot(d1c.for.pacthes, col=clp)# clp colore dei patch jk
plot(d2c.for.pacthes, col=clp) 
#quanti patch sono state create
#si aggiunge la funzione time per avere before and after deforestation JK
time <- c("Before deforestation","After deforestation")
npatches <- c(301,1212)#d1c e d2c
#creare un dataframe che si chiama output
# plot results con la libreria ggplot2 k vcon variazione di patch nel tempo
time <- c("Before deforestation","After deforestation")
npatches <- c(568,1920)
output <- data.frame(time,npatches)#output per vedere il plot finale con le colonne time e numero di patch  JK
attach(output)

ggplot(output, aes(x=time, y=npatches, color="red")) + geom_bar(stat="identity", fill="white")#aes sono le estetics,la geomatria a histogrammi,colore interno è white JK
#l'altra avevamo visto la variazione dell aria adesso abbiamo visto la variazione dei patch JK
 

##11 R CODE CROP
#simulation exam 
#fare un zoom e un ritaglio su un immagine globale     
setwd("C:/lab/snow/") 
# exercise caricare tutte le immagini snow insieme  da copernicus(da 2000 a 2020) 
#il pattern potrebbe essere snow     
#richiamare library(raster)
library(raster)     
#richiamare la libreria ncdf4
library(ncdf4) #per utilizzare i dati nc da copernicus JK
#la lista di file con la funzione rlist ,con tutti file che iniziano con snow     
rlist <- list.files(pattern="snow")  #in questo caso non tif ma snow
rlist #  lista di file 
#tutti i file importati con il pachetto raster JK
#creare una lista dei singoli file che abbiamo a disposizione da 2000 a 2020 poi si applica con lapply  a funzione raser a ogni singolo file JK
list_rast <- lapply(rlist, raster)#lapply va applicare la funzione di riferimento a l'interno della lista di file JK
#Gli accordiamo a tutti un unico stack che si chiama snow.multitemp jk      
snow.multitemp <- stack(list_rast) 
#facciamo un colorRampe palette       
clb <- colorRampPalette(c('dark blue','blue','light blue'))(100) # per plottare le immagini tutti insieme JK
#plottare tutta le immagine snow ,non usiamo un par perche usiamo uno stack JK     
plot(snow.multitemp,col=clb)  #colorRmampe palette light blue 
# fare lo zoom sul'immagine e un crop jk
#usiamo la funzione zoom e il nome dell'immagine più l'estenzione JK 
#si definisce prima l'estenzione di un certo file mettendo ad esempio il numero dell'estenzione xmax,xmin,ymax,ymin
#si ritaglia l'immagine in base a l'estenzione definito da noi     

#plot di una delle immagine legiamo il nostro stack files attraverso il $ a l'immagine che vogliamo plottare   
plot(snow.multitemp$snow2010r, col=clb) #colorRampe palette light blu
#dobbiamo vedere i nomi che compongono lo stack multitemp quindi mettiamo il nome snow multitemp e con la funzione names vediamo il nome dei vari file JK
snow.multitemp
names
#Esempio se prendiamo l'immagine del 2010 e facciamo uno plot,vogliamo zoomare sulla parte italiana
plot(snow.multitemp$snow2010r, col=clb) 
#facciamo un rettangolo sulla parte che ci interessa o definiamo delle coordinate,potremo dire che a nuova estenzione si da in questo modo JK     
extension <- c(6, 18, 40, 50)#dove xmin=6°,xmx=18°,ymin=30°,ymax=50°
#zoom dell'intero set
#appplichiamo la funzione zoom di raster a l'immagine di 2010 e l'estenzione     
zoom(snow.multitemp$snow2010r, ext=extension)
extension <- c(6, 18, 35, 50)     
# nella parte sud manca qualche grado quindi ridefiniamo l'estenzione cambiando quella originale   
extension <- c(6, 20, 35, 50)
#andiamo a definire un zoom     
zoom(snow.multitemp$snow2010r, ext=extension)#zoom più nome dell'immagine e l'estenzione
#disegnare l'estensione con draw extend()
#lanciare prima lo plot dell'immagine originale poi disegnare un rettangolino su l'estenzione JK
plot(snow.multitemp$snow2010r, col=clb)
zoom(snow.multitemp$snow2010r, ext=drawExtent())#estenzione=drawExtend
 
#fare un crop che taglia l'immagine sulla zona che vogliamo ritagliare definendo le coordinate JK
extension <- c(6, 20, 35, 50)#estenzione
snow2010r.italy <- crop(snow.multitemp$snow2010r, extension)#la funzione crop fa una nuova immagine
plot(snow2010r.italy, col=clb)    
#exercice  crop the italy extend on the whole stack of snow 
#plot della nuova immagine con il crop fatto prima.range delle varie legenda le mettiamo tutti uguali
#vedimamo i valori minimi e e massimi per tutte le legende e mettiamo il nome snow mutitemp.italy     
snow.multitemp.italy <- crop(snow.multitemp, extension)
plot(snow.multitemp.italy, col=clb)
#cambiamo tutte le legende e facciamo variare tra 20 a 200 in questo modo avranno la stessa variazione JK
#i vari range, l'argomento si chiama zlim   JK  
plot(snow.multitemp.italy, col=clb, zlim=c(20,200)) #zlim serve per limitare la legenda per tutte le immagini JK    
#boxplot in horizontale o previsione con la funzione prediction  #permette di prendere i valori intermedi e variazione dei valori di copertura nevosa.JK
boxplot(snow.multitemp.italy, horizontal=T,outline=F)#outliers=falls  sono valori molto fuori della distribuzione JK
     
     

#12 SPECIES Distribution MODELING     
#non facciamo il setwd perche usiamo il paccheto sdm    
install.packages("sdm")
library(sdm)     
library(raster)
library(rgdal) #permette di gestire al meglio dati raster e vettoriali a l'interno del software  
#carichiamo il file a l interno del pachetto sdm 
#shp è un file del sistema quindi usiamo la funzione system.file, carichiamo il file esterno 
#digitiamo system file e la mettiamo al'inter no di R     
system.file("external/species.shp", package="sdm") #sp.shp è un file vettoriale sono dei coordinate x,y JK
system.file("external/species.shp", package="sdm")
#caricare la part grafica con la funzione shapefile ,così possiamo usare quel dato per mappare quello chhe è la distribuzione delle specie allo stato attuale JK   
#[1] "C:/Users/HP/Documents/R/win 
#il dataset è formato da 2 punti con delle coordinate,una certa area di studio,e ognuno dei puntiè relazionato a l'interno di una tabella che raccoglie dati di occurence JK      
#digitiamo species     
species <- shapefile(file)  #rgdal serve per shapefile JK 
plot(species) #per vedere i punti a terra della specie JK
#visualizzare le presenze dalle assenze(occurence)
# species è il dataset con una sola colonna  JK 
#in R uguale è== quando si mette una condizione,la virgola interrompe la numerazione JK     
#prendiamo il dataset specie al'interno di questo per tutte le occorenzeche appartengono al dataset species  se solo sono uguali a 1     
plot(species[species$Occurrence == 1,],col='blue',pch=16) #per punti uguale a 1 colorati in blu poi aggiungiamo plot uguali a 0 colorato in rosso  JK
#solo quei punti dove la specie non è stata trovata.occorenze uguale a zero
points(species[species$Occurrence == 0,],col='red',pch=16)# la funzione points aggiunge dei punti al plot precedente .$occurence per  vedere la colonna JK
#vediamo le variabili ambientali,la prima è la temperatura JK
#individuare le variabili ambientali che si trovano nela cartella external JK
#importare il path cioè il percorso che ci porta alla cartella.a l'interno di sdm si trova a cartella esternal  JK    
path <- system.file("external", package="sdm") 
#a l'interno della cartella c'è una serie di files e si usa list.files,il pattern è asc che è un formato
lst <- list.files(path=path,pattern='asc$',full.names = T) # T =true
#usiamo il codice per importare i vari predictori che sono delle variabili ambientali che servono a prevedere quell che sarà la distribuzione della specie nello spazio JK
 #quindi le variabili sono le precipitazione,indice di vegetazione,la temperatura  
#facciamo uno stack di tutte le variabili.diamo un nome commune preds che sono quelle variabili che son ousate per prevedere quello che srà la distribuzione della specie       
preds <- stack(lst) #preds è una funzione per prevedere JK
list.files 
#scegliamo una bella colorRampe palette che si chiama cl  
cl <- colorRampPalette(c('yellow','orange','red')) (100) #mio
cl <- colorRampPalette(c('blue','orange','red','yellow')) (100) #per il prof
 #plot dei vari predictori    
plot(preds, col=cl)
#plot di una singola variabile elevation leagto al preds col $     
plot(preds$elevation, col=cl)
#mettiamo sopra i punti con la funzione point con occorenze uguale a 1    
#tutti i punti dove la specie e presente ? quindi sta bene in bassa elevation
points(species[species$Occurrence == 1,], pch=16)
# con la temperatura vegiamo come si comporta ?qui li piaciono temperature medio basse o basse
plot(preds$temperature, col=cl)
points(species[species$Occurrence == 1,], pch=16)
#per le precipitazione come si comporta? è intermedia 
plot(preds$precipitation, col=cl)
points(species[species$Occurrence == 1,], pch=16)
#indice di vegetazione
#plot della nostra vegetazione con  i nostri punti a l'interno
plot(preds$vegetation, col=cl)
points(species[species$Occurrence == 1,], pch=16)
#modello delle variabili che si chiama glm
#usiamo a l'interno del pachetto sdm la funzione sdmDtata che al'interno c'è train che significa training e predictors  JK   
dati <- sdmData(train=species, predictors=preds) #train  sono tutti punti raccolti a terra JK
# usiamo la funzione sdm , m1 è il modello     
m1 <- sdm(Occurrence ~ elevation + precipitation + temperature + vegetation, data=d, methods='glm')#la ~ significa uguale JK
#calcolo finale della previsione della y su tutto il nostro dataset   JK  
p1 <- predict(m1, newdata=preds)#la funzione p1 è predict lo associamo a predict la previsione di dove si troverà la specie.JK
#usiamo la colorRmape palette precedente cl    
plot(p1, col=cl)
points(species[species$Occurrence == 1,], pch=16) # la mappa di previsione




#EXAM PROJECT
setwd("C:/lab/SWI/") 
# exercise caricare tutte le immagini snow insieme  da copernicus(da 2000 a 2020) 
#il pattern potrebbe essere snow     
#richiamare library(raster)
library(raster) 
install.packages("sp")      
#richiamare la libreria ncdf4
library(ncdf4) #per utilizzare i dati nc da copernicus JK
#la lista di file con la funzione rlist ,con tutti file che iniziano con SWI    
rlist <- list.files(pattern="SWI")  #in questo caso non tif ma swi
rlist #  lista di file 
#tutti i file importati con il pachetto raster JK
#creare una lista dei singoli file che abbiamo a disposizione da 2015 a 2020 poi si applica con lapply  a funzione raster a ogni singolo file JK
list_rast <- lapply(rlist, raster)#lapply va applicare la funzione di riferimento a l'interno della lista di file JK
#Gli accordiamo a tutti un unico stack che si chiama swi.multitemp jk      
swi.multitemp <- stack(list_rast) 
#facciamo un colorRampe palette       
clb <- colorRampPalette(c('dark green','blue','light green'))(100) # per plottare le immagini tutti insieme JK
#plottare tutta le immagine snow ,non usiamo un par perche usiamo uno stack JK     
plot(swi.multitemp,col=clb)  #colorRmampe palette light blue 
 dev.off()    
#l immagine in R cambiando nome  IN swi 2015   
swi2015 <- raster("c_gls_SWI1km_201505221200_CEURO_SCATSAR_V1.0.1.nc")
plot(swi2015)    
swi2020 <- raster("c_gls_SWI1km_202005211200_CEURO_SCATSAR_V1.0.1.nc")
plot(swi2020)     
# fare lo zoom sul'immagine e un crop jk 
#usiamo la funzione zoom e il nome dell'immagine più l'estenzione JK 
#si definisce prima l'estenzione di un certo file mettendo ad esempio il numero dell'estenzione xmax,xmin,ymax,ymin
#si ritaglia l'immagine in base a l'estenzione definito da noi     
Surface.State.Flag.3=swi2020 no
#plot di una delle immagine legiamo il nostro stack files attraverso il $ a l'immagine 1 di 2015 che vogliamo plottare   
plot(swi.multitemp$Surface.State.Flag.1, col=clb) #colorRampe palette light blu plot(swi.multitemp$swi2020, col=clb) 
#dobbiamo vedere i nomi che compongono lo stack multitemp quindi mettiamo il nome snow multitemp e con la funzione names vediamo il nome dei vari file JK
swi.multitemp
names
#Esempio se prendiamo l'immagine del 2015 e facciamo uno plot,vogliamo zoomare sulla parte italiana
plot(swi.multitemp$Surface.State.Flag.1,, col=clb) 
#facciamo un rettangolo sulla parte che ci interessa o definiamo delle coordinate,potremo dire che a nuova estenzione si da in questo modo JK     
extension <- c(-11, 40, 35, 72)#dove xmin=6°,xmx=18°,ymin=30°,ymax=50°
#zoom dell'intero set
#appplichiamo la funzione zoom di raster a l'immagine di 2020 e l'estenzione     
zoom(swi.multitemp$Surface.State.Flag.3, ext=extension)
extension <- c(5, 35, 30, 50)     
# nella parte sud manca qualche grado quindi ridefiniamo l'estenzione cambiando quella originale   
extension <- c(11, 35, 30, 50)   
#disegnare l'estensione con draw extend()
#lanciare prima lo plot dell'immagine originale poi disegnare un rettangolino su l'estenzione JK
plot(swi.multitemp$Surface.State.Flag.3, col=clb)
zoom(swi.multitemp$Surface.State.Flag.3, ext=drawExtent())#estenzione=drawExtend
 
#fare un crop che taglia l'immagine sulla zona che vogliamo ritagliare definendo le coordinate JK
extension <- c(5, 35, 30, 50)#estenzione
Surface.State.Flag.3.italy <- crop(swi.multitemp$Surface.State.Flag.3, extension)#la funzione crop fa una nuova immagine
plot(Surface.State.Flag.3.italy, col=clb)    
#exercice  crop the italy extend on the whole stack of snow 
#plot della nuova immagine con il crop fatto prima.range delle varie legenda le mettiamo tutti uguali
#vedimamo i valori minimi e e massimi per tutte le legende e mettiamo il nome snow mutitemp.italy     
swi.multitemp.italy <- crop(swi.multitemp, extension)
plot(swi.multitemp.italy, col=clb)
#cambiamo tutte le legende e facciamo variare tra 20 a 200 in questo modo avranno la stessa variazione JK
#i vari range, l'argomento si chiama zlim   JK  
plot(swi.multitemp.italy, col=clb, zlim=c(10,100)) #zlim serve per limitare la legenda per tutte le immagini JK    
#boxplot in horizontale o previsione con la funzione prediction  #permette di prendere i valori intermedi e variazione dei valori di copertura nevosa.JK
boxplot(swi.multitemp.italy, horizontal=T,outline=F) #outliers=falls  sono valori molto fuori della distribuzione JK     

c_gls_SWI1km_201505221200_CEURO_SCATSAR_V1.0.1.nc
c_gls_SWI1km_202005211200_CEURO_SCATSAR_V1.0.1
c_gls_SWI1km_201505211200_CEURO_SCATSAR_V1.0.1

# put all files into the folder
#la lista di file con la funzione rlist ,con tutti file.png
rlist=list.files(pattern=".nc", full.names=T)#rlist è la lista di file
rlist <- list.files(pattern=".nc")
rlist # permette di vedere la lista delle immagini sul documento dentro R JK
#tutti i file importati con il pachetto raster JK
#creare una lista dei singoli file che abbiamo a disposizione da 2000 a 2020 poi si applica con lapply  a funzione raser a ogni singolo file JK
list_rast <- lapply(rlist, raster)#lapply va applicare la funzione di riferimento a l'interno della lista di file JK
#Gli accordiamo a tutti un unico stack che si chiama snow.multitemp jk      
swi.multitemp <- stack(list_rast) 
list_rast <- lapply(rlist, raster)
list_rast=lapply(rlist, raster)
#plottiamo la nuova immagine jk
plot(swi.multitemp,col=clb)
#plotttare la prima e l ultima immagine  JK
par(mfrow=c(1,2))
plot(swi.multitemp$Surface.State.Flag.3, col=clb)
plot(snow.multitemp$swi2020, col=clb)
#plottare le 2 con un limite di 250
par(mfrow=c(1,2))
plot(swi.multitemp$Surface.State.Flag.3, col=clb)   #zlim è il range,il limite della legenda

dev.off()
# vedere la differenza tra le 2 mappe con colore diverso dal dif cl JK
difswi = swi.multitemp$Surface.State.Flag.3 - swi.multitemp$Surface.State.Flag.2  #legiamo attraverso $ l'immagine di 2020 allo stack

cldiff <- colorRampPalette(c('blue','white','red'))(100) #cldiff èla colorRampe palette della differenza di copertura di neve
plot(difswi, col=cldiff)

 
library(raster) #importiamo e singole immagini con la funzione raster JK
setwd("C:/lab/")
#si può importare un immagine uno dopo l'altro con raster      
swi2015 <- raster("EN_0001.png")
SWI2015 <- raster("c_gls_SWI1km_201505221200_CEURO_SCATSAR_V1.0.1.nc")
plot(SWI2015)
SWI2020 <- raster("c_gls_SWI1km_202005211200_CEURO_SCATSAR_V1.0.1.nc")      
plot(SWI2020) # il grafico dell- indice del suolo nel 2020 JK
#  o con brick     
SWI2015<- brick("c_gls_SWI1km_201505221200_CEURO_SCATSAR_V1.0.1.nc")
SWI2020 <- brick("c_gls_SWI1km_202005211200_CEURO_SCATSAR_V1.0.1.nc")   
# EXERCISE importare tutte le immagine 
#con un ciclo si dice al sistema di prendere immagini a 1 a 2 e le importa dentro R, per prendere tutte le immagine insieme insieme  l'una su l'altra con la funzione stack JK
#caricare tutti i file con ciclo for: 
SWI <- stack c("c_gls_SWI1km_201505221200_CEURO_SCATSAR_V1.0.1.nc,c_gls_SWI1km_202005211200_CEURO_SCATSAR_V1.0.1.nc")) 
SWI <- stack( SWI2015,SWI2020)
EN <- stack(EN01,EN02,EN03,EN04,EN05,EN06,EN07,EN08,EN09,EN10,EN11,EN12,EN13)                       
plot(SWI)
# writeRaster(EN01[[3]], "snow2000r.tif")
 
#plot delle 2 immagini  quindi inziamo con la colorRampe palette jk
cl <- colorRampPalette(c('red','yellow'))(100) #il giallo è il valore massimo di ossido di azoto   
#plot di maggio 2015 
plot(SWI2015, col=cl)
#plot di maggio 2020 
plot(SWI2020, col=cl)
#per vederle inseme si usa l finzione par JK
par(mfrow=c(1,2))
plot(SWI2015, col=cl)
plot(SWI2020, col=cl)
dev.off() # close the window
 
# PER VEDERE DIFFERENZE tra e 2 immaginni JK
difSWI <- SWI2015 - SWI2020 #difSWI la differenza tra i 2
#sabiliamo un nuovo colorRampe palette o cl
cldif <- colorRampPalette(c('blue','green'))(100) #
#plot della differenza difno2 jk
plot(difSWI, col=cldif)
plot(difSWI, col=cld)
plot(SWI, col=cl) 
dev.off()
# plottiamo tutte le mappe jk
# ci sono 2 metodi: 1 metodo
par(mfrow=c(1,2))
plot(SWI2015, col=cl)
plot(SWI2020, col=cl)

# 2 Metodo: 
#spiegamo al software che si va a usare una lista di file.ls() jk 
library(raster)
setwd("C:/lab/SWI")
# put all files into the folder  JK
#per tutte le immagine a l'interno di un certo range dalla prima al totale della r.list uso raster per importare tutti quei file che sono a l'interno della lista di file JK
rlist=list.files(pattern=".nc", full.names=T)
#andamo aprendere list.rast per farlo basandosi su raster rinominato r
#per ogni i immagine a l'interno della lista che spiego al software deve caricare le immagini ed è fatto da un ciclo che si chiama for perche lavora per ogni immagine JK
#list(files) è la lista JK
#prendiamo la lista e lo applichiamo  alla funzione raster JK
list_rast=lapply(rlist, raster)
#usiamo direttamente la lista che va da 1 a 13 e andiamo a catturare ogni singolo file che comincia con EN jk
#con ciclo for JK
list_rast=list()
for(i in 1:length(rlist)){ #lenght=intervallo
r=raster(rlist[[i]]) #i sono i file,le immagini, raster cattura le singole bande JK
list_rast[[i]]=r} 
 
setwd("C:/lab/")
load("SWI.RData")
setwd("C:/lab/SWI")
rlist <- list.files(pattern=".png")# list file è la lista dei file a l interno della cartella  JK
rlist #vedere la lista
listafinale <- lapply(rlist, raster)
listafinale   
SWI <- stack(listafinale)
cl <- colorRampPalette(c('red','yellow'))(100) #
plot(SWI, col=cl)

#usiamo SWI a l'interno della cartella lab,con estesione .nc

#plottiamo l'intero set con la nuova color Rampe palette,usiamo boxplot per la media  jk
boxplot(SWI)#per avere diagramma   finale e vedere come varia l'azoto JK
boxplot(SWI, horizontal=T)#boxplot horizzontale jk
boxplot(SWI, horizontal=T,outline=F)#outline=falls per rimuovere outlayers jk
boxplot(SWI, horizontal=T,outline=F,axes=T)#mettere le assi axis=TRUE jk   
chercher la fonction write raste et l-utiliser     
     
 
