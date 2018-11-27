
# install.packages(c("raster", "dismo", "rgdal", "sp", "maptools"))
library(dismo)
library(maptools)

data(acaule)
data(wrld_simpl)

colnames(acaule)
plot(wrld_simpl, xlim=c(-70,-20), ylim=c(-60,20), axes=TRUE, col="light yellow")


acgeo <- subset(acaule, !is.na(lon) & !is.na(lat))
acgeo <- data.frame(lon = acgeo$lon, lat = acgeo$lat)

# remove geographic outliers
acgeo <- acgeo[acgeo$lon < (-50),]
acgeo <- acgeo[acgeo$lat > (-50),]

acgeo <- acgeo[duplicated(acgeo) ==FALSE, ]


acg <- SpatialPoints(coords = acgeo)
plot(acg, xlim=c(-70,-10), ylim=c(-60,15))
plot(wrld_simpl, add=T, border='grey')
abline(h = 15)
abline(h = -60)
abline(v = -30)
abline(v = -85)

myext <- extent(-85, xmax = -30, ymax = -60, ymin = 15)

points(acgeo$lon, acgeo$lat, col='red', cex=0.75)

getData('worldclim', var='tmin', res=0.5, lon=5, lat=45)

subvars <- sort (c(1, 12, 16, 17, 5, 6, 7, 8))

sa <- sa[[subvars]]
names(sa) <- c("AnnTemp","MaxTemp",  "MinTemp","TempSpan",
               "MeanTWet","AnnPrecip", "DryPrecip","ColdPrecip")

save(sa, file = "SA_climate.Rdata")
