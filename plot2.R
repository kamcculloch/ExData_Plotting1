## Retrieve Data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Create Subset of data for the relevant time frame
SubData2 <- data[data$Date == "1/2/2007"|data$Date == "2/2/2007",]

## Define the columns we're trying to plot
DT <- strptime(paste(SubData2$Date, SubData2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(SubData2$Global_active_power)

## Create plot from subset of data
png("plot2.png", width=480, height=480)
plot(DT, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
