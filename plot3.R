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
png(file = "plot3.png", bg = "transparent")

#Plot data
pp1<-plot(c2,dat2$Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="")
lines(c2,dat2$Sub_metering_2,type="l",col="red")
lines(c2,dat2$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)

#Close PNG device
dev.off()
