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

#open the graphics device
png(file="plot1.png")
#create a histogram of the Global Active Power to the specs shown
with(sub_hdata, hist(Global_active_power, main="Global Active Power",
                     xlab="Global Active Power (kilowatts)",
                     col="orange"))

#close the graphics device
dev.off()
