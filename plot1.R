rm(list = ls())
getwd()
setwd("Week1/")

my_data<-read.csv2("household_power_consumption.txt",stringsAsFactors = FALSE,skip = 2)
colnames(my_data) = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1", "Sub_metering_2","Sub_metering_3")
my_data$Date1 <-as.Date(my_data$Date,format = "%d/%m/%Y")
class(as.Date(my_data$Date))
start_date<-as.Date("01/02/2007" , format = "%d/%m/%Y")  
end_date<-as.Date("02/02/2007" , format = "%d/%m/%Y")
class()
mydata1<-my_data[my_data$Date1>=start_date & my_data$Date1<=end_date,]

mydata1$Global_active_power<-as.numeric(mydata1$Global_active_power)
hist(mydata1$Global_active_power ,col = "RED",ylim = c(0,1200),yaxt="n",xlim = c(0,6),xaxt="n" , xlab = "Global Acive Power(killowatts)",ylab ="FREQUENCY",main = "Global Active Power")
axis(1, at=seq(0,6,by=2), labels=seq(0,6,by=2) )
axis(2, at=seq(0,1200,by=200), labels=seq(0,1200,by=200))
