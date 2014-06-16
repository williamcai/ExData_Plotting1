# coursera: Exploratory Data Analysis
# course project 
# Plot 3

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
d$Time <- strptime(paste(d$Date,d$Time),"%Y-%m-%d %X")

# ---------------------------------------------------------------
# plot
x <- d$Time
y1 <- d$Sub_metering_1
y2 <- d$Sub_metering_2
y3 <- d$Sub_metering_3
plot(x,y1,type="n",xlab="",ylab="Energy sub metering")
lines(x,y1,col="black")
lines(x,y2,col="red")
lines(x,y3,col="blue")
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),
       col=c("black","red","blue"))