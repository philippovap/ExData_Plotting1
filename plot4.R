##reading data
data<-read.csv("household_power_consumption.txt",header = TRUE,sep = ";",dec = ".",na.strings="?")
dat<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
dat$newtime <- as.POSIXct(paste(dat$Date, dat$Time), format = "%d/%m/%Y %T")

##plot 4
par(mfrow = c(2,2))
#plot 1
plot(dat$newtime,dat$Global_active_power, type = "l",xlab="", ylab="Global Active Power (kilowatts)")

#plot 2(new)
plot(dat$newtime,dat$Voltage, type = "l",xlab="", ylab="Voltage")

#plot 3
plot(dat$newtime,dat$Sub_metering_1, type = "l",xlab="", ylab="Energy sub metering")
lines(dat$newtime,dat$Sub_metering_2,col="red")
lines(dat$newtime,dat$Sub_metering_3,col="blue")
legend(xjust = 0.5, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),"topright",
       col = c("black", "red", "blue"), cex = 0.4, lty = 1)

#plot 4(new)

plot(dat$newtime,dat$Global_reactive_power, type = "l",xlab="", ylab="Global_reactive_power")


dev.copy(png,file="plot4.png")
dev.off()
