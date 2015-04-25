# Question 3
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Use the ggplot2 plotting system to make a plot answer this question.
library(ggplot2)

baltimore <- NEI[NEI$fips=="24510",]
Total <- aggregate(Emissions ~ year+type,baltimore,sum)

# Output
png("plot3.png")

qplot(
  x=year,
  y=Emissions,
  data=Total,
  color=type,
  geom=c("point","line"),
  aes(factor(year), Emissions),
  main="Total Emissions in Baltimore City, Maryland",
  xlab="Year",
  ylab="Emissions"
)

dev.off()
