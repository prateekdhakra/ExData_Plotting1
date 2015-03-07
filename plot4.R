# load data
# Assume the data is available in the root directory where you run this program from.
file <- "household_power_consumption.txt"
d <- read.csv(file, sep = ';', stringsAsFactors = FALSE,na.strings ="?")
data <- d[d$Date %in% c('1/2/2007','2/2/2007'),]
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(dt, format='%Y-%m-%d %H:%M:%S')


#Plot 4 (2x2 grid)
png(filename="plot4.png",width =480, height = 480)

par(mfrow = c(2,2))
#Subplot (1,1)
plot(data$Time,data$Global_active_power,"l", xlab = "", ylab = "Global Active Power (kilowatts)")

#Subplot(1,2)
plot(data$Time,data$Voltage,"l", xlab = "datetime", ylab = "Voltage")

#Subplot (2,1)
plot(data$Time,data$Sub_metering_1,"l",col ="black", xlab = "", ylab = "Energy sub metering")
lines(data$Time, data$Sub_metering_2,"l",col="red")
lines(data$Time, data$Sub_metering_3,"l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), lwd = c(2.5,2.5,2.5), col = c("black","red","blue"))

#Subplot (2,2)
plot(data$Time,data$Global_reactive_power,"l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()