
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

## Draw plot 4
par(mfrow=c(2,2))
main= "Plot 4", adj=0
with(data3, {
    plot(data3$Time, data3$Global_active_power,
         type="l",
         col="black",
         lwd=3,
         xlab = "",
         ylab ="Global Active Power")
    
    plot(data3$Time, data3$Voltage,
         type="l",
         col="black",
         lwd=3,
         xlab = "datetime",
         ylab ="Voltage")
    
    plot(data3$Time, data3$Sub_metering_1, type="n", xlab = "",
         ylab ="Energy sub metering")
    legend("topright", pch =1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    lines(data3$Time, data3$Sub_metering_1, col="black")
    lines(data3$Time, data3$Sub_metering_2, col="red")
    lines(data3$Time, data3$Sub_metering_3, col="blue")
        
    plot(data3$Time, data3$Global_reactive_power,
         type="l",
         col="black",
         lwd=3,
         xlab = "datetime",
         ylab ="Global_reactive_power")
    
## save graphic plot4.png with a width and height of 480 pixels   
    dev.copy(png, file="plot4.png", width = 480, height = 480)
    dev.off()
})