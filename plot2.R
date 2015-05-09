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
datetime <- paste(as.Date(data$Date), 
				  data$Time)
data$Datetime <- as.POSIXct(datetime)

# Generate and save Plot2.png
message("Global Active Power Plot 2")
plot(data$Datetime,
	 data$Global_active_power,
	 type="l",
	 xlab="",
     ylab="Global Active Power (kilowatts)"
	 )
dev.copy(png,
		 file="plot2.png",
		 width=480,
		 height=480,
		 units="px",
		 bg="transparent")

dev.off()
