##This program reproduce plot 3.


## I opt to read entire dataset first and then subset the necessay part,since there is no condition on that.
## First we read the dataset from text file.
## Second we choose data from dates 1/2/2007 and 2/2/2007 and store it in "dataset2"
## Now we dont need original dataset. So Third we remove it.

dataset<-read.table("./household_power_consumption.txt", sep=";", header=T, na.strings="?")
dataset2<-dataset[dataset$Date %in% c("1/2/2007","2/2/2007"),]
rm("dataset")

## In plot 3,  x-axis is labed according to day of week instead of actual date and time.
## That mean we should attach date and time together. So we paste Date and Time together 
## and then convert it to R date class. Now R can figure out day of week relate to 1/2/2007,2/2/2007.

dataset2$Time<-strptime(paste(dataset2$Date,dataset2$Time),"%d / %m / %Y %H:%M:%S")

## Now we open png graphic device. We need 480*480 pixel size image.
## First we plot Time vs Sub_metering_1. We specify label of y axis here.
## Second we plot Time vs Sub_metering_2 on same above graph. To do that we should use line function.
## Thirs we plot Time vs Sub_metering_3 on same above graph. To do that we should use again line function.

png(file="plot3.png",width=480,height=480,pointsize=12,units="px")
plot(dataset2$Time,as.numeric(dataset2$Sub_metering_1),"l",xlab=" ", ylab="Energy sub metering",col="black")
lines(dataset2$Time,as.numeric(dataset2$Sub_metering_2),"l",col="red")
lines(dataset2$Time,as.numeric(dataset2$Sub_metering_3),"l",col="blue")

## Now we should define legend relate to each graph. To do that we use legend function.
## Finaly we close graphic device.
legend("topright",legend=names(dataset2[7:9]),col=c("black","red","blue"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5))
dev.off()