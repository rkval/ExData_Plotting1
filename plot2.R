#Plot 2:

library(dplyr)
par(mfrow=c(1,1))
png('plot2.png')

hpc <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")
hpc <- mutate(hpc, Date=as.Date(hpc$Date,format="%d/%m/%Y"))
set1 <- filter(hpc, Date == "2007-02-01")
set2 <- subset(hpc, Date == "2007-02-02")
set3 <- rbind(set1,set2)

NewDT <- strptime(paste(set3$Date,set3$Time), format = "%Y-%m-%d %H:%M:%S")

set4 <- cbind(set3,NewDT)

plot(set4$NewDT,set4$Global_active_power,xlab='',ylab="Global Active Power (kilowatts)", type = "l")

dev.off()