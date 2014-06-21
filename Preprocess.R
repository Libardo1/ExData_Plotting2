#Exploratory Data Analisis Peer 2 Project
#Preprocess.R
setwd("F:/2014/Coursera/Data Science/EDA/Week 3/Peer2/Peer2_Submission") #my wd

# read RDS files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Required libraries
library(grDevices)
library(reshape2)
library(ggplot2)
library(plyr)
#end Preprocess