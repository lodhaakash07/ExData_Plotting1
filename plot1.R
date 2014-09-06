# Akash Lodha
# Data Science Specialisation Coursera
# Exploratory Data Analysis - Peer Assignment 1
#[1] "Sat Sep  6 12:05:18 2014"

## plot1.R

##Getting and Processing the data
##Creating a final data set for this peer assignment has been done in
## dataProcess.R R script
source("./dataProcess.R") # This has all the code for getting the data needed
## The required data is saved in data.csv

# Read the data
data <- read.csv("./data.csv")
with(data, hist(Global_active_power,col="Red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power"))
dev.copy(png,"./plot1.png",height=480,width=480)
dev.off()
data<-NULL