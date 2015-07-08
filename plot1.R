##############################################################################
#                Exploratory Data Analysis  - Project: Plot 1                #
##############################################################################

library(dplyr)
# We assume that the data is in the same directory
d <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# Subset the data on 1/2 and 2/2 2007
s <- filter(d,d$Date=="1/2/2007" | d$Date=="2/2/2007")

# Prepare canvas
png("plot1.png", width=480, height=480)

# Draw... convert the data to numeric
hist(as.numeric(s$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# close.
dev.off()