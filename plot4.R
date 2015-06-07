library(dplyr)
# Pulling full data file
fileName="household_power_consumption.txt"
data=read.table(fileName, header=TRUE, stringsAsFactors=FALSE, sep=";", na.strings="?")
# Changing date column from char to date format
data$Date=as.Date(data$Date, format="%d/%m/%Y")
# Subsetting the data by date range
dataSub=filter(data, Date >= as.Date("2007-02-01"), Date <= as.Date("2007-02-02")) 
# Need to link date and time together to have contiuous timeframe
dateTime=paste0(as.Date(dataSub$Date), dataSub$Time)
dataSub$DateTime=as.POSIXct(dateTime)
# Creating the plot
# Keep having issues where the plot doesn't get created but after I reboot the exact same code I ran previously
# creates the plot correctly.  Not sure what's going on, maybe a Windows issue?
par(mfrow=c(2,2))
plot(dataSub$Global_active_power~dataSub$DateTime, type="l", ylab="Global Active Power (kwatts)", xlab="Days")

plot(dataSub$Voltage~dataSub$DateTime,type="l", ylab="Voltage", xlab="datetime")

plot(dataSub$Sub_metering_1~dataSub$DateTime, type="l", ylab="Energy sub metering", xlab="Days")
lines(dataSub$Sub_metering_2~dataSub$DateTime, col="Red")
lines(dataSub$Sub_metering_3~dataSub$DateTime, col="Blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("Black", "Red", "Blue"))

plot(dataSub$Global_reactive_power~dataSub$DateTime,type="l", ylab="Global_reactive_power", xlab="datetime")
# Saving the plot in png format
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off
