# Question 1: 
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregate the total PM2.5 emission from all sources for for each of the years 1999, 2002, 2005 and 2008.

aggTotals <- aggregate(Emissions ~ year, NEI, sum)

# Using the base plotting system, now we plot the total PM2.5 Emissions from all sources.
png("plot1.png")

barplot(
	(aggTotals$Emissions)/10^6,
	names.arg = aggTotals$year,
	xlab = "Year",
	ylab = "Emissions (10^6 Tons)",
	main = "Total Emissions From All US Sources"
	)

dev.off()
