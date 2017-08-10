# Coursera Data Science: Exploratory Data Analysis #

# WD i.e. file location

setwd("C:/Users/Farhan/Documents/R/Data science/Course 4/week 4")


# Load data from NEI and SCC

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# Create a Subset of the NEI data by using Baltimores FIP

baltimoreNEI <- NEI[NEI$fips=="24510",]


# Group sum total emissions by year for Baltimore 

aggTotalsBaltimore <- aggregate(Emissions ~ year, baltimoreNEI,sum)

png("plot3.png",width=480,height=480,units="px",bg="transparent")

library(ggplot2)

ggp <- ggplot(baltimoreNEI,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

print(ggp)

dev.off()