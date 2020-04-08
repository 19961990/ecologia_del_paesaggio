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
  plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
  #excercise nir nella componente green si vede la parte della vegetazione.la parte nuda del suola viola.G green
  plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
  #nir nella componente blue le piante saranno blu e solo nudo giallo
  plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")
  #--------------- 1988 comando per la prossima volta

