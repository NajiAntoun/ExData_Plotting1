## -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- ##
## plotting global active power as a function of date  ##
## -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- ##

## preparing source data
source("prepare_data.R")

## opening png file 
png(filename="plot2.png", width=480, height=480, units="px")

## plotting
with(consumption, plot(date_time, global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type="l"))

## closing file
ret <- dev.off()