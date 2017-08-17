### Plot 4
dataFile <- "household_power_consumption.txt" #names the dataset as dataFile (assumes .txt file is in your root/working directory)
fullData <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") #reads the dataset into a tabel in R
subSetData <- fullData[fullData$Date %in% c("1/2/2007","2/2/2007"),] #subsets the fullData set into the two days of interest

dateTime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") #pastes the date and time columns together, then converts to a character vector

#data for top left plot
gloActPwr <- as.numeric(subSetData$Global_active_power) #converts Global_active_power column to a numeric

#data for bottom left plot
Sub_metering_1 <- as.numeric(subSetData$Sub_metering_1) # Sub_Metering_1 column to a numeric
Sub_metering_2 <- as.numeric(subSetData$Sub_metering_2) # Sub_Metering_2 column to a numeric
Sub_metering_3 <- as.numeric(subSetData$Sub_metering_3) # Sub_Metering_3 column to a numeric

#data for top right plot
voltage <- as.numeric(subSetData$Voltage) #converts Voltage column to a numeric

#data for bottom right plot
gloReaPwr <- as.numeric(subSetData$Global_reactive_power) #converts Global_reactive_power column to a numeric

png("plot4.png", width=480, height=480) #creates an empty png file
par(mfrow = c(2, 2))  # set the parameters of the space = 2 rows and 2 columns

plot(dateTime, gloActPwr, type = "l", xlab = "", ylab = "Global Active Power") #creates top left plot

plot(dateTime, voltage, type = "l", xlab = "datetime", ylab = "Voltage") #creates to right plot

plot(dateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering") #creates bottom left plot
lines(dateTime, Sub_metering_2, type = "l", col = "red") # adds Sub_metering_2 to the plot
lines(dateTime, Sub_metering_3, type = "l", col = "blue") # adds Sub_metering_3 to the plot
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.8) # adds legend to the plot

plot(dateTime, gloReaPwr, type = "l", xlab = "datetime", ylab = "Global_reactive_power") #creates bottom right plot

dev.off()