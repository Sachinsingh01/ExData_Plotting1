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
data <- subset(data_set, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_set)

# dates conversion
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# Generate and save Plot1.png
# png("plot1.png", width=480,height=480, units="px", bg="transparent")
message("Global Active Power Plot 1")
hist(
	data$Global_active_power,
	col="red", 
	main="Global Active Power", 
	xlab="Global Active Power (kilowatts)",
	ylab="Frequency"
)

# Create file
dev.copy(png,
		 file="plot1.png",
		 width=480,
		 height=480,
		 units="px",
		 bg="transparent")

dev.off()
