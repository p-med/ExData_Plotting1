# Plot 3

library(dplyr)
library(here)
library(lubridate)

#data <- read.csv(here("./data/2007_power_consumption.csv"), sep = ",")
windows(width = 5, height = 5)
dev.new(width = 480, height = 480, unit = "px")

with(data, plot(data$Sub_metering_1, 
                #xlim = c("Thu", "Fri", "Sat"),
                type = "s",
                xlab = "",
                ylab = "Energy Sub metering"
))

lines(data$Sub_metering_2, col="red")
lines(data$Sub_metering_3, col="blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, cex = 0.75)

dev.copy(png, file = "plot3.png")

dev.off()
