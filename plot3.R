#Load data
dFile <- "household_power_consumption.txt"
info <- read.table(dFile, header=TRUE, sep=";",stringsAsFactors=FALSE, dec=".")
#Select a subset of data from 1/2/2007 to 2/2/2007
selData <- info[info$Date %in% c("1/2/2007","2/2/2007") ,]
dt <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(selData$Global_active_power)
sM1 <- as.numeric(subSetData$Sub_metering_1)
sM2 <- as.numeric(subSetData$Sub_metering_2)
sM3 <- as.numeric(subSetData$Sub_metering_3)
#Plot the data with appropriate labels
png("plot3.png", width=480, height=480)
with(selData, {
  plot(dt, sM1, type="l", ylab="Energy Submetering", xlab="")
  lines(dt, sM2, type="l", col="red")
  lines(dt, sM3, type="l", col="blue")
})
#Add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=3, col=c("black", "red", "blue"))
dev.off()