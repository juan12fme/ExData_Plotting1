# Reading data
HPCdata <- read.table("household_power_consumption.txt",skip=1,sep=";")
#naming columns and subsetting
names(HPCdata) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
SubHPCdata <- subset(HPCdata,HPCdata$Date=="1/2/2007" | HPCdata$Date =="2/2/2007")

# Transforming the Date and Time variable from characters into objects of type Date and POSIXlt 
SubHPCdata$Date <- as.Date(SubHPCdata$Date, format="%d/%m/%Y")
SubHPCdata$Time <- strptime(SubHPCdata$Time, format="%H:%M:%S")
SubHPCdata[1:1440,"Time"] <- format(SubHPCdata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
SubHPCdata[1441:2880,"Time"] <- format(SubHPCdata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# compose a plot with many graphs using mfrow and par
par(mfrow=c(2,2))

# plotting all graphs
with(SubHPCdata,{
        plot(SubHPCdata$Time,as.numeric(as.character(SubHPCdata$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
        plot(SubHPCdata$Time,as.numeric(as.character(SubHPCdata$Voltage)), type="l",xlab="datetime",ylab="Voltage")
        plot(SubHPCdata$Time,SubHPCdata$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
        with(SubHPCdata,lines(Time,as.numeric(as.character(Sub_metering_1))))
        with(SubHPCdata,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
        with(SubHPCdata,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
        legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
        plot(SubHPCdata$Time,as.numeric(as.character(SubHPCdata$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})

