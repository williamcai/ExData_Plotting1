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
# Plot 4
# ---------------------------------------------------------------
# subsettig data
# ---------------------------------------------------------------
d <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]
d$Time <- strptime(paste(d$Date,d$Time),"%Y-%m-%d %X")

# plot
# ---------------------------------------------------------------
png(filename = "Plot4.png")

# 2x2 frame
par(mfcol=c(2,2),mfrow=c(2,2))

# ----------
# topleft
# ----------
x <- d$Time
y <- d$Global_active_power
plot(x,y,type="n",xlab="",ylab="Global Active Power")
lines(x,y)

# ----------
# topright
# ----------
v1 <- d$Voltage
plot(x,v1,type="n",xlab="datetime",ylab="Voltage")
lines(x,v1)

# ----------
# bottomleft
# ----------
y1 <- d$Sub_metering_1
y2 <- d$Sub_metering_2
y3 <- d$Sub_metering_3
plot(x,y1,type="n",xlab="",ylab="Energy sub metering")
lines(x,y1,col="black")
lines(x,y2,col="red")
lines(x,y3,col="blue")
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),cex=0.8,
       col=c("black","red","blue"))
# ----------
# bottomright
# ----------
v2 <- d$Global_reactive_power
plot(x,v2,type="n",xlab="datetime",ylab="Global_reactive_power")
lines(x,v2)
dev.off()
# ---------------------------------------------------------------

