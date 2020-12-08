#Exploratory Data Anlysis Week 1 Project
#Holly Rebelez, 12/8/2020
#This requires that the data has been downloaded from
#    https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# and unzipped to the working directory

#set the working director
setwd("C:/Users/holly/Documents/HollyCoursera/R/Exploratory Data Analysis/ExData_Plotting1")

#establish the file name
filename<- "household_power_consumption.txt"

#read in the data and subset to the required days
household_data<- read.csv(filename,  na.strings = "?", sep=";")
sub_hdata<- subset(household_data, Date == "1/2/2007" | Date == "2/2/2007")

#convert the date and time to a date time class
sub_hdata$Time<- strptime(paste(sub_hdata$Date,sub_hdata$Time), format= "%d/%m/%Y %T")

#open the graphics device to use
png(file="plot4.png")
#create a Multi-graph plot 
par(mfrow=c(2,2))
with(sub_hdata,{
    #1,1
    plot(Time, Global_active_power, type = "l",
         ylab="Global Active Power (kilowatts)",
         xlab="")
    #1,1
    plot(Time, Voltage, type="l",
         xlab="datetime")
    #2,1
    plot(Time, Sub_metering_1, type = "n",
            ylab="Energy sub metering",
            xlab="")
    lines(Time, Sub_metering_1, col="black")
    lines(Time, Sub_metering_2, col="red")
    lines(Time, Sub_metering_3, col="blue")
    legend("topright",col=c("black", "red", "blue"), 
        lty = 1, bty = "n",cex=.75, inset=0,
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))   
    #2,2
    plot(Time, Global_reactive_power, type="l",
         xlab="datetime")
})
#close the graphics device      
dev.off()
