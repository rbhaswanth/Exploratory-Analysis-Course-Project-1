#Load data
dFile <- "household_power_consumption.txt"
info <- read.table(dFile, header=TRUE, sep=";",stringsAsFactors=FALSE, dec=".")
#Select a subset of data from 1/2/2007 to 2/2/2007
selData <- info[info$Date %in% c("1/2/2007","2/2/2007") ,]
dt <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(selData$Global_active_power)
GRP <- as.numeric(subSetData$Global_reactive_power)
V <- as.numeric(subSetData$Voltage)
sM1 <- as.numeric(subSetData$Sub_metering_1)
sM2 <- as.numeric(subSetData$Sub_metering_2)
sM3 <- as.numeric(subSetData$Sub_metering_3)
#Plot the data with appropriate labels and legend
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(selData, {
  plot(dt, GAP, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(dt, V, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(dt, sM1, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(dt, sM2,col='Red')
  lines(dt, sM3,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(dt, GRP, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})
dev.off()