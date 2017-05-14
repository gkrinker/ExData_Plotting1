## plot2.R
## Peer-graded Assignment: Exploratory Data
## By: Georges Krinker
## Plots plot #3 from the Assignment

## Library used for effectively loading the right data into memory
library(sqldf)

# ----------------------------------------------------------------------
#   STEP: 1 - LOAD THE DATA TO BE PLOTTED
# ----------------------------------------------------------------------

#Load the data into memory

data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date == '1/2/2007' OR Date == '2/2/2007' ", header = TRUE, sep = ";")

#Change format of Data and Time columns for easier manipulation

data$Date <- as.Date(data$Date,"%d/%m/%Y")
data$Time <- strptime(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S")


# ----------------------------------------------------------------------
#   STEP: 2 - PLOT AND FORMAT THE CHART
# ----------------------------------------------------------------------

plot(data$Time, data$Sub_metering_1, ylab = "Energy sub metering",xlab="", type ="l")
lines(data$Time, data$Sub_metering_1, col = "black")
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# ----------------------------------------------------------------------
#   STEP: 3 - OUTPUT TO PNG
# ----------------------------------------------------------------------

 dev.copy(png, file="plot3.png", width = 480, height = 480)
 dev.off()