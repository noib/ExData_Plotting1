## load data from file
data = read.table("household_power_consumption.txt",sep=";",header=TRUE)
power = subset(data,data$Date %in% c("1/2/2007","2/2/2007"))
power$Date = as.Date(power$Date,format="%d/%m/%Y")
power$DateTime = paste(power$Date,power$Time,sep=" ")
power$DateTime = as.POSIXlt(power$DateTime)
power$Global_active_power = as.numeric(as.character(power$Global_active_power))
power$Global_reactive_power=as.numeric(as.character(power$Global_reactive_power))
power$Voltage=as.numeric(as.character(power$Voltage))
power$Sub_metering_1 = as.numeric(as.character(power$Sub_metering_1))
power$Sub_metering_2 = as.numeric(as.character(power$Sub_metering_2))
power$Sub_metering_3 = as.numeric(as.character(power$Sub_metering_3))

## create the file
png(filename = "plot3.png")

## build the plot
with(power,{plot(DateTime,Sub_metering_1,type="l",main="",xlab="",ylab="Energy sub metering");lines(DateTime,Sub_metering_2,type="l",col="red");lines(DateTime,Sub_metering_3,col="blue")})
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,col=c("black","red","blue"))

## save the file
dev.off()