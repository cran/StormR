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
TS <- temporalBehaviour(st, points = df, product = "TS", tempRes = 0.5, verbose = 0)

## -----------------------------------------------------------------------------
str(TS)

## ----include = FALSE----------------------------------------------------------
oldpar <- par(mar = c(10, 4, 4, 2))

## -----------------------------------------------------------------------------
plot(TS$PAM$Port_Vila$speed, type = "l", ylim = c(0, 60), xlab = "", ylab = "Wind speed (m/s)", axes = FALSE, col = "blue")
points(TS$PAM$Port_Vila$speed, col = "blue", pch = 3)
lines(TS$PAM$Luganville$speed, col = "red")
points(TS$PAM$Luganville$speed, col = "red", pch = 3)
legend("topleft", pch = 3, col = c("blue", "red"), legend = c("Port Vila", "Luganville"), bty = "n")
axis(1, at = seq(1, length(TS$PAM$Port_Vila$speed)), labels = TS$PAM$Port_Vila$isoTimes, las = 2)
axis(2, at = seq(0, 60, 10), labels = seq(0, 60, 10), las = 2)

## ----include = FALSE----------------------------------------------------------
dev.off()

## -----------------------------------------------------------------------------
plot(TS$PAM$Port_Vila$direction, type = "l", ylim = c(0, 360), xlab = "", ylab = "Wind direction (degree north)", axes = FALSE, col = "blue")
points(TS$PAM$Port_Vila$direction, col = "blue", pch = 3)
lines(TS$PAM$Luganville$direction, col = "red")
points(TS$PAM$Luganville$direction, col = "red", pch = 3)
legend("topleft", pch = 3, col = c("blue", "red"), legend = c("Port Vila", "Luganville"), bty = "n")
axis(1, at = seq(1, length(TS$PAM$Port_Vila$speed)), labels = TS$PAM$Port_Vila$isoTimes, las = 2)
axis(2, at = seq(0, 360, 90), labels = seq(0, 360, 90), las = 2)

## ----include = FALSE----------------------------------------------------------
par(oldpar)
dev.off()

## -----------------------------------------------------------------------------
max(TS$PAM$Port_Vila$speed, na.rm = TRUE)
max(TS$PAM$Luganville$speed, na.rm = TRUE)

## -----------------------------------------------------------------------------
PDI <- temporalBehaviour(st, points = df, product = "PDI", tempRes = 0.5, verbose = 0)
PDI

## -----------------------------------------------------------------------------
exposure_SS <- temporalBehaviour(st, points = df, product = "Exposure", tempRes = 0.5, verbose = 0)
exposure_SS

## -----------------------------------------------------------------------------
wt <- c(17.2, 24.4, 32.5, 44.2, 55.0)
exposure_BOM <- temporalBehaviour(st, points = df, product = "Exposure", tempRes = 0.5, windThreshold = wt, verbose = 0)
exposure_BOM

