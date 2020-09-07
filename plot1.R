#read the data
HPCdata<-read.table("household_power_consumption.txt", skip = 1, sep = ";")
#give name to columns
names(HPCdata)<- c("Date", "Time", "Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
