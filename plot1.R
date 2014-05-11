## Draw a labeled histogram of the Global Active Power

# Load the data. 'householddata.txt' is a shortened version for convenience,
# to avoid repeated waiting for import of the lengthy original dataset, as
# permitted per the instructions.
#
# Alternatively, the needed rows could have been selected like this:
#
#   data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
#   data <- data[which(data$Date == "1/2/2007" | data$Date == "2/2/2007"), 1:9]

data <- read.csv("householddata.txt", sep=";", na.strings="?")

# Set the graphics device to PNG
png(filename = "Plot1.png", width = 480, height = 480)

# Draw the histogram with appropriate labels
hist(data$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

# Finally, export the image and close the device.
dev.off()

