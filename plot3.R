## -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- ##
## plotting the 3 sub metering measures as a function of date  ##
## -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- ##

## preparing source data
source("prepare_data.R")

## opening png file 
png(filename="plot3.png", width=480, height=480, units="px")

# drawing first line for sub_metering_1
with(consumption,  plot(date_time, sub_metering_1, ylab='Energy sub metering', xlab='', type='l', col='black'))

# drawing first line for sub_metering_2
with(consumption, lines(date_time, sub_metering_2, col = "red"))

# drawing first line for sub_metering_3
with(consumption, lines(date_time, sub_metering_3, col = "blue"))

# adding legend
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = "solid")

# closing the file
ret <- dev.off()