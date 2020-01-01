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



# Make Plot 2
with(df, plot(global_active_power~datetime, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()



