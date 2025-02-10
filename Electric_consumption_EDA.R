# Loading packages
library(dplyr)
library(here)
library(lubridate)
library(sqldf)

# Load file

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

#Set-up directory for work and data

if(!dir.exists("./data")){dir.create(here("./data"))}

# Loading data

temp <- tempfile() #Temporary variable to save zip file
download.file(url,temp)
zip_names <- unzip(temp, list = TRUE) #Explore and store zip file
zip_list <- as.vector(zip_names[,1])

  # Read table in data frame

df <- read.table(unz(temp, zip_list), header = T, fill = T, sep = ";")
power_consumption <- dplyr::filter(df, grepl("2007", df$Date)) #subset data for 2007
rm(df) #Delete full table

unlink(temp) #Delete temporary file
rm(temp)
  

  # Format variables

power_consumption <- power_consumption %>% 
  mutate(Date = as.Date(Date, format = "%d/%m/%Y"),
         Time = hms(Time),
         Global_active_power = as.numeric(Global_active_power, na.rm = TRUE),
         Global_reactive_power = as.numeric(Global_reactive_power, na.rm = TRUE),
         Voltage = as.numeric(Voltage, na.rm = TRUE),
         Global_intensity = as.numeric(Global_intensity, na.rm = TRUE),
         Sub_metering_1 = as.numeric(Sub_metering_1, na.rm = TRUE),
         Sub_metering_2 = as.numeric(Sub_metering_2, na.rm = TRUE),
         Sub_metering_3 = as.numeric(Sub_metering_3, na.rm = TRUE))

power_consumption <- filter(power_consumption, 
                            between(Date, 
                                    as.Date("2007-02-01"), 
                                    as.Date("2007-02-02")))

  #Save data set under data dir
write.csv(power_consumption, "./data/2007_power_consumption.csv")

