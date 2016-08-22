# Course Project 1, Plot 3

#setwd("Documents/03_Online Kurse/0_Data Science _cours/04_EDA/")

# read data into dataframe
power.consumption <- read.table(
    "household_power_consumption.txt", 
    header = TRUE, 
    sep = ";", 
    na.strings = "?")

# convert column "Time" to datetime objects and column "Date" to date objects
power.consumption$Time <- strptime(
    paste(power.consumption$Date, power.consumption$Time),
    "%d/%m/%Y %H:%M:%S")
power.consumption$Date <- as.Date(power.consumption$Date, "%d/%m/%Y")

# subset from 2007-02-01 to 2007-02-02
consumption.subset <- subset(
    power.consumption, Date >= "2007-02-01" & Date <= "2007-02-02")

# plot 4
png(filename = "plot4.png", width = 480, height = 480)
Sys.setlocale(category = "LC_TIME", locale = "en_US.UTF-8")
par(bg = NA)                    # setting background to transparent
par(oma = c(0, 0, 0, 0))
par(mfcol = c(2, 2))
par(mar = c(5, 4, 4, 2) + 0.1)  # setting margins 
#par(cex = 0.7)

# subplot 1
plot(consumption.subset$Time, consumption.subset$Global_active_power,
     type = "l", xlab = "", ylab = "Global Active Power"
     )

# subplot 2
with(consumption.subset, 
     plot(Time, Sub_metering_1, type = "l",
          xlab = "", ylab = "Energy sub metering"
          ))
lines(consumption.subset$Time, consumption.subset$Sub_metering_2, 
      type = "l", col = "red")
lines(consumption.subset$Time, consumption.subset$Sub_metering_3,
      type = "l", col = "blue")
legend("topright", # xjust = 1,
       #inset = c(.17,.03),
       #y.intersp = 1.2,
       lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n"
       )

# subplot 3
with(consumption.subset,
     plot(Time, Voltage, type = "l", 
          xlab = "datetime", ylab = "Voltage"
          ))

# subplot 4
with(consumption.subset, 
     plot(Time, Global_reactive_power, type = "l", 
          xlab = "datetime", ylab = "Global_reactive_power"
          ))

# copy plot4 to png format of size 480 x 480 px
#dev.copy(png, filename = "plot4.png", width = 480, height = 480)

dev.off()

