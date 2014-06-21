# plot6.R
source("Preprocess.R")

#get Baltimore City (fips: 24510) and LA (fips: 06037) motor vehicle emissions
motorEmi = subset(NEI, (type=="ON-ROAD" & (fips=="24510" | fips=="06037")))
#Rename columns
motorEmi <- transform(motorEmi,
                region = ifelse(fips == "24510", "Baltimore City", "Los Angeles County"))
#Summarize info
DataByYearAndRegion <- ddply(motorEmi, .(year, region), function(x) sum(x$Emissions))
colnames(DataByYearAndRegion)[3] <- "Emissions"

#Because off scale differences is neccesary to Normalize them to 1999 base line
#to improve the results interpretability 

Balt1999Emissions <- subset(DataByYearAndRegion,
                            year == 1999 & region == "Baltimore City")$Emissions
LAC1999Emissions <- subset(DataByYearAndRegion,
                           year == 1999 & region == "Los Angeles County")$Emissions
DataByYearAndRegionNorm <- transform(DataByYearAndRegion,
                                     EmissionsNorm = ifelse(region == "Baltimore City",
                                                            Emissions / Balt1999Emissions,
                                                            Emissions / LAC1999Emissions))

png("plot6.png", width=600)
qplot(year, EmissionsNorm, data=DataByYearAndRegionNorm, geom="line", color=region) +
        ggtitle(expression("Total" ~ PM[2.5] ~
                                   "Motor Vehicle Emissions Normalized to 1999 Levels")) +
        xlab("Year") +
        ylab(expression("Normalized" ~ PM[2.5] ~ "Emissions"))
dev.off()
