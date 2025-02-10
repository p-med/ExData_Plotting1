#Plot 4

#library(dplyr)
#library(here)
#library(lubridate)

#data <- read.csv(here("./data/2007_power_consumption.csv"), sep = ",")
windows(width = 5, height = 5)
dev.new(width = 480, height = 480, unit = "px")

par(mfrow = c(2, 2)) #Set grid

  #Plot 1

with(data, plot(Global_active_power, 
                #xlim = c("Thu", "Fri", "Sat"),
                type = "s",
                xlab = "",
                ylab = "Global Active Power (kilowatts)"
))

  # Plot 2

with(data, plot(Voltage, 
                #xlim = c("Thu", "Fri", "Sat"),
                type = "s",
                xlab = "",
                ylab = "Voltage"
))

  #plot 3

with(data, plot(data$Sub_metering_1, 
                #xlim = c("Thu", "Fri", "Sat"),
                type = "s",
                xlab = "",
                ylab = "Energy Sub metering"
))

lines(data$Sub_metering_2, col="red")
lines(data$Sub_metering_3, col="blue")


legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, cex = 0.5)

  # Plot 4

with(data, plot(Global_reactive_power, 
                #xlim = c("Thu", "Fri", "Sat"),
                type = "s",
                xlab = "",
                ylab = "Global Rective Power (kilowatts)"
))

dev.copy(png, file = "plot4.png")

dev.off()
