##reading data
data<-read.csv("household_power_consumption.txt",header = TRUE,sep = ";",dec = ".",na.strings="?")
dat<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
dat$newtime <- as.POSIXct(paste(dat$Date, dat$Time), format = "%d/%m/%Y %T")

## plot 1
hist(dat$Global_active_power,col="red",
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png")
dev.off()
