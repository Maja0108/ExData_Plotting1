
#Reading data from source file
electricity <- read.table(file="household_power_consumption.txt", sep =";", header = TRUE)

# Subsetting and binding data
household_cons1 <- subset(electricity, Date == '1/2/2007') 
household_cons2 <- subset(electricity, Date == '2/2/2007')
household_cons <- rbind(household_cons1, household_cons2)

#converting factor to numeric
household_cons$Global_active_power<- as.numeric(as.character(household_cons$Global_active_power))

#Histogram of Global active power
hist(household_cons$Global_active_power, col = "red", main = "Global Active Power", xlab ="Global active power(kilowatts)") 

#Creating png
dev.copy(png, file="plot1.png")
dev.off()
