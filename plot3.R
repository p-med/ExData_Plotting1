# Plot 3

library(dplyr)
library(here)
library(lubridate)

#data <- read.csv(here("./data/2007_power_consumption.csv"), sep = ",")

dev.new(width = 480, height = 480, unit = "px")

with(data, plot(data$Sub_metering_1, 
                #xlim = c("Thu", "Fri", "Sat"),
                type = "s",
                xlab = "",
                ylab = "Energy Sub metering"
))

lines(data$Sub_metering_2, col="red")
lines(data$Sub_metering_3, col="blue")

legend("topright", legend = c("Submetering_1", "Submetering_2", "Submetering_3"), 
       col = c("black", "red", "blue"), lty = 1)

dev.copy(png, file = "plot3.png")

dev.off()
