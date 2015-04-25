# Question 4
# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset coal combustion-related sources.

combustion <- grepl("combustion",SCC$SCC.Level.One,ignore.case=TRUE)
coal <- grepl("coal",SCC$SCC.Level.Four,ignore.case=TRUE)
coalCombustion <- (combustion & coal)
combustionSCC <- SCC[coalCombustion,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]

# Output
library(ggplot2)

png("plot4.png")

ggplot(combustionNEI,
       aes(factor(year),Emissions/10^5)) +
         geom_bar(stat="identity") +
         labs(x="year", y=expression("Emissions (10^5)")) +
         labs(title= expression("Coal Combustion Source Emissions Across US"))
       
dev.off()       
