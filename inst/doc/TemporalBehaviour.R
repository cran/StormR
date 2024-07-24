## ----setup, include = FALSE---------------------------------------------------
library(StormR)

## -----------------------------------------------------------------------------
df <- data.frame(x = c(168.33, 167.17), y = c(-17.73, -15.53))
rownames(df) <- c("Port_Vila", "Luganville")

## -----------------------------------------------------------------------------
sds <- defStormsDataset()
st <- defStormsList(sds = sds, loi = "Vanuatu", names = "PAM", verbose = 0)
plotStorms(st)
points(df$x, df$y, pch = 3, col = c("blue", "red"))
text(df$x, df$y, labels = c("Port Vila", "Luganville"), pos = 2, col = c("blue", "red"), cex = 0.8)

## -----------------------------------------------------------------------------
TS <- temporalBehaviour(st, points = df, product = "TS", tempRes = 30, verbose = 0)

## -----------------------------------------------------------------------------
str(TS)

## ----include = FALSE----------------------------------------------------------
oldpar <- par(mar = c(10, 4, 4, 2))

## -----------------------------------------------------------------------------
plotTemporal(data=TS, storm="PAM")

## ----include = FALSE----------------------------------------------------------
dev.off()

## -----------------------------------------------------------------------------
plotTemporal(data=TS, storm="PAM", var='direction')

## ----include = FALSE----------------------------------------------------------
par(oldpar)
dev.off()

## -----------------------------------------------------------------------------
max(TS$PAM$Port_Vila$speed, na.rm = TRUE)
max(TS$PAM$Luganville$speed, na.rm = TRUE)

## -----------------------------------------------------------------------------
PDI <- temporalBehaviour(st, points = df, product = "PDI", tempRes = 30, verbose = 0)
PDI

## -----------------------------------------------------------------------------
exposure_SS <- temporalBehaviour(st, points = df, product = "Exposure", tempRes = 30, verbose = 0)
exposure_SS

## -----------------------------------------------------------------------------
wt <- c(17.2, 24.4, 32.5, 44.2, 55.0)
exposure_BOM <- temporalBehaviour(st, points = df, product = "Exposure", tempRes = 30, windThreshold = wt, verbose = 0)
exposure_BOM

