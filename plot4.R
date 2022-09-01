library(dplyr)
library(ggplot2)

#Import data
pm0 = readRDS("./data/summarySCC_PM25.rds")
scc = readRDS("./data/Source_Classification_Code.rds")

#Fetch SC Codes related to coal
coal = scc %>% filter(grepl('Coal', EI.Sector, ignore.case = T))

#Filter the original data for coal
coal = subset(pm0, pm0$SCC %in% coal$SCC)

#Aggregate the data by year
coalagg = aggregate(coal$Emissions, by = list(Year = coal$year), sum)

#Make a plot
coalplot = ggplot(coalagg, aes(x = factor(Year), y = x))
coalplot + labs(title = "Coal Emissions", x = "Emissions",  y = "Year") + geom_col(fill = "red")

#Save the plot
ggsave("images/plot4.png")
