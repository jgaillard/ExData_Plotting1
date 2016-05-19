
#Load
DATE1 <- "1/2/2007"
DATE2 <- "2/2/2007"

full_epc <- read.table("household_power_consumption.txt", na.strings = '?', sep=';', h=T, stringsAsFactors=F, dec=".") 

#Filter
epc <- full_epc[full_epc$Date %in% c(DATE1, DATE2),]

#Plot and save to PNG file
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(epc$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
