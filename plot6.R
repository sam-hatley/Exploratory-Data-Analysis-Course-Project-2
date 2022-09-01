library(dplyr)
library(ggplot2)
library(patchwork)

#Import data
pm0 = readRDS("./data/summarySCC_PM25.rds")
scc = readRDS("./data/Source_Classification_Code.rds")
source(plot5.R)

#Fetch SC Codes related to vehicles
carcodes = scc %>% filter(grepl('Vehicles', EI.Sector, ignore.case = T))

#Filter the original data for vehicles
bost = pm0 %>% filter(fips == "24510" & pm0$SCC %in% carcodes$SCC) 
la = pm0 %>% filter(fips == "06037" & pm0$SCC %in% carcodes$SCC) 


bostagg = aggregate(bost$Emissions, by = list(Year = bost$year), sum)
laagg = aggregate(la$Emissions, by = list(Year = la$year), sum)

bostplot = ggplot(bostagg, aes(x = factor(Year), y = x)) + geom_col(fill = "blue") + labs(title = "Boston", x = "Year", y = "Emissions")
laplot = ggplot(laagg, aes(x = factor(Year), y = x)) + geom_col(fill = "red") + labs(title = "LA", x = "Year", y = "Emissions")
bostplot + laplot

ggsave("images/plot6.png", height = 800, width = 1000, units = "px", dpi = 100)
