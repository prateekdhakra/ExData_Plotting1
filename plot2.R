# load data
# Assume the data is available in the root directory where you run this program from.
file <- "household_power_consumption.txt"
d <- read.csv(file, sep = ';', stringsAsFactors = FALSE,na.strings ="?")
data <- d[d$Date %in% c('1/2/2007','2/2/2007'),]
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(dt, format='%Y-%m-%d %H:%M:%S')


#Plot 2 
png(filename="plot2.png",width =480, height = 480)
plot(data$Time,data$Global_active_power,"l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

