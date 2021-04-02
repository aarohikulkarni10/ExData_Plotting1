  
#PLOT3 R CODE 

#Input data from txt file 
datatxt <- "./household_power_consumption.txt"
data <- read.table(datatxt, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#Extraction of only the required subset
RequiredData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(RequiredData$Global_active_power)
Sub_Metering1 <- as.numeric(RequiredData$Sub_metering_1)
Sub_Metering2 <- as.numeric(RequiredData$Sub_metering_2)
Sub_Metering3 <- as.numeric(RequiredData$Sub_metering_3)
#png and pixels
png("plot3.png", width=480, height=480)
#defining the kind of graph to be plotted
plot(datetime, Sub_Metering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Sub_Metering2, type="l", col="red")
lines(datetime, Sub_Metering3, type="l", col="blue")
#defining legend 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
#Shutting down the specified device
dev.off()
