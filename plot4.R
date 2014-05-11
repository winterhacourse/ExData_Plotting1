## Draw four plots, two rows of two plots each

# Load the data
data <- read.csv("householddata.txt", sep=";", na.strings="?")
data = data.frame(Date = strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"), Gap = data$Global_active_power, Grp = data$Global_reactive_power, Voltage = data$Voltage, Sub1 = data$Sub_metering_1, Sub2 = data$Sub_metering_2, Sub3 = data$Sub_metering_3)

# Set the graphics device to PNG
png(filename = "Plot4.png", width = 480, height = 480)

# We want 2x2 plots
par(mfrow = c(2, 2))

# Plot the Global Active Power over time, same as in plot2.R
plot(data$Date, data$Gap, xlab = "", ylab = "Global Active Power (kilowatts)", type = "n")
lines(data$Date, data$Gap)

# Plot the Voltage
plot(data$Date, data$Voltage, xlab = "datetime", ylab = "Voltage", type = "n")
lines(data$Date, data$Voltage)

# Energy Submetering plot, same as in plot3.R except there's no box around
# the legend this time.
plot(data$Date, data$Sub1, xlab = "", ylab = "Energy sub metering", type = "n")
legend("topright", bty = "n", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
lines(data$Date, data$Sub1)
lines(data$Date, data$Sub2, col = "red")
lines(data$Date, data$Sub3, col = "blue")

# Plot the Global Reactive Power
plot(data$Date, data$Grp, xlab = "datetime", ylab = "Global_reactive_power", type = "n")
lines(data$Date, data$Grp)

# Finally, export the image and close the device.
dev.off()
