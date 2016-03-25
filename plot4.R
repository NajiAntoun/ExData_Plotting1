## -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- ##
## plotting 4 graphs for each available measure as a function of date  ##
##   1. Global Active Power                                            ##
##   2. Voltage                                                        ##
##   3. Sub metering 1, 2 and 3                                        ##
##   4. Global Reactive Power                                          ##
## -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- ##

## preparing source data
source("prepare_data.R")

## opening png file 
png(filename="plot4.png", width=480, height=480, units="px")

## setting up for 2 x 2 plots  
par(mfrow=c(2,2))

## plotting first graph
with(consumption, plot(date_time, global_active_power, ylab="Global Active Power", xlab="", type="l"))

## plotting second graph
with(consumption, plot(date_time, voltage, ylab="Voltage", xlab="datetime", type="l", col="black"))

## plotting third graph
with(consumption,  plot(date_time, sub_metering_1, ylab="Energy sub metering", xlab="", type="l", col="black"))
with(consumption, lines(date_time, sub_metering_2, col="red"))
with(consumption, lines(date_time, sub_metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = "solid")

## plotting fourth graph
with(consumption,  plot(date_time, global_reactive_power, ylab="Global Reactive Power", xlab="datetime", type="l"))

## closing the file
ret <- dev.off()