rm(list = ls())
getwd()
setwd("Desktop/DATA_SCIENCE specialization/Explorartory DataAnalysis/Week1/")

my_data<-read.csv2("household_power_consumption.txt",stringsAsFactors = FALSE,skip = 2)
colnames(my_data) = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1", "Sub_metering_2","Sub_metering_3")

head(my_data,4)

my_data$Date1 <-as.Date(my_data$Date,format = "%d/%m/%Y")
class(as.Date(my_data$Date))
start_date<-as.Date("01/02/2007" , format = "%d/%m/%Y")  
end_date<-as.Date("02/02/2007" , format = "%d/%m/%Y")

mydata1<-my_data[my_data$Date1>=start_date & my_data$Date1<= end_date,]

head(mydata1)
class(mydata1$Sub_metering_1)
mydata1$Sub_metering_1<-as.numeric(mydata1$Sub_metering_1)
mydata1$Sub_metering_2<-as.numeric(mydata1$Sub_metering_2)
mydata1$Sub_metering_3<-as.numeric(mydata1$Sub_metering_3)

length(mydata1$Sub_metering_1)


plot(1:2880,mydata1$Sub_metering_1,type = "l",lty="solid" , ylab = "Energy sub metering",xlab ="FREQUENCY", xaxt = "n",yaxt="n",ylim = c(0,30))
lines(1:2880,mydata1$Sub_metering_2,type = "l",lty="solid" , ylab = "Energy sub metering",xlab ="FREQUENCY", xaxt = "n",yaxt="n",col="red",ylim = c(0,30))
lines(1:2880,mydata1$Sub_metering_3,type = "l",lty="solid" , ylab = "Energy sub metering",xlab ="FREQUENCY", xaxt = "n",yaxt="n",col="blue",ylim = c(0,30))
axis(2, at=seq(0,30,by=10), labels=seq(0,30,by=10) )
axis(1, at=c(0, 2880/2, 2880) , labels = c("Thu" , "Fri", "Sat"))

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "o",lty="solid",col=c("black","red","blue"),bg="white",lwd=0.5, cex=.7,y.intersp = .4 , yjust = 1 , xjust = 1 , text.width = 800) 


