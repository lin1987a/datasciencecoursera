#### importing data ...
old_wd <- getwd()

setwd("C:\\Users\\ylin\\Documents\\Git\\myWD\\course4\\data")
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

setwd(old_wd)

str(NEI)
str(SCC)

rm(list = setdiff(ls(), c("NEI", "SCC")))

library(dplyr)
library(lattice)
library(ggplot2)

## exploring question 1
# unique(NEI$year)
# sum <- NEI %>% group_by(year) %>% mutate(sum = sum(Emissions))
sum1 <- tapply(NEI$Emissions, NEI$year, sum)

plot(names(sum1), sum1, type = "b", pch = 19, col = "red",
     xlab = "Year", ylab = "Total PM2.5 Emissions (ton)",
     main = "PM2.5 Emissions in the US")
# boxplot(Emissions ~ year, data = NEI)

dev.copy(png, filename = "plot1.png")
dev.off()

## exploring question 2
sub2 <- subset(NEI, NEI$fips == "24510")
dim(sub2)
table(sub2$year)
head(sub2)
sum2 <- with(sub2, tapply(Emissions, year, sum))

plot(names(sum2), sum2, type = "b", pch = 19, col = "red",
     xlab = "Year", ylab = "Total PM2.5 Emissions (ton)",
     main = "PM2.5 Emissions in Baltimore City")
# with(sub2, boxplot(log10(Emissions) ~ year, 
#                    xlab = "Year", ylab = "log(PM2.5 Emissions (ton))",
#                    main = "Boxplot of PM2.5 Emissions in Baltimore City"))

dev.copy(png, filename = "plot2.png")
dev.off()

## exploring question 3
sub3 <- subset(NEI, NEI$fips == "24510")
sum3 <- sub3 %>% group_by(year, type) %>% summarise(sum = sum(Emissions))

qplot(year, sum, data = sum3, facets = .~type) + 
    geom_line(aes(color = "red")) +
    labs(y = "Total PM2.5 Emissions (ton)") +
    labs(title = "Total PM2.5 Emissions in Baltimore City")

dev.copy(png, "plot3.png", width = 960)
dev.off()

## exploring question 4

# check which category contains coal combustion-related sources
colnames(SCC)
levels(SCC$Option.Group)
levels(SCC$SCC.Level.One)
levels(SCC$SCC.Level.Two)
levels(SCC$SCC.Level.Three)
levels(SCC$SCC.Level.Four)

length(grep("[Cc]oal", levels(SCC$Short.Name))) #217
levels(SCC$Short.Name)[grep("[Cc]oal", levels(SCC$Short.Name))]
length(grep("[Cc]oal", levels(SCC$EI.Sector))) #3
levels(SCC$EI.Sector)[grep("[Cc]oal", levels(SCC$EI.Sector))]
length(grep("[Cc]omb", levels(SCC$SCC.Level.One))) # 3
levels(SCC$SCC.Level.One)[grep("[Cc]omb", levels(SCC$SCC.Level.One))]
length(grep("[Cc]oal", levels(SCC$SCC.Level.Two)))
length(grep("[Cc]oal", levels(SCC$SCC.Level.Three))) #13
levels(SCC$SCC.Level.Three)[grep("[Cc]oal", levels(SCC$SCC.Level.Three))]
length(grep("[Cc]oal", levels(SCC$SCC.Level.Four))) #77
levels(SCC$SCC.Level.Four)[grep("[Cc]oal", levels(SCC$SCC.Level.Four))] #77
length(levels(SCC$Short.Name))

# based on above, choose EI.Sector variable to identify the sources
seg <- levels(SCC$EI.Sector)[grep("[Cc]oal", levels(SCC$EI.Sector))]

sub4 <- NEI %>% left_join(SCC, by = "SCC") %>%
    filter(EI.Sector %in% seg)

# sanity check - looks like we captured all possible sources.
length(grep("[Cc]oal", levels(sub4$Short.Name))) #217
length(grep("[Cc]oal", levels(sub4$SCC.Level.Three))) #13
length(grep("[Cc]oal", levels(sub4$SCC.Level.Four))) #77

sub4 <- sub4 %>% group_by(year) %>% summarise(sum = sum(Emissions))
head(sub4)
str(sub4)

plot(sub4$year, sub4$sum, type = "b", pch = 19, col = "red",
     xlab = "Year", ylab = "Total PM2.5 Emissions (ton)",
     main = "Coal Combustion-related PM2.5 Emissions")

dev.copy(png, filename = "plot4.png")
dev.off()

## exploring question 5

# note: it is not quite clear about the definition of "motor vehicle sources".
# we assume we are looking for the vehicles "ON-ROAD"
sub5 <- subset(NEI, NEI$fips == "24510" & NEI$type == "ON-ROAD")

# note: the same as above, we are not limited us just in motorcycles, therefore
# we use "vehicle" as the key word to capture all types of vehicles.
# grep("[Mm]otor", levels(SCC$Short.Name), value = T)
seg <- grep("[Vv]ehicle", levels(SCC$Short.Name), value = T)

# grep("[Mm]otor", levels(SCC$SCC.Level.Three), value = T)
# seg <- grep("[Mm]otor", levels(SCC$SCC.Level.Three), value = T)
# SCC[SCC$Short.Name %in% seg, ]
sub5 <- sub5 %>% left_join(SCC, by = "SCC") %>% 
    filter(Short.Name %in% seg) %>% 
    group_by(year) %>% summarise(sum = sum(Emissions))

# grep("[Vv]ehicle", levels(sub5$Short.Name), value = T)

plot(sub5$year, sub5$sum, type = "b", pch = 19, col = "red",
     xlab = "Year", ylab = "Total PM2.5 Emissions (ton)",
     main = "Motor Vehicle-related PM2.5 Emissions in Baltimore City")

dev.copy(png, filename = "plot5.png")
dev.off()

## exploring question 6

# to keep consistency, we use the same assumptions we made on question 5.
sub6 <- subset(NEI, NEI$fips %in% c("24510", "06037") & NEI$type == "ON-ROAD")
seg <- grep("[Vv]ehicle", levels(SCC$Short.Name), value = T)
# SCC[SCC$Short.Name %in% seg, ]
sub6 <- sub6 %>% left_join(SCC, by = "SCC") %>% 
    filter(Short.Name %in% seg) %>% 
    group_by(fips, year) %>% summarise(sum = sum(Emissions))

# we use base ploting system, just becuase the scale of two plots are so
# different. The pattern for 24510 is more clear by using different y scale.

# xyplot(sum ~ year | fips, data = sub6, type = 'b', col = "red",
#        xlab = "Year", ylab = "Total PM2.5 Emissions (ton)",
#        main = "Motor Vehicle-related PM2.5 Emissions")
par(mfrow = c(1,2), cex.main = .8)
plot(sum ~ year, data = sub6[sub6$fips == "06037", ], type = 'b', col = "red",
       xlab = "Year", ylab = "Total PM2.5 Emissions (ton)",
       main = "LA County")
plot(sum ~ year, data = sub6[sub6$fips == "24510", ], type = 'b', col = "red",
     xlab = "Year", ylab = "Total PM2.5 Emissions (ton)",
     main = "Baltimore City")
mtext("Motor Vehicle-related PM2.5 Emissions", side = 3, 
      line = -1.5, outer = T, cex = 1.2, font = 2)

dev.copy(png, "plot6.png", width = 960)
dev.off()

