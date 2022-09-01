library(dplyr)

#Import data
pm0 = readRDS("./data/summarySCC_PM25.rds")
pm0 = data.table::as.data.table(pm0)

#Filter for baltiomre
balt = pm0[fips == "24510"]

#Aggregating the data
pmsum = aggregate(balt$Emissions, by=list(year=balt$year),sum)
colnames(pmsum) = c("year","emissions")


#making a plot
png(file="./images/plot2.png", width = 600, height = 600)

barplot(pmsum$emissions,pmsum$year, names=pmsum$year,
        xlab = "Year", ylab = "Emissions", 
        main = "Total Emissions by Year",
        col = "blue")

dev.off()