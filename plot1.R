library(dplyr)

#Import data
source("Data.R")

#Aggregating the data
pmsum = aggregate(pm0$Emissions, by=list(year=pm0$year),sum)
colnames(pmsum) = c("year","emissions")

#making a plot
png(file="./images/plot1.png", width = 600, height = 600)

barplot(pmsum$emissions,pmsum$year, names=pmsum$year,
        xlab = "Year", ylab = "Emissions", 
        main = "Total Emissions by Year")

dev.off()