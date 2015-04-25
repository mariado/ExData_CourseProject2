# Question 6
# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

# Subset the vehicles NEI data by each city's fip and add city name.
Baltimore <- vehiclesNEI[vehiclesNEI$fips=="24510",]
Baltimore$city <- "Baltimore City"

LA <- vehiclesNEI[vehiclesNEI$fips=="06037",]
LA$city <- "Los Angeles County"

# Combine the two subsets with city name into one data frame
Cities <- rbind(Baltimore,LA)

png("plot6.png")

library(ggplot2)

ggplot(Cities, 
       aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~city) +
  guides(fill=FALSE) + theme_bw() +
  labs(x="Year", y="Emissions (Tons)") + 
  labs(title="Motor Vehicle Source Emissions in Baltimore & LA")

dev.off()
