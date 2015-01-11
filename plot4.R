data<-read.table("household_power_consumption.txt",header=TRUE,
                 colClasses=c('character','character','numeric','numeric',
                              'numeric','numeric','numeric','numeric','numeric')
                 ,sep=";",na.strings='?')
data<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
data$Date_Time = strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")
par(mfcol=c(2,2))
plot(data$Date_Time, data$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")
plot(data$Date_Time, data$Sub_metering_1, type='l', xlab="", 
     ylab='Energy sub meterring')
lines(data$Date_Time, data$Sub_metering_2,col='red')
lines(data$Date_Time, data$Sub_metering_3,col='blue')
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1), col=c('black','red','blue'),bty='n')
plot(data$Date_Time, data$Voltage, type="l", xlab="datatime",ylab="Voltage")
plot(data$Date_Time, data$Global_reactive_power, type="l", xlab="datatime", 
    ylab="Global_reactive_power")
dev.copy(png, file="plot4.png", height=480, width=480) 
dev.off() 