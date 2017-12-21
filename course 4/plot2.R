getwd()

# import data
data <- read.delim(".\\data\\household_power_consumption.txt", sep = ";")

# scope data
subset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
tail(subset); str(subset)

# transforming and cleansing data
subset[,3:9] <- lapply(subset[,3:9], function(x) as.numeric(as.character(x)))

x <- strptime(paste(subset$Date, subset$Time), "%d/%m/%Y %H:%M:%S")

# ploting 2
png(filename = ".\\plot2.png", width = 480, height = 480)

plot(x, subset$Global_active_power, type = "l",
     xlab = "datetime", ylab = "global Active Power (kilowatts)")

dev.off()

