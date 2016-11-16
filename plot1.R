#Plot 1
fname <- "household_power_consumption.txt"

#download and unzip file if necessary
if (!file.exists(fname)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  zipfile <- "exdata_data_household_power_consumption.zip"
  download.file(fileURL, zipfile)
  unzip(zipfile)
} 
#Read the Data
powerconsump <- read.table("household_power_consumption.txt",sep=";",na.strings="?",header=TRUE,skip=66636,nrows=2880,col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
powerconsump$posix <- strptime(paste(powerconsump$Date,powerconsump$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

#Make the plot
par(mfrow=c(1,1))
with(powerconsump,hist(Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red"))
dev.copy(png,"plot1.png",width=480,height=480)
dev.off()
