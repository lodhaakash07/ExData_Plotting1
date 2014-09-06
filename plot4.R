# Akash Lodha
# Data Science Specialisation Coursera
# Exploratory Data Analysis - Peer Assignment 1
#[1] "Sat Sep  6 12:05:18 2014"

## plot4.R

##Getting and Processing the data
##Creating a final data set for this peer assignment has been done in
## dataProcess.R R script
source("./dataProcess.R") # This has all the code for getting the data needed
## The required data is saved in data.txt

# Read the data
data <- read.csv("./data.csv")[,c(-1)]
# We need to merge the time and data columns
data["TimeDate"] <- ymd_hms(paste(data[,1],paste(data[,2])))

## Set global parameter to have 4 plots
par(mfrow=c(2,2),mar=c(4,4,2,2))

# First plot
with(data, plot(Global_active_power ~ data$TimeDate,lwd=1,type="l",ylab="Global Active Power",xlab=""))
# Second Plot
with(data, plot(Voltage ~ TimeDate,lwd=1,type="l",ylab="Voltage",xlab="datetime"))
# Third plot
with(data, plot(Sub_metering_1 ~ TimeDate,type="l",xlab="",ylab="Energy sub metering"))
with(data, lines(Sub_metering_2 ~ TimeDate,type="l",col="Red"))
with(data, lines(Sub_metering_3 ~ TimeDate,type="l",col="Blue"))
legend("topright",lty=1,col=c("Black","Red","Blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
# Fourth plot
with(data, plot(Global_reactive_power ~ TimeDate,lwd=1,type="l",ylab="Global_reactive_Power",xlab="datetime"))

#Write the plot to png file
dev.copy(png,"./plot4.png",height=480,width=480)
dev.off()
