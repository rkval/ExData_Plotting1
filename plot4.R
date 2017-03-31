
#Plot 4:

library(dplyr)
par(mfrow=c(1,1))
png('plot4.png')

hpc <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")
hpc <- mutate(hpc, Date=as.Date(hpc$Date,format="%d/%m/%Y"))
set1 <- filter(hpc, Date == "2007-02-01")
set2 <- subset(hpc, Date == "2007-02-02")

set3 <- rbind(set1,set2)

NewDT <- strptime(paste(set3$Date,set3$Time), format = "%Y-%m-%d %H:%M:%S")

set4 <- cbind(set3,NewDT)

par(mfrow=c(2,2))

plot(set4$NewDT,set4$Global_active_power,xlab="",ylab="Global Active Power", type = "l")

plot(set4$NewDT,set4$Voltage,xlab="datetime",ylab="Voltage", type = "l")

with(set4, plot(NewDT,Sub_metering_1, col="black", type="l", xlab = "", ylab="Energy sub metering"))
with(set4, points(NewDT,Sub_metering_2, col="red", type="l"))
with(set4, points(NewDT,Sub_metering_3, col="blue", type="l"))
legend("topright", pch = "___", lwd=2, inset=0,cex=0.55,bty="n",
       col = c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


plot(set4$NewDT,set4$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power", type = "l")

dev.off()