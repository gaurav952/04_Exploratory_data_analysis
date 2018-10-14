#setwd("C:/Users/Gaurav/Desktop/4_Exploratory_Data_Analysis/project1")


rm(list = ls())
data <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")
# convert the date variable to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset the data
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#check data
head(data)

#create datetime column
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

#check data
head(data)


#attaching to refer by names only
attach(data)

#plotting histogram
hist(Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Green")

# Save file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
detach(data)
