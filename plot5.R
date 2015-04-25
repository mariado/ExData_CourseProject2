# Question 5
# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset motor vehicles in Baltimore City

vehicles <- grepl("vehicle", SCC$SCC.Level.Two,ignore.case= TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]
baltimoreVehicles <- vehiclesNEI[vehiclesNEI$fips==24510,]

# Output
library(ggplot2)

png("plot5.png")

ggplot(baltimoreVehicles,
       aes(factor(year),Emissions)) +
  geom_bar(stat="identity", fill=grey, width=0.75) +
  labs(x="year", y="Emission") +
  labs(title = "Motor Vehicle Source Emissions in Baltimore")

dev.off()

