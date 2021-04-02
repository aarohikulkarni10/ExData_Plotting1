#PLOT1 R CODE 

#Input data from txt file 
datatxt <- "./household_power_consumption.txt"
data <- read.table(datatxt, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#Extraction of only the required subset
RequiredData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
GlobalActivePower <- as.numeric(RequiredData$Global_active_power)
#png and pixels defined 
png("plot1.png", width=480, height=480)
#Histogram
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
#Shutting down the specified device
dev.off()

