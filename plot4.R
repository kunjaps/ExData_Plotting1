# Code for plot4.png

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

#laying out the tiles
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

# first plot
plot(new_date,green$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts", xlab = "")

# second plot
plot(new_date,green$Voltage, type = "l",ylab = "Voltage (volt)", xlab = "")

# third plot
plot(new_date,green$Sub_metering_1, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
lines(new_date, green$Sub_metering_2,col = "Red")
lines(new_date, green$Sub_metering_3,col = "Blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# fourth plot
plot(new_date, green$Global_reactive_power, type = "l", xlab = "", ylab = "Global Reactive Power (kilowatts)")

#saving the files
dev.copy(png,"/Users/vrsreeganesh/plot4.png", height=480, width=480)
dev.off()










