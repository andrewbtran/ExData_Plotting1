
power = read.table("household_power_consumption.txt", sep=";", header=TRUE)

power = subset(power, Date=="01/02/2007" | Date=="02/02/2007")

hist(power$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

quartz()

with(hist(power$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red"))

dev.copy(png, file="plot1.png", bg="white")

dev.off()
