# ---------------------------------------------------------------
# coursera: Exploratory Data Analysis
# course project 1
# ---------------------------------------------------------------

# load data from file:household_power_consumption.txt
# ---------------------------------------------------------------
data <- read.table("household_power_consumption.txt",
                   header=TRUE,
                   sep=";",
                   na.strings = "?",
                   stringsAsFactors = FALSE)
# convert date type
# ---------------------------------------------------------------
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# ---------------------------------------------------------------
# plot2
# ---------------------------------------------------------------
# subsettig data
# ---------------------------------------------------------------
d <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]
d$Time <- strptime(paste(d$Date,d$Time),"%Y-%m-%d %X")

# plot
# ---------------------------------------------------------------
x <- d$Time
y <- d$Global_active_power
png(filename = "Plot2.png")
plot(x,y,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(x,y)
dev.off()
# ---------------------------------------------------------------