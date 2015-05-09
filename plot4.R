# Get the data from the file
data_set <- read.table("./household_power_consumption.txt",
						header=T,
						sep=';',
						na.strings="?", 
						nrows=2075259,
						check.names=F,
						stringsAsFactors=F,
						comment.char="",
						quote='\"')
					
data_set$Date <- as.Date(data_set$Date, format="%d/%m/%Y")

# make subsets
data <- subset(data_set,
			   subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_set)

# Convert dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# Generate and save Plot4.png
message("Global Active Power Plot 4")

par(mfrow=c(2,2))

with(data, {

    plot(Datetime,
		 Global_active_power,
		 type="l",
		 xlab="",
         ylab="Global Active Power (kilowatts)")
		 
    plot(Datetime,
		 Voltage,
		 type="l",
		 xlab="",
         ylab="Voltage (volt)")
		 
    plot(Datetime,
		 Sub_metering_1,
		 type="l",
		 xlab="",
         ylab="Global Active Power (kilowatts)")
		 
    lines(Datetime,
		  Sub_metering_2,
		  col='Red')
		  
    lines(Datetime,
		  Sub_metering_3,
		  col='Blue')

	legend(
		'topright',
		c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
		col = c('black','red','blue'), 
		lty = 1, 
		lwd = 2,
		bty="n"
	)		  

    plot(Datetime,
		 Global_reactive_power,
		 type="l", 
		 xlab="",
         ylab="Global Rective Power (kilowatts)")
})

# Create file
dev.copy(png,
		 file="plot4.png",
		 width=480,
		 height=480,
		 units="px",
		 bg="transparent")

dev.off()
