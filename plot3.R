
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
household_cons$Sub_metering_1<- as.numeric(as.character(household_cons$Sub_metering_1))
household_cons$Sub_metering_2<- as.numeric(as.character(household_cons$Sub_metering_2))
household_cons$Sub_metering_3<- as.numeric(as.character(household_cons$Sub_metering_3))

#Creating plot
plot(household_cons$DateTime, household_cons$Sub_metering_1,type = "l", ylab = "Energy sub metering")
lines(household_cons$DateTime, household_cons$Sub_metering_2, col="red")
lines(household_cons$DateTime, household_cons$Sub_metering_3, col="blue")
legend("topright", c("sub metering 1","sub metering 2","sub metering 3"),lty = 1, lwd = 1, col=c("black","red", "blue"), cex = 0.8)

#Creating png
dev.copy(png, file="plot3.png")
dev.off()
