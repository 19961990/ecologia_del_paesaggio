#codice R per analisi immagini satellitari
#packages raster
install.packages("raster")
library (raster)
# setwd("C:/lab/")
p224r63 <- brick("p224r63_2011_masked.grd")
p224r63_2011 <- brick("p224r63_2011_masked.grd") o plot( p224r63) per plottare l imagine sul grafico

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
#{1}"B1_sre"B2_sre""B3_sre"B4_sre"B5_sre"B6_bt""B7_sre"
clb <- colorRampPalette(c('dark blue','blue','light blue'))(100) #
plot(
  #attach(dataframe
 
    plot(p224r63_2011$B1_sre)
    plot(p224r63_2011$B1_sre, col=clb)
  #attach(dataframe)non funiona con il pachetto raster
  #simbolo che lega la colonna(la banda al dataset(immagine)
  
  #esercizio plottare la banda del l infrarosso vicino con 
  #colorrampalette che varia dal rosso all arancione al giallo 
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
  #per chiudere i  GRAFICI
  dev.off()
  #natural colors
  #3 componenti  R red G green B blue 3 bande
  # plotRGB e la funfione che permette di capire co sono RGB
  # B1: blue
# B2: green
# B3: red
  # B4: near infrared (nir)
# plotRGB(p224r63_2011,r=3,g=2,b=1) vedere i colori come a occhio nudo sul immagine satellitare
  #strectch=Lin  funzione per tirare
  [12:22] Duccio Rocchini
    
plotRGB(p224r63_2011, r=3, g=2, b=1)
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
#nir 
# false colour
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
  plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")  #Lin per lineare
  #excercise nir nella componente green si vede la parte della vegetazione.la parte nuda del suola viola.G green
  plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
  #nir nella componente blue le piante saranno blu e solo nudo giallo
  plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")
  #--------------- 1988 comando per la prossima volta
  # dopo pasqua 
 library (raster) 
 setwd("C:/lab/")    
  load("teleril")  
     ls()
  p224r63_1988 <- brick("p224r63_1988_masked.grd")  #p per patch
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
  #plot delle 2 immagine 1988 e 2011 facciamo un multi panel per questo usiamo par  
 plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin") 
 plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
 #agiungere un titolo al grafico si usa name   
par(mfrow=c(2,1))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin", main="1988")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin", main="2011") 
  #chiudere il multiframe par   
   dev.off() 
 #spectral indices   
  # per collegare data set a l immagine ,<- per ridurre un ogetto a un altro cosi senza parantesi dopo, sre e il sensore
    dvi1988 <- p224r63_2011$B4_sre-p224r63_2011$B3_sre
    plot(dvi1988)
    #exercicce calculate dvi for 2011
    dvi2011 <- p224r63_2011$B4_sre-p224r63_2011$B3_sre #sre significa  difference vegetation index
    plot(dvi2011)
     #esempio palette di  colore del dvi
cldvi <- colorRampPalette(c('light blue','light green','green'))(100) # 
plot(dvi2011, col=cldvi)    
#analisi multitemporale   per mlostrare vegetazioni che hanno subito piu o meno stress  
 difdvi <- dvi2011 - dvi1988
plot(difdvi)    
 cldifdvi <- colorRampPalette(c('red','white','blue'))(100) # col e color rampe palette
plot(difdvi, col=cldifdvi) 
 #visualize the output
 #multiframe 1998rgb,2011 rgb,difdiv
  par(mfrow=c(3,1))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plot(difdvi, col=cldifdvi)  
 dev.off()   
#modificare la grana o resoluzione con aggregate
 p224r63_2011lr <- aggregate(p224r63_2011, fact=10) #lr significa low resolution, fact o fattore e l argomento o il pixe
 p224r63_2011
 p224r63_2011lr
par(mfrow=c(2,1))
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011lr, r=4, g=3, b=2, stretch="Lin")
  #lower resolution
   p224r63_2011lr50 <- aggregate(p224r63_2011, fact=50) 
p224r63_2011lr50    
   #original 30m risampled  a 1500m
par(mfrow=c(3,1))
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011lr, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011lr50, r=4, g=3, b=2, stretch="Lin")    
    
dvi2011lr50 <- p224r63_2011lr50$B4_sre - p224r63_2011lr50$B3_sre 
 dev.off()
    # immagine 1988 con bassa resoluzione
plot(dvi2011lr50) 
  p224r63_1988lr50 <- aggregate(p224r63_1988, fact=50)  
dvi1988lr50 <- p224r63_1988lr50$B4_sre - p224r63_1988lr50$B3_sre 
 #differenza dei 2 indici di vegetazione   DI 2011 ler del 1988 lr 50
    difdvilr50 <- dvi2011lr50 - dvi1988lr50
  #multiframe con 2 dati finali per avere la grana giusta con quella a alta e bassa risoluzione
 par(mfrow=c(2,1))
plot(difdvi, col=cldifdvi)
plot(difdvilr50, col=cldifdvi)
  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
