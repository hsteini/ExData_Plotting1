
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

## draw plot1
hist(data3$Global_active_power, col="red", main= "Global Active Power", xlab ="Global Active Power (kilowatts)")

## draw graphic plot1.png with a width and height of 480 pixels
dev.copy(png, file="plot1.png", width = 480, height = 480)
dev.off()