#common
#setwd(dir = "G:/Rohit/HigherStudies/homework/course4/project2")
library(ggplot2)
if (  exists("nei") == FALSE){
  nei <- readRDS("data/summarySCC_PM25.rds")
}
if (  exists("scc") == FALSE){
  scc <- readRDS("data/Source_Classification_Code.rds")
}
if (  exists("nei_scc_join") == FALSE){
  nei_scc_join <- merge(x=nei,y=scc,by = "SCC")
}
print("load done")

#data extraction
nei_scc_plot2_bmore = nei_scc_join[ nei_scc_join$fips == "24510" ,] 
nei_scc_plot2=aggregate( nei_scc_plot2_bmore$Emissions ~ nei_scc_plot2_bmore$year , nei_scc_plot2_bmore , sum )
colnames(nei_scc_plot2)=c("plot_year","plot_emissions")
print("done xtraction")
#plotting
png("plot2.png", width=480, height=480)
barplot(nei_scc_plot2$plot_emissions,nei_scc_plot2$plot_year,xlab="year",ylab="Emissions pm2.5",main="emissions per year in Baltimore fips 24510")
dev.off()
