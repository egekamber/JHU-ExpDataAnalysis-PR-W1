#read the assigned data.
data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")

#redefine date variable and define datetime variable
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- strptime(paste(data$Date,data$Time), format = "%Y-%m-%d %H:%M:%S")

#filter a range of row variable
data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

#define variales as numeric
data$Sub_metering_1<- as.numeric(data$Sub_metering_1)
data$Sub_metering_2<- as.numeric(data$Sub_metering_2)
data$Sub_metering_3<- as.numeric(data$Sub_metering_3)

#png file device for plotting
png("plot3.png",width = 480,height = 480)

#produce plot3
plot(data$DateTime,data$Sub_metering_1, ylab="Energy sub metering", xlab="", type = "l")
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright",lty = 1, col=c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#closing the file device
dev.off()