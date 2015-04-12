# Download and extract data file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
              destfile = "household_power_consumption.zip", method="curl")
unzip("household_power_consumption.zip")

# Read data into a dataframe 
hpc = read.csv("household_power_consumption.txt", sep = ";", header = TRUE)

# Add a new observation which combines date and time together
hpc$DateTime = strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")

# Convert Date observation to a Date type
hpc$Date = as.Date(hpc$Date, "%d/%m/%Y")

# We are only going to be using data from 2007-02-01 and 2007-02-02
startDate = as.Date("2007-02-01", "%Y-%m-%d")
endDate = as.Date("2007-02-02", "%Y-%m-%d")
hpc = subset(hpc, Date >= startDate & Date <= endDate)

#---------------------------------
# Plot2 construction starts here
#---------------------------------
png("plot2.png", width = 480, height = 480, units = "px")
plot(hpc$DateTime,
     as.numeric(as.character(hpc$Global_active_power)), 
     type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
