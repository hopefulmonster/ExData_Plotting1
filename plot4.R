### reads the data file skipping to the relevant lines
### and replaces the relevant column headings

dat3 <- read.table(file = "household_power_consumption.txt", sep = ";", 
                  skip = 66637, nrows = 2880)
names(dat3)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
	"Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

### creates a PNG graphics device with required width and height

png(file = "plot4.png", height = 480, width = 480, units = "px")

### sets the 2x2 plot window

par(mfrow =c(2,2))

#### create plot 1

days<-c("Thu", "Fri", "Sat")
with(dat2, plot(Global_active_power, type = "l", xaxt = "n", 
	ylab = "Global Active Power", xlab = ""))
axis(1, at=c(1,1440, 2880), labels = days)

#### create plot 2

with(dat3, plot(dat3$Voltage, type = "l", xaxt = "n", 
	ylab = "Voltage", xlab = "datetime"))
axis(1, at=c(1,1440, 2880), labels = days)

#### create plot 3

with(dat3, plot(dat3$Sub_metering_1, type = "l", xaxt = "n", 
	ylab = "Energy sub metering", xlab = ""))
axis(1, at=c(1,1440, 2880), labels = days)
lines(Sub_metering_2, col = "Red")
lines(Sub_metering_3, col = "Blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
	lty = c(1,1,1), col= c("Black", "Red", "Blue"))

### create plot 4

with(dat3, plot(dat3$Global_reactive_power, type = "l", xaxt = "n", 
	ylab = "Global_reactive_power", xlab = "datetime"))
axis(1, at=c(1,1440, 2880), labels = days)

dev.off()