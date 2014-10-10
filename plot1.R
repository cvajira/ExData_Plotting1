##This program reproduce plot 1.


## I opt to read entire dataset first and then subset the necessay part,since there is no condition on that.
## First we read data from text file and store it in "dataset" variable.
## Second we subset the data from dates 1/2/2007 and 2/2/2007 and store it in "dataset2".
## Third we convert "Date" variable into Date class in R.
## Fourth we remove the original "dataset" from memory.(we only need "dataset2")


dataset<-read.table("./household_power_consumption.txt", sep=";", header=T, na.strings="?")
dataset2<-dataset[dataset$Date %in% c("1/2/2007","2/2/2007"),]
dataset2$Date<-strptime(dataset2$Date,"%d / %m / %Y ")
rm("dataset")


## Now We open png graphic device. We need 480*480 pixel size image.
## Next we create histogram.
## Finaly we close the png device.

png(file="plot1.png",width=480,height=480,units="px",pointsize=12)
hist(dataset2$Global_active_power,col="red", main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()

