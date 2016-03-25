## -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
##
## This script download the “Individual household electric power consumption Data Set” zip file and unzip it. 
## 
## The dataset has 2,075,259 rows and 9 columns. Since we will only be using data from the dates 2007-02-01 and 2007-02-02, the script will :
##  1. prepare an output csv file with data related to just those dates
##  2. columns names are renamed, dates/times values are converted to date and time 
##  3. cleansed data are then loaded in a data.table to be used by the plot1.R, plot2.R, plot3.R and plot4.R scripts
##
## This script is called by each plot R script.
##
## -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

library(data.table)
library(lubridate)

## check if the tidy file has been previously created. if not prepare it
if (! file.exists("tidy_household_power_consumption.csv")) {

    ## check if the original raw data text file exists
    if (! file.exists("household_power_consumption.txt")) {

        ## check if the original zip file exists. Download it if needed 
        if (! file.exists("exdata-data-household_power_consumption.zip")) {
            file.url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
            download.file(file.url, destfile="exdata-data-household_power_consumption.zip")
        } 

        ## unzip the file
        unzip("exdata-data-household_power_consumption.zip", overwrite=TRUE)    
    }
    
    ## reading the source file (using fread giving the size of the file)
    consumption <- fread("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
    
    ## filtering to keep only two days of data
    consumption <- subset(consumption, Date == '1/2/2007' | Date == '2/2/2007')

    ## converting date and time into a new column
    consumption$date_time <- dmy(consumption$Date) + hms(consumption$Time)
    
    ## keeping needed columns
    consumption <- consumption[,c(10,3:9), with = FALSE]

    ## renaming columns
    colnames(consumption) <- c('date_time', 'global_active_power', 'global_reactive_power', 'voltage', 'global_intensity', 'sub_metering_1', 'sub_metering_2', 'sub_metering_3')
    
    ## writing tidy file
    write.table(consumption,file="tidy_household_power_consumption.csv",sep=",",row.names=FALSE)
    
    ## deleting the unziped file
    ret <- file.remove("household_power_consumption.txt")

} else {

  # read the tidy file if previously created
  consumption <- fread('tidy_household_power_consumption.csv', sep = ",", header = TRUE)
  ## converting date time into POSIXct
  consumption$date_time <- as.POSIXct(consumption$date_time)
 }