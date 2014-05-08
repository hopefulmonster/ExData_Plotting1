### reads the data file skipping to the relevant lines

dat3 <- read.table(file = "household_power_consumption.txt", sep = ";", 
                  skip = 66637, nrows = 2880)

### replaces the relevant column headings

names(dat3)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
	"Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

### creates a PNG graphics device with required width and height

png(file = "plot3.png", height = 480, width = 480, units = "px")

days<-c("Thu", "Fri", "Sat")

### plots the axis with Sub_metering_1 variable in black, supressing the x axis ticks

with(dat3, plot(dat3$Sub_metering_1, type = "l", xaxt = "n", 
	ylab = "Energy sub metering", xlab = ""))

### adds the ticks and the lines for Sub_metering _2 and 3

axis(1, at=c(1,1440, 2880), labels = days)
lines(Sub_metering_2, col = "Red")
lines(Sub_metering_3, col = "Blue")

### Creates the legend

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
	lty = c(1,1,1), col= c("Black", "Red", "Blue"))

dev.off()


