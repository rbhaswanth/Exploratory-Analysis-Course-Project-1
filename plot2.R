#Load data
dFile <- "household_power_consumption.txt"
info <- read.table(dFile, header=TRUE, sep=";",stringsAsFactors=FALSE, dec=".")
#Select a subset of data from 1/2/2007 to 2/2/2007
selData <- info[info$Date %in% c("1/2/2007","2/2/2007") ,]
dt <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(selData$Global_active_power)
#Plot the data with appropriate labels
png("plot2.png", width=480, height=480)
plot(dt, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()