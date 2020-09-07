rm(list=ls())

library(dplyr)
library(data.table)
dt <- read.delim("~/energy/data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?" )
dt$DateTime <- paste(dt$Date, dt$Time)
dt[['DateTime']] <- strptime(dt[['DateTime']], format = "%d/%m/%Y %H:%M:%S")
dt$Date <- as.Date(dt$Date, format = "%d/%m/%Y")
str(dt)
df <- filter(dt, Date >= "2007-02-01" & Date <= "2007-02-02")
str(df)

# PLOT 1
hist(df$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.copy(png, file = "plot1.png")#, width=480, height=480)
dev.off()
