##This program reproduce plot 4.


## I opt to read entire dataset first and then subset the necessay part,since there is no condition on that.
## First we read the dataset from text file.
## Second we choose data from dates 1/2/2007 and 2/2/2007 and store it in "dataset2"
## Now we dont need original dataset. So Third we remove it.

dataset<-read.table("./household_power_consumption.txt", sep=";", header=T, na.strings="?")
dataset2<-dataset[dataset$Date %in% c("1/2/2007","2/2/2007"),]
rm("dataset")

## In plot 4,  x-axis is labed according to day of week instead of actual date and time.
## That mean we should attach date and time together. So we paste Date and Time together 
## and then convert it to R date class. Now R can figure out day of week relate to 1/2/2007,2/2/2007.

dataset2$Time<-strptime(paste(dataset2$Date,dataset2$Time),"%d / %m / %Y %H:%M:%S")

## Now we open png graphic device. We need 480*480 pixel size image.
## We need 2 by 2 matrix so that we can put our four graphs in there. We use par(mfrow):filled row wise 
png(file="plot4.png",width=480,height=480,units="px",pointsize=12)
par(mfrow=c(2,2))

## First we plot top left graph
plot(dataset2$Time,dataset2$Global_active_power,"l",xlab=" ",ylab="Global Active Power",main=" ")

## Second we plot top right graph
plot(dataset2$Time,dataset2$Voltage,"l",xlab=" datetime",ylab="Voltage",main=" ")

## Third we plot bottop left graph. Here we have to plot several graphs. We also have to include
## We aslo have to use legend function to name each function.
plot(dataset2$Time,as.numeric(dataset2$Sub_metering_1),"l",xlab=" ", ylab="Energy sub metering",col="black")
lines(dataset2$Time,as.numeric(dataset2$Sub_metering_2),"l",col="red")
lines(dataset2$Time,as.numeric(dataset2$Sub_metering_3),"l",col="blue")
legend("topright",legend=names(dataset2[7:9]),col=c("black","red","blue"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5))

## Final we plot bottom right graph and we close graphic device.
plot(dataset2$Time,dataset2$Global_reactive_power,"l",xlab="datetime ",ylab="Global_reactive_power",main=" ")
dev.off()