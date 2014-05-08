### reads the data file skipping to the relevant lines

dat1 <- read.table(file = "household_power_consumption.txt", sep = ";", 
                  skip = 66637, nrows = 2880)

### replaces the relevant column headings

names(dat1)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
	"Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

### creates a PNG graphics device with required width and height

png(file = "plot1.png", height = 480, width = 480, units = "px")

### plots the graph

plot1<-hist(Global_active_power, col = "Red", main = "Global Active Power", 
	xlab = "Global Active Power (kilowatts)")
dev.off()