###############################################################################
##
# Author: AK
# 
# Exploratory Data Anaysis Assignment: Course Project 1 
# 
# This assignment uses the "Individual household electric power consumption" 
# data set from the UC Irvine Machine Learning Repository. 
# 
# Plot4: One plot each for Global Active Power, Energy sub metering, Voltage 
# and Global Reactive Power data over the specified 2-day period# 
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


# Plot Global Active Power, Energy sub metering, Voltage and 
# Global Reactive Power data over the specified 2-day period
# 
png(file = "plot4.png")
par(mfcol = c(2,2))

## plot1
plot(powdata2$timestamp,powdata2$Global_active_power, ylab = "Global Active Power", xlab ="", type = "l")

## plot2
plot(powdata2$timestamp,powdata2$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")
lines(powdata2$timestamp,powdata2$Sub_metering_2, col = "red")
lines(powdata2$timestamp,powdata2$Sub_metering_3, col = "blue")
# Add a legend
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=1.75, col = c("black", "red", "blue"), bty = "n")

##plot3
plot(powdata2$timestamp,powdata2$Voltage, ylab = "Voltage", xlab ="datetime", type = "l")

##plot4
plot(powdata2$timestamp,powdata2$Global_reactive_power, ylab = "Global_reactive_power", xlab ="datetime", type = "l")

dev.off()


