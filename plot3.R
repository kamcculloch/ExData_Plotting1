## Retrieve Data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Create Subset of data for the relevant time frame
SubData3 <- data[data$Date == "1/2/2007"|data$Date == "2/2/2007",]

## Separate out the necessary Columns
DT <- strptime(paste(SubData3$Date, SubData3$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(SubData3$Global_active_power)
S1 <- as.numeric(SubData3$Sub_metering_1)
S2 <- as.numeric(SubData3$Sub_metering_2)
S3 <- as.numeric(SubData3$Sub_metering_3)

## Create plot from subset of data
png("plot3.png", width=480, height=480)

plot(DT, S1, type="l", ylab="Energy Submetering", xlab="")
lines(DT, S2, type="l", col="red")
lines(DT, S3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off() 
