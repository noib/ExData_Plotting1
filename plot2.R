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
png(filename = "plot2.png")

## build the plot
plot(power$DateTime,power$Global_active_power,type="l",main="",xlab="",ylab="Global Active Power (kilowatts)")

## save the file
dev.off()