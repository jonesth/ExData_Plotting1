### Plot 2
dataFile <- "household_power_consumption.txt" #names the dataset as dataFile
fullData <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") #reads the dataset into a tabel in R
subSetData <- fullData[fullData$Date %in% c("1/2/2007","2/2/2007"),] #subsets the fullData set into the two days of interest

dateTime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") #pastes the date and time columns together, then converts to a character vector
gloActPwr <- as.numeric(subSetData$Global_active_power) #converts Global_active_power column to a numeric
png("plot2.png", width=480, height=480) #creates an empty png file
plot(dateTime, gloActPwr, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)") #creates plot
dev.off()