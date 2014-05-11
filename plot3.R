## Draw a colored line graph of the three sub meter readings,
## with a pretty legend in the top right corner

# Load the data
data <- read.csv("householddata.txt", sep=";", na.strings="?")
data = data.frame(Date = strptime(paste(data$Date, data$Time, sep=" "), 
                                  format="%d/%m/%Y %H:%M:%S"), 
                  Sub1 = data$Sub_metering_1, 
                  Sub2 = data$Sub_metering_2, 
                  Sub3 = data$Sub_metering_3)

# Set the graphics device to PNG
png(filename = "Plot3.png", width = 480, height = 480)

# Set up the plot, with labels
plot(data$Date, data$Sub1, xlab = "", ylab = "Energy sub metering", type = "n")

# Add the legend
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Draw the line graphs
lines(data$Date, data$Sub1)
lines(data$Date, data$Sub2, col = "red")
lines(data$Date, data$Sub3, col = "blue")

# Finally, export the image and close the device.
dev.off()
