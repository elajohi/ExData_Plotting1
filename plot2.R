# Course Project 1, Plot 2

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

# plot 2
png(filename = "plot2.png", width = 480, height = 480)
Sys.setlocale(category = "LC_TIME", locale = "en_US.UTF-8")
par(bg = NA)                    # setting background to transparent
par(mar = c(5, 4, 4, 2) + 0.1)  # setting margins to default values

plot(consumption.subset$Time, consumption.subset$Global_active_power,
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"
     )

# copy plot2 to png format of size 480 x 480 px
#dev.copy(png, filename = "plot2.png", width = 480, height = 480)
dev.off()
