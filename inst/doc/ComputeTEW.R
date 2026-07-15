## ----setup, include = FALSE---------------------------------------------------
library(StormR)
library(terra)

## -----------------------------------------------------------------------------
sds <- defStormsDataset()
st <- defStormsList(sds = sds, loi = "Vanuatu", names = "PAM", verbose = 0, maxDist = 50)
plotStorms(st)

## ----connection, eval=FALSE---------------------------------------------------
# library(openeo)
# # connect to the backend and authenticate (an account is requirred)
# connection <- connect(host = "https://openeofed.dataspace.copernicus.eu")
# login()
# 
# # get the process collection to use the predefined processes of the back-end
# p <- processes()
# 
# # define wanted data
# data <- p$load_collection(
#   id = "COPERNICUS_30",
#   spatial_extent = list(
#     west = 168.982086,
#     south = -19.002400,
#     east = 169.348755,
#     north = -18.614363
#   ),
#   bands = c("DEM")
# )
# 
# 
# result <- p$save_result(data = data, format = "GTiff")

## ----save tif file, eval = FALSE----------------------------------------------
# # save the tif file
# compute_result(graph = result, output_file = "../filepath/name.tif")

## -----------------------------------------------------------------------------
dtm <- rast(system.file("extdata","test_datadtm.tif",package = "StormR"))

## -----------------------------------------------------------------------------
spProfiles <- spatialBehaviour(st, product = "Profiles", verbose = 0)
spProfiles

## -----------------------------------------------------------------------------
pf <- computeTEW(spProfiles, st, dtm, product = "TEW", verbose = 0)
pf

## -----------------------------------------------------------------------------
plotTEW(st, pf$PAM_TEW_41, dtm = dtm)

## -----------------------------------------------------------------------------
df <- data.frame(x = c(169.097), y = c(-18.723))
rownames(df) <- c("Forest Plot")
TS <- temporalBehaviour(st, points = df, product = "TS", tempRes = 30, verbose = 0)
pfTemp <- computeTEW(TS, df, dtm, verbose = 0)

## -----------------------------------------------------------------------------
plotTemporalTEW(pfTemp, "PAM")

## -----------------------------------------------------------------------------
ss <- computeTEW(spProfiles, st, dtm, product = c("TEW1wdMax", "TEW1wdMean", "TEWIntegrated"), verbose = 0)
ss

## -----------------------------------------------------------------------------
names(ss)

## -----------------------------------------------------------------------------
plotTEW(st, ss$PAM_TEW1wd_Max, dtm = dtm)

## -----------------------------------------------------------------------------
plotTEW(st, ss$PAM_TEW1wd_Mean, dtm = dtm)

## -----------------------------------------------------------------------------
plotTEW(st, ss$PAM_TEW_Integrated, dtm = dtm)

## -----------------------------------------------------------------------------
plotTEW(st, ss$PAM_TEW_Integrated, dtm = dtm, dynamicPlot = TRUE)

## -----------------------------------------------------------------------------
writeRast(ss$PAM_TEW_Integrated)

## ----include = FALSE----------------------------------------------------------
dtm <- clamp(dtm, lower = 0.001, values = FALSE)
col <- colorRampPalette(c("darkgreen", "yellow", "red"))(100)

## -----------------------------------------------------------------------------
# align msw on dtm
msw <- mask(project(spProfiles[[grep("_Speed", names(spProfiles))]], dtm), dtm)
# normalise
rg <- global(pf, c("min", "max"), na.rm = TRUE)
tew <- (pf - min(rg$min)) / (max(rg$max) - min(rg$min))

## -----------------------------------------------------------------------------
ev <- app(msw * tew, mean, na.rm = TRUE)

## -----------------------------------------------------------------------------
plot(ev, col = col)

