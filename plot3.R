### Plot 3
dataFile <- "household_power_consumption.txt" #names the dataset as dataFile
fullData <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") #reads the dataset into a tabel in R
subSetData <- fullData[fullData$Date %in% c("1/2/2007","2/2/2007"),] #subsets the fullData set into the two days of interest

dateTime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") #pastes the date and time columns together, then converts to a character vector
Sub_metering_1 <- as.numeric(subSetData$Sub_metering_1) # Sub_Metering_1 column to a numeric
Sub_metering_2 <- as.numeric(subSetData$Sub_metering_2) # Sub_Metering_2 column to a numeric
Sub_metering_3 <- as.numeric(subSetData$Sub_metering_3) # Sub_Metering_3 column to a numeric
png("plot3.png", width=480, height=480) #creates an empty png file
plot(dateTime, Sub_metering_1, type = "n") # creates an empty plot
plot(dateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering") #creates plot
points(dateTime, Sub_metering_2, type = "l", col = "red") # adds Sub_metering_2 to the plot
points(dateTime, Sub_metering_3, type = "l", col = "blue") # adds Sub_metering_3 to the plot
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) # adds legend to the plot

dev.off()