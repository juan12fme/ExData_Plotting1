# Reading data
HPCdata <- read.table("household_power_consumption.txt",skip=1,sep=";")
#naming the columns and subsetting
names(HPCdata) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
SubHPCdata <- subset(HPCdata,HPCdata$Date=="1/2/2007" | HPCdata$Date =="2/2/2007")

# Transforming the Date and Time variable from characters into objects of type Date and POSIXlt 
SubHPCdata$Date <- as.Date(SubHPCdata$Date, format="%d/%m/%Y")
SubHPCdata$Time <- strptime(SubHPCdata$Time, format="%H:%M:%S")
SubHPCdata[1:1440,"Time"] <- format(SubHPCdata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
SubHPCdata[1441:2880,"Time"] <- format(SubHPCdata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# plotting
plot(SubHPCdata$Time,as.numeric(as.character(SubHPCdata$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
title(main="Global Active Power Vs Time")

