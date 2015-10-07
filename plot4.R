
#Reading data from source file
electricity <- read.table(file="household_power_consumption.txt", sep =";", header = TRUE)
              
# Subsetting and binding data
household_cons1 <- subset(electricity, Date == '1/2/2007') 
household_cons2 <- subset(electricity, Date == '2/2/2007')
household_cons <- rbind(household_cons1, household_cons2)
              
#Changing date and time
household_cons$DateTime <- paste(household_cons$Date, household_cons$Time)
household_cons$DateTime = as.POSIXlt(household_cons$DateTime,format="%d/%m/%Y %H:%M:%S")
              
#Converting factor to numeric
household_cons$Global_active_power<- as.numeric(as.character(household_cons$Global_active_power))
household_cons$Voltage <-as.numeric(as.character(household_cons$Voltage))
household_cons$Sub_metering_1<- as.numeric(as.character(household_cons$Sub_metering_1))
household_cons$Sub_metering_2<- as.numeric(as.character(household_cons$Sub_metering_2))
household_cons$Sub_metering_3<- as.numeric(as.character(household_cons$Sub_metering_3))
household_cons$Global_reactive_power<- as.numeric(as.character(household_cons$Global_reactive_power))

#Creating plots
par(mfrow=c(2,2))
#1
plot(household_cons$DateTime, household_cons$Global_active_power,type= "l", ylab = "Global Active Power",
     xlab = "")

#2
plot(household_cons$DateTime, household_cons$Voltage, type= "l", xlab = "datetime", ylab = "Voltage")

#3
plot(household_cons$DateTime, household_cons$Sub_metering_1,type = "l", ylab = "Energy sub metering", xlab = "")
lines(household_cons$DateTime, household_cons$Sub_metering_2, col="red")
lines(household_cons$DateTime, household_cons$Sub_metering_3, col="blue")
legend("topright", c("sub metering 1","sub metering 2","sub metering 3"),lty = 1, lwd = 1, col=c("black","red", "blue"), cex = 0.5, bty="n")
   
#4
plot(household_cons$DateTime, household_cons$Global_reactive_power,type= "l", xlab = "datetime", ylab="Global_reactive_power")

#Creating png
dev.copy(png, file="plot4.png")
dev.off()
              