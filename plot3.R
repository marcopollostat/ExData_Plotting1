
rm(list=ls())

library(dplyr)
library(data.table)
dt <- read.delim("~/data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?" )
dt$DateTime <- paste(dt$Date, dt$Time)
dt[['DateTime']] <- strptime(dt[['DateTime']], format = "%d/%m/%Y %H:%M:%S")
dt$Date <- as.Date(dt$Date, format = "%d/%m/%Y")
str(dt)
df <- filter(dt, Date >= "2007-02-01" & Date <= "2007-02-02")
str(df)

# PLOT 3
plot(df$DateTime, df$Sub_metering_1, type = "l", main = NULL, xlab = "", ylab = "Energy sub metering ")
lines(df$DateTime, df$Sub_metering_2, type = "l", col = "red", main = NULL, xlab = "", ylab = "")
lines(df$DateTime, df$Sub_metering_3, type = "l", col = "blue", main = NULL, xlab = "", ylab = "")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, cex=0.8)
dev.copy(png, file = "plot3.png", width=480, height=480)
dev.off()

##################################################
# Since I'm at a non-English locale, 
# the labels of x-axes are in Portuguese (Brazil),
# where quin = Thu, sex = Fri and sáb = Sat.
##################################################
