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
match_motor=grepl("motor",sapply(nei_scc_join$Short.Name,tolower))
nei_scc_plot5_temp=nei_scc_join[match_motor[],]
nei_scc_plot5= aggregate(nei_scc_plot5_temp$Emissions ~ nei_scc_plot5_temp$year , nei_scc_plot5_temp , sum) 
colnames(nei_scc_plot5)=c("plot_year","plot_emissions")
#plotting
png("plot5.png", width=480, height=480)
barplot(nei_scc_plot5$plot_emissions,nei_scc_plot5$plot_year,xlab="year",ylab="Emissions pm2.5",main="emissions per year in for Motor  vehicle sources in baltimore")
dev.off()