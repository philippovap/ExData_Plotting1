##reading data
data<-read.csv("household_power_consumption.txt",header = TRUE,sep = ";",dec = ".",na.strings="?")
dat<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
dat$newtime <- as.POSIXct(paste(dat$Date, dat$Time), format = "%d/%m/%Y %T")

##plot 3
plot(dat$newtime,dat$Sub_metering_1, type = "l",xlab="", ylab="Energy sub metering")
lines(dat$newtime,dat$Sub_metering_2,col="red")
lines(dat$newtime,dat$Sub_metering_3,col="blue")
legend(legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),"topright",
       col = c("black", "red", "blue"), cex = 0.8, lty = 1)

dev.copy(png,file="plot3.png")
dev.off()
