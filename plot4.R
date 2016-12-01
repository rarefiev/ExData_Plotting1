df <- read.csv('./household_power_consumption.txt', sep = ';', na.strings = '?', comment.char = '')
df$Datetime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
my_df <- subset(df, 
                Datetime >= strptime("2007-02-01 00:00:00", "%Y-%m-%d %H:%M:%S") & Datetime < strptime("2007-02-03 00:00:00", "%Y-%m-%d %H:%M:%S"))
png(filename = 'plot4.png', bg = 'transparent', width = 480, height = 480)
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(1, 0, 2, 0))
# plot #1
with(my_df,
     plot(Datetime, Global_active_power, 
          type = 'l', 
          xlab = '', 
          ylab = 'Global Active Power'))

# plot #2s
with(my_df,
     plot(Datetime, Voltage, 
          type = 'l', 
          xlab = 'datetime', 
          ylab = 'Voltage'))

# plot #3

with(my_df, plot(Datetime, Sub_metering_1, 
                 type = 'l',
                 col = 'black',
                 xlab = '', 
                 ylab = 'Energy sub metering'))
with(my_df, points(Datetime, Sub_metering_2, 
                   type = 'l',

                   col = 'red'))
with(my_df,  points(Datetime, Sub_metering_3, 
                    type = 'l',
                    col = 'blue'))
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), bty = 'n', lwd = 2, col = c('black', 'red', 'blue'))

# plot #4
with(my_df,
     plot(Datetime, Global_reactive_power, 
          type = 'l', 
          xlab = 'datetime'
          ))
dev.off()
