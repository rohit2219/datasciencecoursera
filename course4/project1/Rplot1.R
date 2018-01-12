png("plot1.png", width=480, height=480)
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
 df_pow=read.csv("household_power_consumption.txt",header=TRUE,sep=";",colClasses = c("myDate",NA,NA,NA,NA,NA,NA,NA,NA))
df_pow_graph=df_pow[df_pow$Date=="2007-02-01" | df_pow$Date=="2007-02-02" ,TRUE]
## Note sure whY i have to do this but in my system, as.numeric is recalibrating the variable to *1000
x=as.numeric(df_pow_graph$Global_active_power)/1000
hist(x,col = "red",main = "Global Active Power",ylab = "Frequency",xlab="Global Active Power - Kilowatts")
dev.off()
