#read the data
HPCdata<-read.table("household_power_consumption.txt", skip = 1, sep = ";")
#give name to columns
names(HPCdata)<- c("Date", "Time", "Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#subsetting the data to the date we want to plot
SubHPCdata<- subset(HPCdata, HPCdata$Date=="1/2/2007"|HPCdata$Date=="2/2/2007")
#plotting
hist (as.numeric(as.character(SubHPCdata$Global_active_power)), col="red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")
