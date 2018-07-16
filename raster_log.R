ggmap(map) + geom_point(
aes(x=lon, y=lat, colour=tairC),
data=taair, alpha=.5, na.rm = T)  +
scale_color_gradient(low="green", high="red") + xlab("Longitude") + ylab("Latitude") + title("Surface temperature 1/1/1981")
ggmap(map) + geom_point(
aes(x=lon, y=lat, colour=tairC),
data=taair, alpha=.5, na.rm = T)  +
scale_color_gradient(low="green", high="red") + xlab("Longitude") + ylab("Latitude") + ggtitle("Surface temperature 1/1/1981")
ggmap(map) + geom_point(
aes(x=lon, y=lat, colour=tairC),
data=taair, alpha=.5, na.rm = T)  +
scale_color_gradient(low="green", high="red") + xlab("Longitude") + ylab("Latitude") + ggtitle("Air temperature at 3cm on 1/1/1981")
save.image("~/git/climate/Aug1st2017.RData")
mv?
;
?mv
?ren
?rename
ggmap(map) + geom_point(
aes(x=lon, y=lat, colour=tairC),
data=taair, alpha=.5, na.rm = T)  +
scale_color_gradient(low="green", high="red") + xlab("Longitude") + ylab("Latitude") + ggtitle("Air temperature at 3cm on 1/1/1981") +     labs(color="Pollutant Station")
ggmap(map) + geom_point(
aes(x=lon, y=lat, colour=tairC),
data=taair, alpha=.5, na.rm = T)  +
scale_color_gradient(low="green", high="red") + xlab("Longitude") + ylab("Latitude") + ggtitle("Air temperature at 3cm on 1/1/1981") +     labs(color="Tair")
taair3cm111981 <- taair
ggmap(map) + geom_point(
aes(x=lon, y=lat, colour=tairC),
data=taair3cm111981, alpha=.5, na.rm = T)  +
scale_color_gradient(low="green", high="red") + xlab("Longitude") + ylab("Latitude") + ggtitle("Air temperature at 3cm on 1/1/1981") +     labs(color="Tair")
taair48cm111981 <- read.csv("http://s3-us-west-2.amazonaws.com/microclim/5980f01a07f15e12c43eb3c3/Tair_output_shade-0_height-48_interval-daily_aggregation-avg_times-19810101-19810101_created-2017-08-01-2118.csv",header = TRUE,comment.char = "#")
taair48cm111981$tairC <- TrenchR::kelvin_to_celsius(taair48cm111981$Tair)
ggmap(map) + geom_point(
aes(x=lon, y=lat, colour=tairC),
data=taair48cm111981, alpha=.5, na.rm = T)  +
scale_color_gradient(low="green", high="red") + xlab("Longitude") + ylab("Latitude") + ggtitle("Air temperature at 3cm on 1/1/1981") +     labs(color="Tair")
ggmap(map) + geom_point(
aes(x=lon, y=lat, colour=tairC),
data=taair48cm111981, alpha=.5, na.rm = T)  +
scale_color_gradient(low="green", high="red") + xlab("Longitude") + ylab("Latitude") + ggtitle("Air temperature at 48cm on 1/1/1981") +     labs(color="Tair")
ggmap(map) + geom_point(
aes(x=lon, y=lat, colour=tairC),
data=taair3cm111981, alpha=.5, na.rm = T)  +
scale_color_gradient(low="green", high="red") + xlab("Longitude") + ylab("Latitude") + ggtitle("Air temperature at 3cm on 1/1/1981") +     labs(color="Tair")
ggmap(map) + geom_point(
aes(x=lon, y=lat, colour=tairC),
data=taair48cm111981, alpha=.5, na.rm = T)  +
scale_color_gradient(low="green", high="red") + xlab("Longitude") + ylab("Latitude") + ggtitle("Air temperature at 48cm on 1/1/1981") +     labs(color="Tair")
taair198cm111981 <- read.csv("http://s3-us-west-2.amazonaws.com/microclim/5980f2c907f15e12c43eb3c4/Tair_output_shade-0_height-198_interval-daily_aggregation-avg_times-19810101-19810101_created-2017-08-01-2130.csv",header = TRUE,comment.char = "#")
taair198cm111981$tairC <- TrenchR::kelvin_to_celsius(taair198cm111981$Tair)
ggmap(map) + geom_point(
aes(x=lon, y=lat, colour=tairC),
data=taair198cm111981, alpha=.5, na.rm = T)  +
scale_color_gradient(low="green", high="red") + xlab("Longitude") + ylab("Latitude") + ggtitle("Air temperature at 198cm on 1/1/1981") +     labs(color="Tair")
?log
?plot
?rep
?text
?data.frame
?rbind
?data.frame
x <- c(a=1,b=2)
y <- c(a=10,c=30)
x
y
collect(x,y)
tv < c(1,3,5,6)
tv <- c(1,3,5,6)
tv(1:)
tv(1,)
tv[1,]
tv[1,,]
tv
tv[c(1,2)]
tv[c(1:2)]
tv[c(1:5)]
tv[c(1:4)]
library(chron)
library(RColorBrewer)
library(lattice)
library(ncdf4)
library(raster)
#dfile="/Users/ajijohn/git/ebm/past_1981_Tsurface.nc"
dfile = "/Users/ajijohn/git/microclimRapi/vignettes/Tair_output_shade-0_height-6_interval-hourly_aggregation-avg_times-19810101-19991231_created-2017-05-18-0026.nc"
r <- raster(dfile,  varname = "Tair")
projection(r) <- "+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
writeRaster(r, "Tair.grd", format='raster', overwrite=TRUE)
plot(r)
knitr::opts_chunk$set(echo = TRUE)
latest <-'http://thredds.ucar.edu/thredds/dodsC/satellite/SFC-T/SUPER-NATIONAL_1km/current/SUPER-NATIONAL_1km_SFC-T_20170825_1900.gini'
#read the GINI as netCDF file
# load the ncdf4 package
library(ncdf4)
# open a netCDF file
ncin <- nc_open(latest)
print(ncin)
x <- ncvar_get(ncin,"x")
nx <- dim(x)
head(nx)
# get proj y
