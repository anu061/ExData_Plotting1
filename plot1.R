###############################################################################
##
# Author: AK
# 
# Exploratory Data Anaysis Assignment: Course Project 1 
# 
# This assignment uses the "Individual household electric power consumption" 
# data set from the UC Irvine Machine Learning Repository. 
# 
# Plot1: Frequency of Global Active Power
##
###############################################################################


## Read household_power_consumption data
powdata <- read.table("data//household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
str(powdata)

## change class of Date variable
powdata$Date <- as.Date(powdata$Date, format="%d/%m/%Y")
str(powdata)

## retrieve subset of observations for specified dates
date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")

powdata2 <- subset(powdata, Date == date1 | Date == date2)
str(powdata2)

rm(powdata,date1,date2) ## remove unncessary data


## Histogram plot of "Global_active_power (kilowatts)"
png(file = "plot1.png")
hist(powdata2$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off()


