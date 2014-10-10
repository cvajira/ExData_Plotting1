##This program reproduce plot 2.


## I opt to read entire dataset first and then subset the necessay part,since there is no condition on that.
## First we read the dataset from text file.
## Second we choose data from dates 1/2/2007 and 2/2/2007 and store it in "dataset2"
## Now we dont need original dataset. So Third we remove it.

dataset<-read.table("./household_power_consumption.txt", sep=";", header=T, na.strings="?")
dataset2<-dataset[dataset$Date %in% c("1/2/2007","2/2/2007"),]
rm("dataset")

## In plot 2,  x-axis is labed according to day of week instead of actual date and time.
## That mean we should attach date and time together. So we paste Date and Time together 
## and then convert it to R date class. Now R can figure out day of week relate to 1/2/2007,2/2/2007.

dataset2$Time<-strptime(paste(dataset2$Date,dataset2$Time),"%d / %m / %Y %H:%M:%S")

# Now we open the png graphic device. We need 480*480 pixel size image.
# next we plot the graph. We need line "l" graph
# Finally we close graphic device.

png(file="plot2.png",width=480,height=480, units="px", pointsize=12)
plot(dataset2$Time,dataset2$Global_active_power,"l",xlab=" ",ylab="Global Active Power(kilowatts)",main=" ")
dev.off()