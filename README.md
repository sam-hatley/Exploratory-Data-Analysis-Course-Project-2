# Exploratory Data Analysis: Course Project 2

## Contents
- [Requirements](#Requirements)
  - [Questions](#Questions)
  - [Plots](#Plots)
- [Data](#Data)
  - [Observations set](#observations-set)
  - [Sources Set](#sources-set)
- [Methodology](#Methodology)
  - [Data Cleaning](#data-cleaning)
  - [Total Emissions](#total-emissions)
  - [Baltimore City Emissions](#baltimore-city-emissions)
  - [Type Emissions](#type-emissions)
  - [US Coal Emissions](#us-coal-emissions)
  - [Motor Vehicle Sources](#Motor-Vehicle-Sources)
  - [Baltimore vs LA](#Baltimore-vs-LA)
- [Results](#Results)
- [Instructions & Files](#instructions-files)

## Requirements

### Questions
> You must address the following questions and tasks in your exploratory analysis. For each question/task you will need to make a single plot. Unless specified, you can use any plotting system in R to make your plot.
>1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the **base** plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
>2. Have total emissions from PM2.5 decreased in the *B*altimore City, Maryland** ```fips == "24510``` from 1999 to 2008? Use the **base** plotting system to make a plot answering this question.
>3. Of the four types of sources indicated by the ```type (point, nonpoint, onroad, nonroad)``` variable, which of these four sources have seen decreases in emissions from 1999–2008 for **Baltimore City**? Which have seen increases in emissions from 1999–2008? Use the **ggplot2** plotting system to make a plot answer this question.
>4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
>5. How have emissions from motor vehicle sources changed from 1999–2008 in **Baltimore City**?
>6. Compare emissions from motor vehicle sources in **Baltimore City** with emissions from motor vehicle sources in **Los Angeles County**, California ```fips == "06037"```. Which city has seen greater changes over time in motor vehicle emissions?

### Plots

>For each plot you should:
>- Construct the plot and save it to a PNG file.
>- Create a separate R code file (**plot1.R**, **plot2.R**, etc.) that constructs the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. Your code file should include code for reading the data so that the plot can be fully reproduced. You must also include the code that creates the PNG file. Only include the code for a single plot (i.e. plot1.R should only include code for producing plot1.png)
>- Upload the PNG file on the Assignment submission page
>- Copy and paste the R code from the corresponding R file into the text box at the appropriate point in the peer assessment.

## Data

The data was provided in a zip file available at [this link](https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip), and contained two _\*.rds_ files. These can be readily read in via ```readRDS("./data/filename")```.

The two files have different purposes: the _summarySCC\_PM25.rds_ file contains the observations, while the _Source\_Classification\_Code.rds_ file provides expanded definitions of terms refered to in the first file.

### Observations set

Our first data set has nearly 6.5 million observations and six variables, described in the assignment requirements:

>- **fips**: a five-digit number (represented as a string) indicating the U.S. County
>- **SCC**: The name of the source as indicated by a digit string (see source code classification table)
>- **Pollutant**: A string indicating the pollutant
>- **Emissions**: Amount of PM2.5 emitted, in tons
>- **type**: The type of source (point, non-point, on-road, or non-road)
>- **year**: The year of emissions recorded

Overall, this data set looks like this:

```
    fips      SCC Pollutant Emissions  type year
4  09001 10100401  PM25-PRI    15.714 POINT 1999
8  09001 10100404  PM25-PRI   234.178 POINT 1999
12 09001 10100501  PM25-PRI     0.128 POINT 1999
16 09001 10200401  PM25-PRI     2.036 POINT 1999
20 09001 10200504  PM25-PRI     0.388 POINT 1999
24 09001 10200602  PM25-PRI     1.490 POINT 1999
```

### Sources set

The first three columns of this data set looks like this:

```
       SCC Data.Category                                                                 Short.Name
1 10100101         Point                   Ext Comb /Electric Gen /Anthracite Coal /Pulverized Coal
2 10100102         Point Ext Comb /Electric Gen /Anthracite Coal /Traveling Grate (Overfeed) Stoker
3 10100201         Point       Ext Comb /Electric Gen /Bituminous Coal /Pulverized Coal: Wet Bottom
4 10100202         Point       Ext Comb /Electric Gen /Bituminous Coal /Pulverized Coal: Dry Bottom
5 10100203         Point                   Ext Comb /Electric Gen /Bituminous Coal /Cyclone Furnace
6 10100204         Point                   Ext Comb /Electric Gen /Bituminous Coal /Spreader Stoker
```
In total, there are 15 columns:

```
 [1] "SCC"                 "Data.Category"       "Short.Name"          "EI.Sector"           "Option.Group"        "Option.Set"         
 [7] "SCC.Level.One"       "SCC.Level.Two"       "SCC.Level.Three"     "SCC.Level.Four"      "Map.To"              "Last.Inventory.Year"
[13] "Created_Date"        "Revised_Date"        "Usage.Notes"        
```

This set is only really necessary in questions 4 & 5, when comparing emissions by source.

## Methodology

The requirements are clear that each plot needs to have an associated _*.R_ file.

### Data cleaning

### Total Emissions

### Baltimore City Emissions

### Type Emissions

### US Coal Emissions

### Motor Vehicle Sources

### Baltimore vs LA

## Results

## Instructions & Files
