library(dplyr)
# PUlling full data file
fileName="household_power_consumption.txt"
data=read.table(fileName, header=TRUE, stringsAsFactors=FALSE, sep=";", na.strings="?")
# Changing date column from char to date format
data$Date=as.Date(data$Date, format="%d/%m/%Y")
# Subsetting the data by date range
dataSub=filter(data, Date >= as.Date("2007-02-01"), Date < as.Date("2007-02-03")) 
# Creating the plot
hist(dataSub$Global_active_power, main="Global Active Power", xlab="Glolbal Active Power (kwatts)", col="Red")
# Saving the plot in png format
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off
