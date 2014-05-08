### reads the data file skipping to the relevant lines

dat2 <- read.table(file = "household_power_consumption.txt", sep = ";", 
                  skip = 66637, nrows = 2880)

### replaces the relevant column headings

names(dat2)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
	"Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

### creates a PNG graphics device with required width and height

png(file = "plot2.png", height = 480, width = 480, units = "px")

### creates a vector for the x axis label

days<-c("Thu", "Fri", "Sat")

### plots a line graph but supressing x axis ticks

with(dat2, plot(Global_active_power, type = "l", xaxt = "n", 
	ylab = "Global Active Power (kilowatts)", xlab = ""))

### creates tick marks
 
axis(1, at=c(1,1440, 2880), labels = days)
dev.off()
