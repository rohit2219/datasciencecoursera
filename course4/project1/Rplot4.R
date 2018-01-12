
png("plot4.png", width=480, height=480)

setwd(dir = "C:/Users/Rohit/Desktop/HigherStudies/homework/course4/household_power_consumption/")
# because mostly the same variable would have been rea in other plots
if (  exists("df_pow") == FALSE){
  df_pow <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
}
df_pow_graph=df_pow[df_pow$Date=="1/2/2007" | df_pow$Date=="2/2/2007" ,TRUE]
yaxistime=strptime(paste(df_pow_graph$Date, df_pow_graph$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
global_active_power=as.numeric(df_pow_graph$Global_active_power)
global_reactive_power=as.numeric(df_pow_graph$Global_reactive_power)
voltage=as.numeric(df_pow_graph$Voltage)
par("mar")
par(mfrow = c(2,2))
par("mar")

plot(yaxistime,global_active_power,type = "l",xlab="", ylab="Global Active Power ")
plot(yaxistime,voltage,type = "l",xlab="datetime", ylab="Voltage ")
s1=as.numeric(df_pow_graph$Sub_metering_1)
s2=as.numeric(df_pow_graph$Sub_metering_2)
s3=as.numeric(df_pow_graph$Sub_metering_3)
##
plot(yaxistime,s1,type = "l",xlab="", ylab="Energy Sub metering", col = "violet")
lines(yaxistime,s2,type = "l",col = "red")
lines(yaxistime,s3,type = "l",col = "blue")
##
legend(x="topright",legend = c("Sub_Meter_1","Sub_Meter_2","Sub_Meter_3"), lty=c(), col = c("violet","red","blue") )

plot(yaxistime,global_reactive_power,type = "l",xlab="datetime", ylab="global_reactive_power")
dev.off()
