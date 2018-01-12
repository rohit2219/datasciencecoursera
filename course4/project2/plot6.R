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
nei_scc_plot6_bmore_la = nei_scc_join[nei_scc_join$fips == "24510"  | nei_scc_join$fips == "06037",]
nei_scc_plot6=aggregate(nei_scc_plot6_bmore_la$Emissions ~ nei_scc_plot6_bmore_la$year + nei_scc_plot6_bmore_la$fips, nei_scc_plot6_bmore_la , sum)
colnames(nei_scc_plot6)=c("plot_year","plot_fips","plot_emission")
#plotting
png("plot6.png", width=480, height=480)
p = ggplot ( data = nei_scc_plot6 , aes(x=nei_scc_plot6$plot_year,y=nei_scc_plot6$plot_emission,group = plot_fips , color = plot_fips )) + geom_line()+ ggtitle("Emissions for baltimore(fips 24510) and LA (fips 06037) each year ") + xlab("year") + ylab("emissons in baltimore and LA")
print(p)
dev.off()