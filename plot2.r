library(plyr)
library(ggplot2)

NEI <- readRDS("C:/Users/ewilli11/Documents/datascience/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/ewilli11/Documents/datascience/Source_Classification_Code.rds")

# Sampling
NEI_sampling <- NEI[sample(nrow(NEI), size=5000, replace=F), ]

# Subset data and append two years in one data frame
MD <- subset(NEI, fips=='24510')

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
# from 1999 to 2008? Use the base plotting system to make a plot answering this question.

# Generate the graph in the same directory as the source code
png(filename='C:/Users/ewilli11/Documents/datascience/plot2.png')

barplot(tapply(X=MD$Emissions, INDEX=MD$year, FUN=sum), 
        main='Total Emission in Baltimore City, MD', 
        xlab='Year', ylab=expression('PM'[2.5]))

dev.off()