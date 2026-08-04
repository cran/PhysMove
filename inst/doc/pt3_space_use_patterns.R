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

## ----load physmove space-use vignette, echo=FALSE-----------------------------
# Load PhysMove
library(PhysMove)

## ----run infomap, eval=FALSE--------------------------------------------------
# # Identify community-wide movements
# infomapResult <- infomapCommunities(tracks)

## ----load example data, include=FALSE-----------------------------------------
# Load example dataset included in the package
data("infomapResult", package = "PhysMove")

## ----structure of infomap-----------------------------------------------------
# View the Infomap monolayer object structure
str(infomapResult[["infomap_object"]])

## ----infomap map, message=FALSE-----------------------------------------------
# Create a map of the Infomap communities
communityMap(infomapResult)

## ----calc occ, message=FALSE--------------------------------------------------
# Create an occupancy map based on the tracks dataset
occ <- occupancy(tracks)

## ----summarise occ------------------------------------------------------------
# Summarize occupancy results
summary(occ) 

## ----pdf occ------------------------------------------------------------------
# Create a pdf plot of occupancy values
pdf.occ  <- plotPDF(occ$Occupancy, desc="occupancy")

