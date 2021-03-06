### Plot 1
dataFile <- "household_power_consumption.txt" #names the dataset as dataFile (assumes .txt file is in your root/working directory)
fullData <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")  #reads the dataset into a tabel in R
subSetData <- fullData[fullData$Date %in% c("1/2/2007","2/2/2007"),]  #subsets the fullData set into the two days of interest

gloActPwr <- as.numeric(subSetData$Global_active_power) #converts Global_active_power column to a numeric

png("plot1.png", width = 480, height = 480) #creates an empty png file

hist(gloActPwr, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red", main = "Global Active Power") #creates historgram
dev.off()