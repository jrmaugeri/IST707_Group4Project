### FILE INFO
###############################################################################
# Author: Group 4 ( Joseph Maugeri, Yu Sheng Lu , Jonathan Xi)
# Class: IST 707
# Week: 6
# Activity: Mushroom R data 
# Purpose: Perform some exploratory analysis of the mushroom dataset,
# Prepare the data for several data mining techniques
#
### PACKAGES
###############################################################################
# ONCE install.packages('quanteda')
library(quanteda)
## ONCE: install.packages("tm")
library(tm) # Needed 
# ONCE install.packages("textstem")
library(textstem)  ## Needed for lemmatize_strings
# ONCE install.packages("stringr")
library(stringr)
# ONCE install.packages("stringi")
library(stringi)
## ONCE: install.packages("slam")
library(slam)
##ONCE: install.packages('proxy')
library(proxy)
##ONCE: install.packages('Matrix')
library(Matrix) # Used to create document - term matrices
##ONCE: install.packages('tidytext')
library(tidytext) # convert DTM to DF
# ONCE install.packages("plyr")
library(plyr) ## for adply
# ONCE install.packages("ggplot2")
library(ggplot2)
# ONCE install.packages("wordcloud")
library(wordcloud)
# ONCE install.packages("rpart")
library(rpart)
# ONCE install.packages("rattle")
library(rattle)
# ONCE install.packages("rpart.plot")
library(rpart.plot)
# ONCE install.packages("RColorBrewer")
library(RColorBrewer)
# ONCE install.packages("Cairo")
library(Cairo)
# ONCE install.packages("network")
library(network)
##ONCE: install.packages('proxy')
library(proxy)
## ONCE:  install.packages("stringr")
library(stringr)
## ONCE: install.packages("textmineR")
library(textmineR)
## ONCE: install.packages("igraph")
library(igraph)
## ONCE: install.packages("lsa")
library(lsa)

# Libraries for Association Rule Mining
## ONCE: install.packages("arules")
library(arules)
## ONCE: install.packages("arulesViz")
library(arulesViz)
## ONCE: install.packages("datasets")
library(datasets)



### Reading in the data
###############################################################################

#setwd('C:/Users/Maugeri/Desktop/IST707')
mushrooms <- read.csv('mushrooms.csv', stringsAsFactors = TRUE)
