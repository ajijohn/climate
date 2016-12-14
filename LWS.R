LWS <-read.csv("https://raw.githubusercontent.com/ajijohn/climate/master/lws.csv")
str(LWS)
#?strptime
head(LWS)

LWS$TSFMT<- as.POSIXct(LWS$TS,format="%m/%d/%Y %H:%M")

#Author: Celeste Dodge
#Purpose: read in and explore time series data (Leaf wetness data)


#LWS <- read.csv("F:/Local Climate Data/lws.csv")
str(LWS)
#this is not working
plot(LWS$TSFMT,LWS$oak)

library(ggplot2)
ggplot(data=LWS, aes(TSFMT,oak)) + geom_line()

library(dplyr)
# to look at the spread
summary(LWS$oak)

# idea of which is wet or dry
LWS %>% filter(oak < 400) %>% ggplot(aes(TSFMT,oak)) + geom_line()
  

# tag which one is dry/wet
LWS %>% mutate(conditions=ifelse((oak < 262),'dry',ifelse((oak > 275),'wet')) )  %>% head()

#closer but data might be reading as numeric rather than time stamps
plot.ts(LWS$TS,LWS$oak)
plot.ts(LWS$TS,LWS$oak,,,xy.lines = TRUE)

#try to convert not working so well
as.POSIXct(LWS$TS)
as.POSIXlt(LWS$TS)

#I think I need to download and install plotly
#install.packages("plotly")
#ggplot is the best - plotly is built on gg plot
#install.packages("ggplot2")