## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(dev = "png",
                    dpi = 120,                             
                    fig.width = 5,                        
                    fig.height = 4,
                    out.width = "70%",                    
                    fig.align = "center",
                    echo = TRUE,
                    collapse = TRUE,
                    comment = "#>")

## ----load physmove movement vignette, echo=FALSE------------------------------
# Load PhysMove
library(PhysMove)

## ----calculate_rms------------------------------------------------------------
# Calculate RMS values with default parameters
rms.result <- rms(tracks)

## ----summarise rms results----------------------------------------------------
# Summarise RMS results
summary(rms.result[["rmsResults"]])

# Summarise linear model results and identify the scaling exponent 
RMSlinearModel <- rms.result[["lm"]]
print(RMSlinearModel)

# Determine the scaling exponent 
RMSlinearModel$estimate[2]

## ----calc disp, eval=FALSE----------------------------------------------------
# # Calculate displacements with default parameters
# dispAll <- calcDisp(tracks)
# 
# # [1] "15598 displacements in 24 +/- 6 hour(s)"
# # [1] "15573 displacements in 48 +/- 6 hour(s)"
# # [1] "15548 displacements in 72 +/- 6 hour(s)"
# # [1] "15523 displacements in 96 +/- 6 hour(s)"
# # [1] "15498 displacements in 120 +/- 6 hour(s)"
# # [1] "15473 displacements in 144 +/- 6 hour(s)"
# # [1] "15448 displacements in 168 +/- 6 hour(s)"
# # [1] "15423 displacements in 192 +/- 6 hour(s)"
# # [1] "15398 displacements in 216 +/- 6 hour(s)"
# # [1] "15373 displacements in 240 +/- 6 hour(s)"

## ----load example disp data, include=FALSE------------------------------------
# Load example dataset included in the package
data("dispAll", package = "PhysMove")

## ----sum disp all-------------------------------------------------------------
# Summarise displacements calculated over the first time window (24 ± 6 hrs)
summary(unlist(dispAll[[1]]))

## ----plot all norm disp-------------------------------------------------------
# Create a probability density function (pdf) plot of normalised 
# displacements
plot.data <- plotDispPDF(dispAll)

## ----plot all disp (not norm)-------------------------------------------------
# Create a probability density function (pdf) plot of raw (i.e., not 
# normalised) displacements
plot.data.norm <- plotDispPDF(dispAll, normalise=FALSE)

## ----calc disp over 24 hours--------------------------------------------------
# Calculate displacements over 24 ± 6 hours
disp <- calcDisp(tracks, max_hr=24)

# Summarise displacements
summary(unlist(disp))

# Plot displacements (as displacements were only calculated over one time window they do not need to be normalised)
plot.data.pdf <- plotDispPDF(disp, normalise=FALSE)

## ----fit full dist------------------------------------------------------------
# Fit all distributions to the full range of displacement data 
distResults <- fitDist(disp, full=TRUE, normalise=FALSE) 

distResults[["distResults"]]

## ----plot full dist-----------------------------------------------------------
# Create a ccdf plot of displacements with fit lines illustrating 
# distributions fit to the full range of displacements
plot.data.all.pdf <- plotDist(disp, distResults, label="Displacements (km)")

## ----comp dist fits-----------------------------------------------------------
# Identify the best-fit distribution for the full range of displacement data
compResults <- compDist(disp, distResults)
compResults

## ----load example dispTrunc data, include=FALSE-------------------------------
data("distResultsTrunc", package = "PhysMove")

## ----find best-fit dmin for each dist, eval=FALSE-----------------------------
# # Fit all distributions and identify the best-fit dmin for each distribution
# distResultsTrunc <- fitDist(disp, full=FALSE, normalise=FALSE)

## ----print dist results trunc-------------------------------------------------
print(distResultsTrunc[["distResults"]])

## ----plot trunc dist----------------------------------------------------------
# Create a ccdf plot of displacements with fit lines illustrating 
# distributions fit to the best-fit dmin for each distribution
plot.data.all.trunc <- plotDist(disp, distResultsTrunc, label="Displacements (km)")

## ----fit dist with pl---------------------------------------------------------
# Fit all distributions using the dmin value for the 
# power-law distribution
dmin <- distResultsTrunc[["distResults"]][1,2]
distResultsPl <- fitDist(disp, set_dmin=dmin, normalise=FALSE)

## ----fit dist with exp--------------------------------------------------------
# Fit all distributions using the dmin value for the 
# exponential distribution
dmin <- distResultsTrunc[["distResults"]][2,2]
distResultsExp <- fitDist(disp, set_dmin=dmin, normalise=FALSE)

## ----fit dist with lnorm------------------------------------------------------
# Fit all distributions using the dmin value for the 
# lognormal distribution
dmin <- distResultsTrunc[["distResults"]][3,2]
distResultsLnorm <- fitDist(disp, set_dmin=dmin, normalise=FALSE)

## ----comp pl------------------------------------------------------------------
# Compare distribution fits based on the best-fit dmin value for the power-law distribution
compResultsPl <- compDist(disp, distResultsPl)
compResultsPl

## ----comp exp-----------------------------------------------------------------
# Compare distribution fits based on the best-fit dmin value for the exponential distribution
compResultsExp <- compDist(disp, distResultsExp)
compResultsExp

## ----comp lnorm---------------------------------------------------------------
# Compare distribution fits based on the best-fit dmin value for the lognormal distribution
compResultsLnorm <- compDist(disp, distResultsLnorm)
compResultsLnorm

## ----randomise tracks---------------------------------------------------------
# randomise() involves random number selection, so setting a seed enables the replication of results
set.seed(1)

# Randomise tracks from the 'tracks' dataset with default parameters
randomise.result <- randomise(tracks)

## ----view random results------------------------------------------------------
# Summarise RMS results
summary(randomise.result[["resultsDF"]])

# Determine the slope of the linear model
RandomiselinearModel <- randomise.result[["lm"]]
print(RandomiselinearModel)

# Determine the slope without displaying the full linear model summary
RandomiselinearModel$estimate[2]

## ----plot random tracks-------------------------------------------------------
# Plot random tracks for 'tracks' dataset reference ID 1
plot.data.random.tracks <- plotRandomTracks(tracks, ref=1, randomise.result)

## ----load example angle data, include=FALSE-----------------------------------
data("angleListAll", package = "PhysMove")

## ----calc turn angles, eval=FALSE---------------------------------------------
# # Calculate turning angles in the 'tracks' dataset using default parameters
# angleListAll <- turningAngles(tracks)
# 
# # [1] "15573 angles in 24 +/- 6 hour(s)"
# # [1] "15523 angles in 48 +/- 6 hour(s)"
# # [1] "15473 angles in 72 +/- 6 hour(s)"
# # [1] "15423 angles in 96 +/- 6 hour(s)"
# # [1] "15373 angles in 120 +/- 6 hour(s)"
# # [1] "15323 angles in 144 +/- 6 hour(s)"
# # [1] "15273 angles in 168 +/- 6 hour(s)"
# # [1] "15223 angles in 192 +/- 6 hour(s)"
# # [1] "15173 angles in 216 +/- 6 hour(s)"
# # [1] "15123 angles in 240 +/- 6 hour(s)"

## ----plot histogram from turningAngles, echo=FALSE----------------------------
# Histogram of all angles combined - directly from turningAngles code
  bins <- 360 / 45    
  angleListAll <- angleListAll[lengths(angleList)>0]
  angles.df <- as.data.frame(unlist(angleListAll))
  names(angles.df) <- "Angles"
  h <- graphics::hist(angles.df$Angles, plot = FALSE, breaks = seq(-180, 180, bins)) # Plot all angles for all time periods from all individuals
  xlabels <- c("-180", "", "-120",  "",  "-60",  "",  "0", "",  "60", "", "120",  "",  "180")
  hist_plot <- ggplot2::ggplot(angles.df, ggplot2::aes(.data$Angles))+
    ggplot2::geom_histogram(breaks=h$breaks, color="black", fill="darkgrey")+
    ggplot2::scale_x_continuous("Turning Angles", breaks=seq(-180,180,30), labels=xlabels)+
    ggplot2::labs(y="Frequency")+
    ggplot2::theme_classic(base_size=12)
  plot(hist_plot)

## ----summarise turning angles-------------------------------------------------
# Summarise turning angles calculated over the first time window 
summary(angleListAll[[1]])

## ----plot angles with a circle plot-------------------------------------------
# Plot angles with a circle plot
plot.data.angles <- plotAngles(angleListAll)

