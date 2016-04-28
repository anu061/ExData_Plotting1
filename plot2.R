###############################################################################
##
# Author: AK
# 
# Exploratory Data Anaysis Assignment: Course Project 1 
# 
# This assignment uses the "Individual household electric power consumption" 
# data set from the UC Irvine Machine Learning Repository. 
# 
# Plot2: Global active power (kilowatts) over a 2-day period
##
###############################################################################


## Read household_power_consumption data
powdata <- read.table("data//household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
str(powdata) ##Date in format dd/mm/yyyy

## change class of Date variable
powdata$Date <- as.Date(powdata$Date, format="%d/%m/%Y")
str(powdata)

## retrieve subset of observations for specified dates
date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")

powdata2 <- subset(powdata, Date == date1 | Date == date2)
str(powdata2)

rm(powdata, date1, date2) ## remove unncessary data

x <- paste(powdata2$Date, powdata2$Time)
powdata2$timestamp <- strptime(x, "%Y-%m-%d %H:%M:%S")


##  plot "Global_active_power (kilowatts)" over the specified 2-day period
png(file = "plot2.png")
plot(powdata2$timestamp,powdata2$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
dev.off()


