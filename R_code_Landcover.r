setwd("C:/lab/") 
#pacchetto Rstoolbox istallatato prima .C si usa per istallare 2 pachetti diversi ma nello stesso tempo
#pachetto raster richiamato pperche gia istallato
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




