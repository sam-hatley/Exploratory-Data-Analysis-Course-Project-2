library(ggplot2)
library(dplyr)

#Import data
pm0 = readRDS("./data/summarySCC_PM25.rds")
pm0 = data.table::as.data.table(pm0)

#Filter for Baltimore
balt = pm0[fips == "24510"]

#Summarize by year, type and total emissions
balt = group_by(balt,year,type)
balt = summarize(balt,Emissions = sum(Emissions))

#Make a plot
bplot = ggplot(balt, aes(x = factor(year), y = Emissions)) + geom_col() + facet_grid(. ~ type)

#Save the plot
ggsave("images/plot3.png", plot = bplot)
