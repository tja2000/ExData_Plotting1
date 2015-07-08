##############################################################################
#                Exploratory Data Analysis  - Project: Plot 2                #
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
png("plot2.png", width=480, height=480)

# Draw... convert the data to numeric
plot(dt, as.numeric(s$Global_active_power), type="l", xlab="",ylab="Global Active Power (kilowatts)")

# close.
dev.off()