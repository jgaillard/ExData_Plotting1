
#Load
DATE1 <- "1/2/2007"
DATE2 <- "2/2/2007"

full_epc <- read.table("household_power_consumption.txt", na.strings = '?', sep=';', h=T, stringsAsFactors=F, dec=".") 

#Filter
epc <- full_epc[full_epc$Date %in% c(DATE1, DATE2),]
dates <- strptime(paste(epc$Date, epc$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Plot and save to PNG file
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(dates, epc$Sub_metering_1, type='l', ylab = "Energy sub metering", xlab="")
lines(dates, epc$Sub_metering_2, col="red")
lines(dates, epc$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = c(1, 1, 1))
dev.off()
