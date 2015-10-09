#Plot 2 - read data
dat <-read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses = "character")

#Change to data format
dat$Date<-as.Date(dat$Date, "%d/%m/%Y")

#Subset date range 
dat1<-subset(dat, (Date>="2007-02-01")&(Date<="2007-02-02"))
dat2<-data.frame(dat1,stringsAsFactors = FALSE)

#Create date/time labels
c1<-paste(as.character(dat1$Date),dat1$Time)
c2<-strptime(c1, "%Y-%m-%d %H:%M:%S")

#Open PNG device
png(file = "plot4.png", bg = "transparent")

#Create 2x2 layout and plot
layout(matrix(c(1,2,3,4),2,2,byrow=FALSE))
plot(datetime,dat2$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
pp1<-plot(datetime,dat2$Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="")
lines(datetime,dat2$Sub_metering_2,type="l",col="red")
lines(datetime,dat2$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,bty="n")
plot(datetime,dat2$Voltage,type="l",ylab="Voltage")
plot(datetime,dat2$Global_reactive_power,type="l")

#Close PNG device
dev.off()
