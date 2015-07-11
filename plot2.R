##reading data
data<-read.csv("household_power_consumption.txt",header = TRUE,sep = ";",dec = ".",na.strings="?")
dat<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
dat$newtime <- as.POSIXct(paste(dat$Date, dat$Time), format = "%d/%m/%Y %T")

##plot 2
plot(dat$newtime,dat$Global_active_power, type = "l",xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png,file="plot2.png")
dev.off()
