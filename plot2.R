# Plot 2
library(dplyr)
library(here)
library(lubridate)

data <- read.csv(here("./data/2007_power_consumption.csv"), sep = ",")

data$days <- lubridate::wday(as.Date(data$Date, format = "%Y-%m-%d"), label = T)
windows(width = 5, height = 5)

dev.new(width = 480, height = 480, unit = "px")


with(data, plot(Global_active_power, 
                #xlim = c("Thu", "Fri", "Sat"),
                type = "s",
                xlab = "",
                ylab = "Global Active Power (kilowatts)"
                ))

dev.copy(png, file = "plot2.png")

dev.off()
