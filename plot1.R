# Code for plot1.png

#import the following libraries
library(lubridate)

# "blue" contains the whole database
blue <- read.csv2("household_power_consumption.txt")

# green contains the data for dates = 1/2/2007 and 2/2/2007
green <- subset(blue, dmy(blue$Date)==dmy("2-2-2007")|dmy(blue$Date)==dmy("1-2-2007"))

#plotting 
hist(as.numeric(as.character(green$Global_active_power)), xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "RED")

#saving the file
dev.copy(png, file = "plot1.png",height=480, width=480)
dev.off()