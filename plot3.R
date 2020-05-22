# Code for plot3.png

#import the following libraries
library(lubridate)

# "blue" contains the whole database
blue <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

# green contains the data for dates = 1/2/2007 and 2/2/2007
green <- subset(blue, dmy(blue$Date)==dmy("2-2-2007")|dmy(blue$Date)==dmy("1-2-2007"))

green$Date <- as.Date(green$Date, "%d/%m/%Y")

#taking the complete cases
green <- green[complete.cases(green),]

# combining the date and time
new_date <- paste(green$Date, green$Time)
new_date <- as.POSIXct(new_date)

#plotting
plot(new_date, green$Sub_metering_1, type = "l",ylab = "Global Active Power (kilowatts)",xlab = "")
lines(new_date,green$Sub_metering_2, col = "red")
lines(new_date,green$Sub_metering_3, col = "blue")
legend("topright", col = c("black","red","blue"), lwd = c(1,1,1), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# saving the plot
dev.copy(png, "plot3.png",height=480, width=480)
dev.off()
