## ----setup, include = FALSE---------------------------------------------------
library(StormR)
library(terra)
library(rworldxtra)
data("countriesHigh")

## ----chunk1-------------------------------------------------------------------
sds <- defStormsDataset(verbose = 0)
st <- defStormsList(sds = sds, loi = "Vanuatu", names = "PAM", verbose = 0)

## ----chunk2-------------------------------------------------------------------
head(getObs(st, name = "PAM"))

## ----chunk3-------------------------------------------------------------------
getNbObs(st, name = "PAM")
getInObs(st, name = "PAM")

## ----chunk4-------------------------------------------------------------------
plotStorms(st, labels = TRUE)

## ----chunk5-------------------------------------------------------------------
pt <- c(166.45, -22.27)
st <- defStormsList(sds = sds, loi = pt, seasons = c(2015, 2021), verbose = 0)

## ----chunk6-------------------------------------------------------------------
getNbStorms(st)
getNames(st)
getSeasons(st)

## ----chunk7-------------------------------------------------------------------
plotStorms(st, names = "NIRAN", labels = TRUE, legends = "bottomleft")

## ----chunk8-------------------------------------------------------------------
NIRAN <- getStorm(st, name = "NIRAN")
getNames(NIRAN)

## ----chunk9-------------------------------------------------------------------
sp <- eezNC
st <- defStormsList(sds = sds, loi = eezNC, season = c(2015, 2021), verbose = 0)

## ----chunk10------------------------------------------------------------------
LOI <- getLOI(st)
Buffer <- getBuffer(st)
BufferSize <- getBufferSize(st)
terra::plot(Buffer, lty = 3, main = paste(BufferSize, "km buffer arround New Caledonian EEZ", sep = " "))
terra::plot(LOI, add = TRUE)
terra::plot(countriesHigh, add = TRUE)

## ----chunk11------------------------------------------------------------------
getSSHS(st)

## ----chunk12------------------------------------------------------------------
plotStorms(st, category = c(4, 5), labels = FALSE, legends = "topright")

