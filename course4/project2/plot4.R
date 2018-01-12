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
match_coal=grepl("coal",sapply(nei_scc_join$Short.Name,tolower))
nei_scc_plot4_temp=nei_scc_join[match_coal[],]
nei_scc_plot4=aggregate(nei_scc_plot4_temp$Emissions ~ nei_scc_plot4_temp$year , nei_scc_plot4_temp , sum)
colnames(nei_scc_plot4)=c("plot_year","plot_emissions")
#plotting
png("plot4.png", width=480, height=480)
barplot(nei_scc_plot4$plot_emissions,nei_scc_plot4$plot_year,xlab="year",ylab="Emissions pm2.5",main="emissions per year in for coal combustion sources")
dev.off()