#codice R per analisi immagini satellitari
#packages raster
install.packages("raster")
library (raster)
# setwd("C:/lab/")
p224r63 <- brick("p224r63_2011_masked.grd")
p224r63_2011 <- brick("p224r63_2011_masked.grd") o plot( p224r63) per plottare l imagine sul grafico

pairs(p224r63_2011m) # time consuming

# plotRGB
