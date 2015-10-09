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
png(file = "plot2.png", bg = "transparent")

#Plot data and close PNG device
plot(c2,dat2$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
