# Akash Lodha
# Data Science Specialisation Coursera
# Exploratory Data Analysis - Peer Assignment 1
#[1] "Sat Sep  6 12:05:18 2014"

## Getting the Raw Data
## Place the raw data in the raw Data Folder

# If there is no raw data folder create one
if(!file.exists("./rawData")) {
  dir.create("./rawData")
}

# Download the raw dataset to the rawData Folder
if(!file.exists("./rawData/exdata_data_household_power_consumption.zip")) {
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url,method="curl",destfile="./rawData/exdata_data_household_power_consumption.zip")
}

# Extract The zip file
if(!file.exists("./rawData/exdata_data_household_power_consumption")) {
  unzip("./rawData/exdata_data_household_power_consumption.zip",exdir="./rawData")
}

# list.files("./rawData") - to list the files extracted

## Now that the data is obtained, lets process the data 
## We need to take the data for only two dates
## 2007-02-01 and 2007-02-02

# We will need lubridate package for the processing of date
if( "lubridate" %in% rownames(installed.packages()) == F) {
  install.packages("lubridate")
}

library(lubridate)

## In the below code we process the data and write it to data.txt
##If the data.csv is already present no need to do this

if(!file.exists("data.csv")) {
  
    # Lets read few Lines of the dataset first to analys the dataset
    readLines("./rawData/household_power_consumption.txt",n=10)
    #Read the dataset
    data <- read.table("./rawData/household_power_consumption.txt",header=T,sep=";")
    # COnvert the Date column as date data type
    data[,1] <- dmy(data[,1])
    #Take the data for only the two dates
    data <- data[which(data$Date==ymd("2007-02-01") | data$Date==ymd("2007-02-02")),]
    # Now that we have the required data , lets write it as data.csv
    write.csv(data,file="./data.csv")
    data<-NULL
}

