#common
setwd(dir = "G:/Rohit/HigherStudies/homework/course4/project2")
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
nei_scc_plot1=aggregate(Emissions ~ year , nei_scc_join , sum)
#plotting
colnames(nei_scc_plot1) = c("plot1_year","plot1_emissions")
str(nei_scc_plot1)
png("plot1.png", width=480, height=480,units="px",bg="transparent")
barplot(nei_scc_plot1$plot1_emissions,nei_scc_plot1$plot1_year,ylab="Emissions pm2.5",xlab="year",main = "plot1 Total Emissions each year" )
dev.off()
