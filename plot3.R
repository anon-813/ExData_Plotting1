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


# Make Plot 3
with(df, {
  plot(sub_metering_1~datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(sub_metering_2~datetime,col='Red')
  lines(sub_metering_3~datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("sub_metering_1", "sub_metering_2", "sub_metering_3"))

dev.copy(png,"plot3.png", width=480, height=480)
dev.off()




