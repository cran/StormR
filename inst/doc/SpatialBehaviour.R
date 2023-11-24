## ----setup, include = FALSE---------------------------------------------------
library(StormR)

## -----------------------------------------------------------------------------
sds <- defStormsDataset()
st <- defStormsList(sds = sds, loi = "Vanuatu", names = "PAM", verbose = 0)
plotStorms(st)

## -----------------------------------------------------------------------------
pf <- spatialBehaviour(st, product = "Profiles", verbose = 0)
pf

## -----------------------------------------------------------------------------
plotBehaviour(st, pf$PAM_Speed_41)
plotBehaviour(st, pf$PAM_Direction_41)

## -----------------------------------------------------------------------------
ss <- spatialBehaviour(st, product = c("MSW", "PDI", "Exposure"), verbose = 0)
ss

## -----------------------------------------------------------------------------
names(ss)

## -----------------------------------------------------------------------------
plotBehaviour(st, ss$PAM_MSW)

## -----------------------------------------------------------------------------
plotBehaviour(st, ss$PAM_PDI)

## -----------------------------------------------------------------------------
plotBehaviour(st, ss$PAM_Exposure_58)

## -----------------------------------------------------------------------------
ss <- spatialBehaviour(st, product = c("MSW"), verbose = 0, spaceRes = "10min", tempRes = 0.5)
plotBehaviour(st, ss$PAM_MSW)

## -----------------------------------------------------------------------------
writeRast(ss$PAM_MSW)

