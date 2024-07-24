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
getScale(st)

## ----chunk12------------------------------------------------------------------
plotStorms(st, category = c(5, 6), labels = FALSE, legends = "topright")

## ----chunk 12-----------------------------------------------------------------
# Tokyo's tropical cyclone intensity scale
RSMCScale <- c(16.94, 24.44, 32.5, 43.33, 53.61)

sts_jpn <- defStormsList(sds = sds,
                         loi = "Vanuatu",
                         names = "PAM",
                         scale = RSMCScale,
                         verbose = 0)

plotStorms(sts_jpn)

## ----chunk 13-----------------------------------------------------------------
RSMCPalette <- c("#6ec1ea", "#4dffff", "#c0ffc0", "#ffd98c", "#ff738a", "#a188fc")
names(RSMCPalette) <- c("Tropical depression",
                        "Tropical storm",
                        "Severe tropical storm",
                        "Typhoon",
                        "Very strong typhoon",
                        "Violent typhoon")

sts_jpn <- defStormsList(sds = sds,
                         loi = "Vanuatu",
                         names = "PAM",
                         scale = RSMCScale,
                         scalePalette = RSMCPalette,
                         verbose = 0)

plotStorms(sts_jpn)

## ----chunk13------------------------------------------------------------------
# Example of dynamic plot, using the same parameters above
plotStorms(st, category = c(4, 5), labels = FALSE, legends = "topright", dynamicPlot=TRUE)

