cat("\f")
rm(list = ls())


library(dplyr)
setwd("C:/Users/20287/Documents/DFS/XXR/Coursera")
df <- read.csv('./data/household_power_consumption.txt', 
               header = TRUE, sep = ';', stringsAsFactors = F, na.strings="?")
colnames(df) <- tolower(colnames(df)) 

df$date <- as.Date(df$date, "%d/%m/%Y")
df <- df %>% filter(date  >= as.Date("2007-02-01") &  date  <= as.Date("2007-02-02")) %>% 
  mutate_at(c(3:8), as.numeric) %>% 
  mutate(datetime = as.POSIXct(paste(date, time)))



# Make Plot 4
par(mfrow=c(2,2))
with(df, {
  plot(global_active_power~datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  plot(voltage~datetime, type="l", ylab="Voltage (volt)", xlab="")
  plot(sub_metering_1~datetime, type="l",  ylab="Global Active Power (kilowatts)", xlab="")
  lines(sub_metering_2~datetime,col='Red')
  lines(sub_metering_3~datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(global_reactive_power~datetime, type="l", ylab="Global Rective Power (kilowatts)",xlab="")
})
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()



