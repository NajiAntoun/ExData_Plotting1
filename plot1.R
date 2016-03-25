## -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- ##
## plotting global active power frequency  ##
## -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- ##

## preparing source data
source("prepare_data.R")

## opening png file 
png(filename="plot1.png", width=480, height=480, units="px")

## plotting using hist() function
with(consumption, hist(global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red"))

## closing png file
ret <- dev.off()