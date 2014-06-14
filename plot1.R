data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",
                   stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")

d <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

x <- d$Global_active_power
hist(x,
     main="Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col="red")