power = read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("?"))

stpower = subset(power, Date=="01/02/2007" | Date=="02/02/2007")

power$DateTime = strptime(paste(power$Date, power$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

quartz()

with(plot(power$DateTime, power$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

dev.copy(png, file="plot2.png")

dev.off()