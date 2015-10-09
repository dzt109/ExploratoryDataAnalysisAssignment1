#Plot 1 - read data
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
png(file = "plot1.png", bg = "transparent")

#Plot histogram
hist(as.numeric(dat2$Global_active_power),col="RED",xlab="Global Active Power (kilowatts)",ylim=c(0,1200),main="Global Active Power")

#Close PNG device
dev.off()
