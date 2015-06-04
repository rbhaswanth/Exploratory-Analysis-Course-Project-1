#Load data
dFile <- "household_power_consumption.txt"
info <- read.table(dFile, header=TRUE, sep=";",stringsAsFactors=FALSE, dec=".")
#Select a subset of data from 1/2/2007 to 2/2/2007
selData <- info[info$Date %in% c("1/2/2007","2/2/2007") ,]
GAP <- as.numeric(selData$Global_active_power)
#Plot the data with appropriate labels
png("plot1.png", width=480, height=480)
hist(GAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()