# Akash Lodha
# Data Science Specialisation Coursera
# Exploratory Data Analysis - Peer Assignment 1
#[1] "Sat Sep  6 12:05:18 2014"

## plot2.R

##Getting and Processing the data
##Creating a final data set for this peer assignment has been done in
## dataProcess.R R script
source("./dataProcess.R") # This has all the code for getting the data needed
## The required data is saved in data.csv

# Read the data
data <- read.csv("./data.csv")[,c(-1)]
data["TimeDate"] <- ymd_hms(paste(data[,1],paste(data[,2])))

with(data, plot(Global_active_power ~ data$TimeDate,lwd=1,type="l",ylab="Global Active Power (kilowatts)",xlab=""))

dev.copy(png,"./plot2.png",height=480,width=480)
dev.off()
data<-NULL