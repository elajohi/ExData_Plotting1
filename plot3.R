# Course Project 1, Plot 3

setwd("Documents/03_Online Kurse/0_Data Science _cours/04_EDA/")

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

# plot 3
png(filename = "plot3.png", width = 480, height = 480)
Sys.setlocale(category = "LC_TIME", locale = "en_US.UTF-8")
par(bg = NA)                    # setting background to transparent
par(mar = c(5, 4, 4, 2) + 0.1
    )  # setting margins to default values

    
with(consumption.subset, 
     plot(Time, Sub_metering_1, type = "l",
          xlab = "", ylab = "Energy sub metering"))
lines(consumption.subset$Time, consumption.subset$Sub_metering_2, 
      type = "l", col = "red")
lines(consumption.subset$Time, consumption.subset$Sub_metering_3,
      type = "l", col = "blue")
legend("topright", inset = 0,
       lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# copy plot3 to png format of size 480 x 480 px
#dev.copy(png, filename = "plot3.png", width = 480, height = 480)
dev.off()

