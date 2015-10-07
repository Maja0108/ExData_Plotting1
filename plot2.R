
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

#Creating plot
plot(household_cons$DateTime, household_cons$Global_active_power,type= "l", ylab = "Global Active Power (kilowatts)",
     xlab = "")


#Creating png
dev.copy(png, file="plot2.png")
dev.off()