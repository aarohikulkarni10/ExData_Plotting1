#PLOT4 R CODE 

#Input data from txt file 
datatxt <- "./household_power_consumption.txt"
data <- read.table(datatxt, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#Extraction of only the required subset
RequiredData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(RequiredData$Date, RequiredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(RequiredData$Global_active_power)
GlobalReactivePower <- as.numeric(RequiredData$Global_reactive_power)
voltage <- as.numeric(RequiredData$Voltage)
Sub_Metering1 <- as.numeric(RequiredData$Sub_metering_1)
Sub_Metering2 <- as.numeric(RequiredData$Sub_metering_2)
Sub_Metering3 <- as.numeric(RequiredData$Sub_metering_3)
#png and pixels
png("plot4.png", width=480, height=480)
#Defining kind of graph and legend
par(mfrow = c(2, 2)) 
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, Sub_Metering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Sub_Metering2, type="l", col="red")
lines(datetime, Sub_Metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
#Shutting down the specified device
dev.off()
