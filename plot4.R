power = read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("?"))

stpower = subset(power, Date=="01/02/2007" | Date=="02/02/2007")

power$DateTime = strptime(paste(power$Date, power$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

quartz()

#4x4

with(par(mfrow =c(2,2)))

#topleft

with(plot(power$DateTime, power$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

#topright
with(plot(power$DateTime, power$Voltage, type="l", xlab="datetime", ylab="Voltage"))

#bottomleft
with(plot(power$DateTime, power$Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))

with(lines(power$DateTime, power$Sub_metering_2, type="l", col="red", ylab="Energy sub metering", xlab=""))

with(lines(power$DateTime, power$Sub_metering_3, type="l", col="blue", ylab="Energy sub metering", xlab=""))

with(legend("topright", pch=45, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")))

#bottomright
with(plot(power$DateTime, power$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))

dev.copy(png, file="plot4.png", bg="white")

dev.off()
