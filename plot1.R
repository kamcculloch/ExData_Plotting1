## Retrieve Data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Create Subset of data for the relevant time frame and 
SubData <- as.numeric(data[data$Date == "1/2/2007"|data$Date == "2/2/2007",3])

## Create plot from subset of data
png("plot1.png", width=480, height=480)
hist(SubData, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
