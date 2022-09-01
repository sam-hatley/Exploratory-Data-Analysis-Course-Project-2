library(data.table)
library(ggplot2)
library(scattermore)
library(patchwork)

pm0 = readRDS("./data/summarySCC_PM25.rds")
pm0 = data.table::as.data.table(pm0)
scc = readRDS("./data/Source_Classification_Code.rds")



filteryear = function(year,df){
  
  
}

pl1 = ggplot(pm0, aes(x=year, y=Emissions)) + geom_scattermore(pointsize = 2)
pl2 = ggplot(pm0, aes(x=year, y=log10(Emissions))) + geom_scattermore(pointsize = 2)
pl1 + pl2

geom_sc