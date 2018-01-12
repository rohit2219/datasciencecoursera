png("plot2.png", width=480, height=480)
df_pow <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
df_pow_graph=df_pow[df_pow$Date=="1/2/2007" | df_pow$Date=="2/2/2007" ,TRUE]
x=as.numeric(df_pow_graph$Global_active_power)
y=strptime(paste(df_pow_graph$Date, df_pow_graph$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot(y,x,type = "l",xlab="", ylab="Global Active Power -kilowatts")
dev.off()