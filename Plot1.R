#read the assigned data.
data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")

#redefine date variable and define datetime variable
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- strptime(paste(data$Date,data$Time),
                                 format = "%Y-%m-%d %H:%M:%S")

#filter a range of row variable
data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

#define Global active power variable as numeric
data$Global_active_power <- as.numeric(data$Global_active_power)


#png file device for plotting
png("plot1.png",width = 480,height = 480)

#hist.
hist(data$Global_active_power, col = "red", main= "Global Active Power", xlab="Global Active Power (kilowatts)")

#closing the file device
dev.off()

