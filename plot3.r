# Loading provided datasets - loading from local machine
NEI <- readRDS("C:/Users/ewilli11/Documents/datascience/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/ewilli11/Documents/datascience/Source_Classification_Code.rds")

library(ggplot2)

# Sampling
NEI_sampling <- NEI[sample(nrow(NEI), size=5000, replace=F), ]

# Baltimore City, Maryland == fips
MD <- subset(NEI, fips == 24510)
MD$year <- factor(MD$year, levels=c('1999', '2002', '2005', '2008'))

# Generate the graph in the same directory as the source code
png(filename='C:/Users/ewilli11/Documents/datascience/plot3.png', width=800, height=500, units='px')

ggplot(data=MD, aes(x=year, y=log(Emissions))) + facet_grid(. ~ type) + guides(fill=F) +
  geom_boxplot(aes(fill=type)) + stat_boxplot(geom ='errorbar') +
  ylab(expression(paste('Log', ' of PM'[2.5], ' Emissions'))) + xlab('Year') + 
  ggtitle('Emissions per Type in Baltimore City, Maryland') +
  geom_jitter(alpha=0.10)

dev.off()