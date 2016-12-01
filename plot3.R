df <- read.csv('./household_power_consumption.txt', sep = ';', na.strings = '?', comment.char = '')
df$Datetime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
my_df <- subset(df, 
                Datetime >= strptime("2007-02-01 00:00:00", "%Y-%m-%d %H:%M:%S") & Datetime < strptime("2007-02-03 00:00:00", "%Y-%m-%d %H:%M:%S"))
png(filename = 'plot3.png', bg = 'transparent', width = 480, height = 480)
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
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 2, col = c('black', 'red', 'blue'))
dev.off()
