# plot2.R
source("Preprocess.R")
#extract Baltimore City (fips: 24510) emissions
bcEmi = subset(NEI, fips==24510)
#total emissions in Baltimore City in 1999, 2002, 2005, 2008
totalEmibc = aggregate(Emissions ~ year, data=bcEmi, sum)

png(filename="plot2.png", width=480, height=480, units="px")
plot(totalEmibc$Emissions, type="b", col = "red", lwd = 3,
     xaxt="n",  xlab="Year", 
     ylab=expression(PM[2.5]~Emissions~(`in`~tons)), 
     main=expression(Total~PM[2.5]~Emissions~`in`~Baltimore~City))
axis(1, at=c(1:4), labels=c("1999", "2002", "2005", "2008"))
dev.off()