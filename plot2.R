df <- read.csv('./household_power_consumption.txt', sep = ';', na.strings = '?', comment.char = '')
df$Datetime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
my_df <- subset(df, 
                Datetime >= strptime("2007-02-01 00:00:00", "%Y-%m-%d %H:%M:%S") & Datetime < strptime("2007-02-03 00:00:00", "%Y-%m-%d %H:%M:%S"))
png(filename = 'plot2.png', bg = 'transparent', width = 480, height = 480)
with(my_df,
     plot(Datetime, Global_active_power, 
          type = 'l', 
          xlab = '', 
          ylab = 'Global Active Power (kilowatts)'))
dev.off()
