#read the assigned data.
data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")


#redefine date variable and define datetime variable
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- strptime(paste(data$Date,data$Time), format = "%Y-%m-%d %H:%M:%S")


#filter a range of row variable
data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]


#define variales as numeric
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Sub_metering_1<- as.numeric(data$Sub_metering_1)
data$Sub_metering_2<- as.numeric(data$Sub_metering_2)
data$Sub_metering_3<- as.numeric(data$Sub_metering_3)
data$Voltage <- as.numeric(data$Voltage)
data$Global_reactive_power<- as.numeric(data$Global_reactive_power)

#png file device for plotting
png("plot4.png",width = 480,height = 480)

#layout of plot4
par(mfrow = c(2,2))

#topleft plot -the same with plot2-
plot(data$DateTime,data$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type = "l")

#topright plot
plot(data$DateTime, data$Voltage, ylab= "Voltage", xlab="datetime", type = "l")

#bottomleft plot-the same with plot3-
plot(data$DateTime,data$Sub_metering_1, ylab="Energy sub metering", xlab="", type = "l")
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright",lty = 1, col=c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#bottomright plot
plot(data$DateTime, data$Global_reactive_power, ylab= "Global_reactive_power", xlab="datetime", type = "l")

#closing the file device
dev.off()