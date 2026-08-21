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
 

## ----installation, eval=FALSE-------------------------------------------------
# # Option 1: Download the stable version from CRAN
# install.packages("PhysMove")
# 
# # Option 2: Download the development version from GitHub
# install.packages("devtools")
# devtools::install_github("HannahCalich/PhysMove", build_vignettes = TRUE)

## ----load physmove------------------------------------------------------------
# Load PhysMove
library(PhysMove)

## ----check_tracks, eval=FALSE-------------------------------------------------
# # Check your data are formatted correctly
# checkTracks(tracks) # replace 'tracks' with your data frame

## ----head tracks--------------------------------------------------------------
# Preview the first 6 rows of the 'tracks' dataset
head(tracks)

## ----structure tracks---------------------------------------------------------
# Determine the structure of the 'tracks' dataset
str(tracks)

## ----plot_tracks, message=FALSE-----------------------------------------------
plotTracks(tracks)

