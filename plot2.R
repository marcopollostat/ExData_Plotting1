# clean environment
rm(list=ls())
library(dplyr)
# read dataset
dt <- read.delim("~/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?" )
dt$DateTime <- paste(dt$Date, dt$Time)
dt[['DateTime']] <- strptime(dt[['DateTime']], format = "%d/%m/%Y %H:%M:%S")
dt$Date <- as.Date(dt$Date, format = "%d/%m/%Y")
df <- filter(dt, Date >= "2007-02-01" & Date <= "2007-02-02")

##################################################
# Since I'm at a non-English locale, 
# the labels of x-axes are in Portuguese (Brazil),
# where quin = Thu, sex = Fri and sáb = Sat.
##################################################

# PLOT 2
png("plot2.png", width=480, height=480)
# PLOT 2
plot(df$DateTime, df$Global_active_power, type = "l", main = NULL, xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
