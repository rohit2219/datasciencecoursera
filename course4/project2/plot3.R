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
nei_scc_plot3=aggregate(nei_scc_plot2_bmore$Emissions ~ nei_scc_plot2_bmore$year + nei_scc_plot2_bmore$type , nei_scc_plot2_bmore, sum)
colnames(nei_scc_plot3)=c("plot_year","plot_type","plot_emission")
#plotting
png("plot3.png", width=480, height=480)
p = ggplot ( data = nei_scc_plot3 , aes(x=nei_scc_plot3$plot_year,y=nei_scc_plot3$plot_emission,group = plot_type , color = plot_type )) + geom_line()
print(p)
dev.off()