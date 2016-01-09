power = read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("?"))

stpower = subset(power, Date=="01/02/2007" | Date=="02/02/2007")

power$DateTime = strptime(paste(power$Date, power$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

quartz()

with(plot(power$DateTime, power$Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))

with(lines(power$DateTime, power$Sub_metering_2, type="l", col="red", ylab="Energy sub metering", xlab=""))

with(lines(power$DateTime, power$Sub_metering_3, type="l", col="blue", ylab="Energy sub metering", xlab=""))

with(legend("topright", pch=45, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")))

dev.copy(png, file="plot3.png", bg="white")

dev.off()