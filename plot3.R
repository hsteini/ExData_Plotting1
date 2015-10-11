
## import data household_power_consumption.txt
data <- read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?",""))
str(data)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
str(data$Date)
data$timetemp <- paste(data$Date, data$Time) 
head(data$timetemp)
data$Time <- strptime(data$timetemp, format = "%Y-%m-%d %H:%M:%S") 
str(data)
data <- data[, 1:9]
str(data)
data1 <- data
data2 <- subset(data1, Date > as.Date("2007-01-31"))
data3 <- subset(data2, Date < as.Date("2007-02-03"))
str(data3)

## Draw plot 3
plot(data3$Time, data3$Sub_metering_1, type="n", xlab = "",
     ylab ="Energy sub metering", main= "Plot 3", adj=0, pch=1)
legend("topright", pch =1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
lines(data3$Time, data3$Sub_metering_1, col="black")
lines(data3$Time, data3$Sub_metering_2, col="red")
lines(data3$Time, data3$Sub_metering_3, col="blue")

## save graphic plot3.png with a width and height of 480 pixels
dev.copy(png, file="plot3.png", width = 480, height = 480)
dev.off()