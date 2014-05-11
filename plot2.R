data <- read.csv("householddata.txt", sep=";", na.strings="?")
data = data.frame(Date = strptime(paste(data$Date, data$Time, sep=" "), 
                                  format="%d/%m/%Y %H:%M:%S"), 
                  Global_active_power = data$Global_active_power)

# Set the graphics device to PNG
png(filename = "Plot2.png", width = 480, height = 480)

# Set up the plot, with labels
plot(data$Date, data$Global_active_power, xlab = "", 
     ylab = "Global Active Power (kilowatts)", type = "n")

# Draw the line graph into the plot we just set up
lines(data$Date, data$Global_active_power)

# Finally, export the image and close the device.
dev.off()