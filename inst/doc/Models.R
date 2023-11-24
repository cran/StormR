## ----setup, include = FALSE---------------------------------------------------
library(StormR)
library(terra)
library(rworldxtra)
data("countriesHigh")

## ----include = FALSE----------------------------------------------------------
oldpar <- par(mfrow = c(1,2))

## -----------------------------------------------------------------------------
sds <- defStormsDataset()
st <- defStormsList(sds = sds, loi = c(168.33, -17.73), names = "PAM", verbose = 0)
PAM <- getObs(st, name = "PAM")

pf <- spatialBehaviour(st, product = "Profiles", method = "Holland", asymmetry = "None", verbose = 0)
terra::plot(pf$PAM_Speed_41, main = "Holland (1980)", cex.main = 0.8, range = c(0, 90))
terra::plot(countriesHigh, add = TRUE)
lines(PAM$lon, PAM$lat, lty = 3)
pf <- spatialBehaviour(st, product = "Profiles", method = "Willoughby", asymmetry = "None", verbose = 0)
terra::plot(pf$PAM_Speed_41, main = "Willoughby et al. (2006)", cex.main = 0.8, range = c(0, 90))
terra::plot(countriesHigh, add = TRUE)
lines(PAM$lon, PAM$lat, lty = 3)

pf <- spatialBehaviour(st, product = "Profiles", method = "Holland", asymmetry = "Miyazaki", verbose = 0)
terra::plot(pf$PAM_Speed_41, main = "Holland (1980) + Miyazaki et al. (1962)", cex.main = 0.8, range = c(0, 90))
terra::plot(countriesHigh, add = TRUE)
lines(PAM$lon, PAM$lat, lty = 3)
pf <- spatialBehaviour(st, product = "Profiles", method = "Willoughby", asymmetry = "Miyazaki", verbose = 0)
terra::plot(pf$PAM_Speed_41, main = "Willoughby et al. (2006) + Miyazaki et al. (1962)", cex.main = 0.8, range = c(0, 90))
terra::plot(countriesHigh, add = TRUE)
lines(PAM$lon, PAM$lat, lty = 3)

pf <- spatialBehaviour(st, product = "Profiles", method = "Holland", asymmetry = "Chen", verbose = 0)
terra::plot(pf$PAM_Speed_41, main = "Holland (1980) + Chen (1994)", cex.main = 0.8, range = c(0, 90))
terra::plot(countriesHigh, add = TRUE)
lines(PAM$lon, PAM$lat, lty = 3)
pf <- spatialBehaviour(st, product = "Profiles", method = "Willoughby", asymmetry = "Chen", verbose = 0)
terra::plot(pf$PAM_Speed_41, main = "Willoughby et al. (2006) + Chen (1994)", cex.main = 0.8, range = c(0, 90))
terra::plot(countriesHigh, add = TRUE)
lines(PAM$lon, PAM$lat, lty = 3)

pf <- spatialBehaviour(st, product = "Profiles", method = "Boose", verbose = 0)
terra::plot(pf$PAM_Speed_41, main = "Boose et al. (2004)", cex.main = 0.8, range = c(0, 90))
terra::plot(countriesHigh, add = TRUE)
lines(PAM$lon, PAM$lat, lty = 3)
par(oldpar)

## ----include = FALSE----------------------------------------------------------
par(oldpar)

