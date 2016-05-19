#Load
DATE1 <- "1/2/2007"
DATE2 <- "2/2/2007"

full_epc <- read.table("household_power_consumption.txt", na.strings = '?', sep=';', h=T, stringsAsFactors=F, dec=".") 

#Filter
epc <- full_epc[full_epc$Date %in% c(DATE1, DATE2),]
dates <- strptime(paste(epc$Date, epc$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Plot and save to PNG file
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))

#plot 1 1
plot(dates, epc$Global_active_power, type='l', ylab = "Global Active Power (kilowatts)", xlab="")

#plot 1 2
plot(dates, epc$Voltage, type='l', ylab="Voltage", xlab="datetime")

#plot 2 1
plot(dates, epc$Sub_metering_1, type='l', ylab = "Energy sub metering", xlab="")
lines(dates, epc$Sub_metering_2, col="red")
lines(dates, epc$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = c(1, 1, 1))

#plot 2 2
plot(dates, epc$Global_reactive_power, type="l", xlab="datetime", ylab="Global Reactive Power")

dev.off()
