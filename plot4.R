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

png("plot4.png", width=480, height=480)
# PLOT 4
par(mfrow=c(2,2))
# 1st plot (line) -  global active power vs Date
plot(df$DateTime, df$Global_active_power, type = "l", main = NULL, xlab = "", ylab = "Global Active Power")
# 2nd plot (line) -  voltage vs Date
plot(df$DateTime, df$Voltage, type = "l", main = NULL, xlab = "datetime", ylab = "Voltage")
# 3rd plot (line) -  Energy Sub metering(1, 2 and 3) vs Date
plot(df$DateTime, df$Sub_metering_1, type = "l", main = NULL, xlab = "", ylab = "Energy sub metering ")
lines(df$DateTime, df$Sub_metering_2, type = "l", col = "red", main = NULL, xlab = "", ylab = "")
lines(df$DateTime, df$Sub_metering_3, type = "l", col = "blue", main = NULL, xlab = "", ylab = "")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, cex=0.8, box.lty=0, inset = 0.02)
# 4th plot (line) -  Energy Sub metering(1, 2 and 3) vs Date
plot(df$DateTime, df$Global_reactive_power, type = "l", main = NULL, xlab = "datetime", ylab = "Global_reactive_power")
dev.off()