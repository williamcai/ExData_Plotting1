# coursera: Exploratory Data Analysis
# course project 
# Plot 1

# load data from file:household_power_consumption.txt
data <- read.table("household_power_consumption.txt",
					header=TRUE,
          sep=";",
					na.strings = "?",
					stringsAsFactors = FALSE)
# convert date type
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# subsettig data
d <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

# plot
hist(d$Global_active_power,
     main="Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col="red")