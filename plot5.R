library(dplyr)
library(ggplot2)

#Import data
pm0 = readRDS("./data/summarySCC_PM25.rds")
scc = readRDS("./data/Source_Classification_Code.rds")

#Fetch SC Codes related to vehicles
carcodes = scc %>% filter(grepl('Vehicles', EI.Sector, ignore.case = T))

#Filter the original data for vehicles
cars = pm0 %>% filter(fips == "24510" & pm0$SCC %in% carcodes$SCC) 

#Let's make the EI data more readable
carcodes$EI.Sector = as.character(carcodes$EI.Sector)
carcodes$EI.Sector[carcodes$EI.Sector == "Mobile - On-Road Gasoline Light Duty Vehicles"] <- "Light Gas"
carcodes$EI.Sector[carcodes$EI.Sector == "Mobile - On-Road Gasoline Heavy Duty Vehicles"] <- "Heavy Gas"
carcodes$EI.Sector[carcodes$EI.Sector == "Mobile - On-Road Diesel Light Duty Vehicles"] <- "Light Diesel"
carcodes$EI.Sector[carcodes$EI.Sector == "Mobile - On-Road Diesel Heavy Duty Vehicles"] <- "Heavy Diesel"
carcodes$EI.Sector = as.factor(carcodes$EI.Sector)

#subset for just the rows we want
carcodes = carcodes[c("SCC","EI.Sector")]

#Match the categories with the defined categories
cars = data.frame(Emissions = cars$Emissions,Cat = carcodes[match(cars$SCC,carcodes$SCC),2], Year = cars$year)

#Aggregate by year
carsagg = cars %>% group_by(Year, Cat) %>% summarize(Emissions = sum(Emissions))

#Make a plot
carplot = ggplot(carsagg, aes(x = factor(Year), y = Emissions)) + geom_col(fill = "blue")
carplot + facet_grid(. ~ Cat)

#Save the plot
ggsave("images/plot5.png", height = 600, width = 800, units = "px", dpi = 100)
