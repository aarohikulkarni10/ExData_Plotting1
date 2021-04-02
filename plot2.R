#PLOT2 R CODE 

#Input data from txt file 
datatxt <- "./household_power_consumption.txt"
data <- read.table(datatxt, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#Extraction of only the required subset
RequiredData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(RequiredData$Date, RequiredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(RequiredData$Global_active_power)
#png and pixels defined 
png("plot2.png", width=480, height=480)
#plot
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#Shutting down the specified device
dev.off()
