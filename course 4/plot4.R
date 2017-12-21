getwd()

# import data
data <- read.delim(".\\data\\household_power_consumption.txt", sep = ";")

# scope data
subset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
tail(subset); str(subset)

# transforming and cleansing data
subset[,3:9] <- lapply(subset[,3:9], function(x) as.numeric(as.character(x)))

x <- strptime(paste(subset$Date, subset$Time), "%d/%m/%Y %H:%M:%S")

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


