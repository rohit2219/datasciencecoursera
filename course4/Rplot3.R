png("plot3.png", width=480, height=480)
# because mostly the same variable would have been rea in other plots
if (  exists("df_pow") == FALSE){
  df_pow <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
}
df_pow_graph=df_pow[df_pow$Date=="1/2/2007" | df_pow$Date=="2/2/2007" ,TRUE]
y=strptime(paste(df_pow_graph$Date, df_pow_graph$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
s1=as.numeric(df_pow_graph$Sub_metering_1)
s2=as.numeric(df_pow_graph$Sub_metering_2)
s3=as.numeric(df_pow_graph$Sub_metering_3)
##
plot(y,s1,type = "l",xlab="", ylab="Energy Sub metering", col = "violet")
lines(y,s2,type = "l",col = "red")
lines(y,s3,type = "l",col = "blue")
##
legend(x="topright",legend = c("Sub_Meter_1","Sub_Meter_2","Sub_Meter_3"), lty=c(1,1), col = c("violet","red","blue") )
dev.off()