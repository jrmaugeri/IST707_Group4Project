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

setwd('C:/Users/Maugeri/Desktop/IST707')
mushrooms <- read.csv('mushrooms.csv', stringsAsFactors = TRUE)

### Exploring the Data
###############################################################################
# Using summary to get an overview
(summary(mushrooms))
# Using str() to investigate the size
(str(mushrooms))
# using sapply() with levels() to print all levels of the dataframe
M_Levels <- sapply(mushrooms,levels)
(M_Levels)

### Association Rule Mining
###############################################################################
# Lets set a seed to preserve the random numbers used in this instance
set.seed(1337)

# Adding index into the first column of DF
mushrooms <- cbind(ID = rownames(mushrooms), mushrooms)
mushrooms$ID <- factor(mushrooms$ID)
ShroomIDS <- c(mushrooms$ID)
# A copy of the data without an ID for association rule mining
mushrooms_A <- subset(mushrooms, select = -c(ID))

## Testing the Generation of Association Rules
# Mine rules with the apriori algorithm. 
# First look with low support, 80% confidence
mrules <- apriori(mushrooms_A, parameter = list(supp = 0.10, conf = 0.9, maxlen = 5 ))
# Summary to see what is generated initially
summary(mrules)
# Sort the rules by confidence 
mrules <-sort(mrules, by="confidence", decreasing=TRUE)
# Show the top rules, but only 2 digits
options(digits=2)
inspect(mrules[1:10])

## Association Rules for class Edible Mushrooms
# Target class=e on RHS ordered by decreasing support
m_edible_rules <- apriori(mushrooms_A, parameter = list(supp = 0.10, conf = 0.9, maxlen = 5 ), 
                    appearance = list(default="lhs",rhs="class=e"),
                    control = list(verbose=F))
summary(m_edible_rules)
m_edible_rules<-sort(m_edible_rules, decreasing=TRUE,by="support")
inspect(m_edible_rules[1:10])
## Association Rules for class Poisonous Mushrooms
# Target class=p on RHS ordered by decreasing support
m_poisonous_rules <- apriori(mushrooms_A, parameter = list(supp = 0.10, conf = 0.9, maxlen = 5 ), 
                      appearance = list(default="lhs",rhs="class=p"),
                      control = list(verbose=F))
summary(m_poisonous_rules)
m_poisonous_rules<-sort(m_edible_rules, decreasing=TRUE,by="support")
inspect(m_poisonous_rules[1:10])

### Association Rule Mining Visualization section
###############################################################################
# visualization using aruleviz package
# Plotting the top 19 rules 
top20 <- plot(mrules,method="graph",limit=20,interactive=TRUE)
top20
# plotting top 10 rules targeting rhs class=e
MEdibleViz <- plot(m_edible_rules,method="graph",limit=10,interactive=TRUE)
MEdibleViz
# plotting top 10 rules targeting rhs class=p
MEdibleViz <- plot(m_edible_rules,method="graph",limit=10,interactive=TRUE)
MPoisonousViz
