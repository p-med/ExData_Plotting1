#Plot 1
library(dplyr)
library(here)

data <- read.csv(here("./data/2007_power_consumption.csv"), sep = ",")

dev.new(width = 480, height = 480, unit = "px") #noRStudioGD = TRUE)

hist(data$Global_active_power,
     plot = T,
     #xlim = c(0, 6),
     ylim = c(0, 1200),
     xlab = "Global Active Power (kilowats", 
     ylab = "Frequency", 
     main = "Global Active Power",
     col = "red")

# Save to PNG

dev.copy(png, file = "plot1.png")

