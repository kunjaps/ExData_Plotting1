# Code for plot2.png

#import the following libraries
library(lubridate)

# "blue" contains the whole database
blue <- read.csv2("household_power_consumption.txt")

# green contains the data for dates = 1/2/2007 and 2/2/2007
green <- subset(blue, dmy(blue$Date)==dmy("2-2-2007")|dmy(blue$Date)==dmy("1-2-2007"))

# combining date and time
new_date <- paste(as.Date(green$Date, "%d/%m/%Y"), green$Time)

# giving the column new name
new_date <- setNames(new_date, "DateTime")

# changing the date format
new_date <- as.POSIXct(new_date)

#plotting
plot(new_date, green$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)")

#saving the files
dev.copy(png,"plot2.png",height=480, width=480)
dev.off()
