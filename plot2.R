
#Load
DATE1 <- "1/2/2007"
DATE2 <- "2/2/2007"

full_epc <- read.table("household_power_consumption.txt", na.strings = '?', sep=';', h=T, stringsAsFactors=F, dec=".") 

#Filter
epc <- full_epc[full_epc$Date %in% c(DATE1, DATE2),]
dates <- strptime(paste(epc$Date, epc$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Plot and save to PNG file
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(dates, epc$Global_active_power, type='l', ylab = "Global Active Power (kilowatts)", xlab="")
dev.off()
