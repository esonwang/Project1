data<-read.table("household_power_consumption.txt",header=TRUE,
                colClasses=c('character','character','numeric','numeric',
        'numeric','numeric','numeric','numeric','numeric'),sep=";",na.strings='?')
data<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
data$Date_Time = strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")
hist(data$Global_active_power,col='red',xlab="Global active power(kilowatts)",
     main="GLOBAL ACTIVE POWER")
dev.copy(png, file="plot1.png", height=480, width=480) 
dev.off() 
