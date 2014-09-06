# Akash Lodha
# Data Science Specialisation Coursera
# Exploratory Data Analysis - Peer Assignment 1
#[1] "Sat Sep  6 12:05:18 2014"

## plot3.R

##Getting and Processing the data
##Creating a final data set for this peer assignment has been done in
## dataProcess.R R script
source("./dataProcess.R") # This has all the code for getting the data needed
## The required data is saved in data.csv

# Read the data
data <- read.csv("./data.csv")[,c(-1)]
# We need to merge the time and data columns
data["TimeDate"] <- ymd_hms(paste(data[,1],paste(data[,2])))

with(data, plot(Sub_metering_1 ~ data$TimeDate,type="l",xlab="",ylab="Energy sub metering"))
with(data, lines(Sub_metering_2 ~ data$TimeDate,type="l",col="Red"))
with(data, lines(Sub_metering_3 ~ data$TimeDate,type="l",col="Blue"))
legend("topright",lty=1,col=c("Black","Red","Blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Write the plot to png file
dev.copy(png,"./plot3.png",height=480,width=480)
dev.off()
data<-NULL