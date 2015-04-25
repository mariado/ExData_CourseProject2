# Question 2
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (flips = "24510") from 1999 to 2008?
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregate total emissions from PM2.5 for Baltimore City, Maryland from 1999 to 2008
baltimore <- NEI[NEI$fips=="24510",]
Total <- aggregate(Emissions ~ year, baltimore,sum)

# Output
png("plot2.png")

barplot(
	Total$Emissions,
	names.arg = Total$year,
	xlab = "Year",
	ylab = "Emissions (Tons)",
	main = "Total Emissions in Baltimore City, Marylands"
	)
	
dev.off()	
	