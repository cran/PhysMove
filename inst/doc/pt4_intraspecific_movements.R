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

## ----load physmove intraspecific vignette, echo=FALSE-------------------------
# Load PhysMove
library(PhysMove)

## ----gyrad, message=FALSE-----------------------------------------------------
# Calculate the dispersion of each track in the 'tracks' dataset
GR <- gyrationRad(tracks)

## ----preview gyrad------------------------------------------------------------
# Summarize gyration radius results
summary(GR)

## ----gyrad pdf----------------------------------------------------------------
# Create a pdf plot of gyration radius values
pdf.gr <- plotPDF((GR$`rG_(km)`), desc="gyrationRad")

## ----ent----------------------------------------------------------------------
# Calculate track entropy using default parameters
Ent <- entropy(tracks)

## ----ent head-----------------------------------------------------------------
# Summarise entropy results
summary(Ent)

## ----ent pdf------------------------------------------------------------------
# Create a pdf plot of the entropy scores
pdf.ent <- plotPDF(Ent$normalisedEntropy, desc="entropy")

## ----predict------------------------------------------------------------------
# Track predictability using predictability() default parameters and the output from entropy()
Pred <- predictability(tracks, Ent)

## ----predict head-------------------------------------------------------------
# Summarize predictability scores
summary(Pred)

## ----predict pdf--------------------------------------------------------------
# Create a pdf plot of the predictability scores
pdf.pred <- plotPDF(Pred$predictability, desc="predictability")

