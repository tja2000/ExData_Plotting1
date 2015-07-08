##############################################################################
#                Exploratory Data Analysis  - Project: Plot 3                #
##############################################################################

library(dplyr)
# We assume that the data is in the same directory
d <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# Subset the data on 1/2 and 2/2 2007
s <- filter(d,d$Date=="1/2/2007" | d$Date=="2/2/2007")

# Prepare date fields
#dt <- paste(s$Date,s$Time,sep=" ")
dt <- strptime(paste(s$Date,s$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")

# Make sure that days are displayed in English 
Sys.setlocale("LC_TIME","English") 
 
# Prepare canvas
png("plot3.png", width=480, height=480)

# Draw... convert the data to numeric
plot(dt, as.numeric(s$Sub_metering_1), type="l", xlab="",ylab="Energy Sub metering")
lines(dt,as.numeric(s$Sub_metering_2), type="l", col="red")
lines(dt,as.numeric(s$Sub_metering_3), type="l", col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=5,col=c("black","red","blue"))
# close.
dev.off()