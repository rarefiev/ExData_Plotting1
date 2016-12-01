df <- read.csv('./household_power_consumption.txt', sep = ';', na.strings = '?', comment.char = '')
df$Date <- as.Date(strptime(df$Date, "%d/%m/%Y"))
png(filename = 'plot1.png', bg = 'transparent', width = 480, height = 480)
hist(subset(df, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))$Global_active_power, 
     xlab = "Global Active Power (kilowatts)", 
     ylab = 'Frequency', 
     col = 'red', 
     main = "Global Active Power")
dev.off()
