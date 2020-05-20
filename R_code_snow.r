setwd("C:/lab/")
install.packages("ncdf4")
library(ncdf4)
library(raster)
snowmay <- raster("c_gls_SCE500_202005180000_CEURO_MODIS_V1.0.1.nc")
cl <- colorRampPalette(c('darkblue','blue','light blue'))(100)
#esercizio plot snow cover with the cl palette
#import snow data,importare tutti i file inseme
setwd("C:/lab/snow")
# put all files into the folder

rlist=list.files(pattern=".png", full.names=T)
rlist <- list.files(pattern=".tif")
rlist # permette di vedere la lista delle immagini sul documento dentro R

list_rast <- lapply(rlist, raster)
#save raster into list
#con lappy
list_rast=lapply(rlist, raster)
snow.multitemp <- stack(list_rast)
plot(snow.multitemp,col=cl)
#plotttare la prima e l ultima immagine 
par(mfrow=c(1,2))
plot(snow.multitemp$snow2000r, col=cl)
plot(snow.multitemp$snow2020r, col=cl)
#plottare le 2 con un limite di 250
par(mfrow=c(1,2))
plot(snow.multitemp$snow2000r, col=cl, zlim=c(0,250))
plot(snow.multitemp$snow2020r, col=cl, zlim=c(0,250))
dev.off()
# vedere la differenza tra le 2 mappe con colore diverso dal dif cl
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


