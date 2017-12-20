getwd()

# import data
data <- read.delim(".\\data\\household_power_consumption.txt", sep = ";")

# scope data
subset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
tail(subset); str(subset)

# transforming and cleansing data
library(dplyr)
subset <- subset %>% mutate(mydate = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))

x <- strptime(paste(subset$Date, subset$Time), "%d/%m/%Y %H:%M:%S")
subset[,3:9] <- lapply(subset[,3:9], function(x) as.numeric(as.character(x)))

# ploting 1
png(filename = ".\\plot1.png", width = 480, height = 480)
hist(subset$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()

# ploting 2
png(filename = ".\\plot2.png", width = 480, height = 480)
plot(x, subset$Global_active_power, type = "l",
     xlab = "datetime", ylab = "global Active Power (kilowatts)")
dev.off()

# ploting 3
png(filename = ".\\plot3.png", width = 480, height = 480)
plot(x, subset$Sub_metering_1, type = "l", color = "black",
     xlab = "datetime", ylab = "Energy sub metering")
lines(x, subset$Sub_metering_2, type = "l", col = "red")
lines(x, subset$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("sub_metering_1", "sub_metering_2", "sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)
dev.off()

# ploting 4
png(filename = ".\\plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(x, subset$Global_active_power, type = "l",
     xlab = "datetime", ylab = "global Active Power")
plot(x, subset$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")

plot(x, subset$Sub_metering_1, type = "l", color = "black",
     xlab = "datetime", ylab = "Energy sub metering")
lines(x, subset$Sub_metering_2, type = "l", col = "red")
lines(x, subset$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("sub_metering_1", "sub_metering_2", "sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, bty = "n", cex = .9)

plot(x, subset$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
