library(dplyr)
# Pulling full data file
fileName="household_power_consumption.txt"
data=read.table(fileName, header=TRUE, stringsAsFactors=FALSE, sep=";", na.strings="?")
# Changing date column from char to date format
data$Date=as.Date(data$Date, format="%d/%m/%Y")
# Subsetting the data by date range
# Had to combine the time, would only plot as two columns without a time continous range.
# Wonder if, instead of paste0/POSIX could have x axis plot (data$Date & data$Time) or something similar?
dataSub=filter(data, Date >= as.Date("2007-02-01"), Date <= as.Date("2007-02-02")) 
dateTime=paste0(as.Date(dataSub$Date), dataSub$Time)
dataSub$DateTime=as.POSIXct(dateTime)
# Creating the plot
plot(dataSub$Global_active_power~dataSub$DateTime, type="l", ylab="Global Active Power (kwatts)", xlab="Days")
# Saving the plot in png format
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off
