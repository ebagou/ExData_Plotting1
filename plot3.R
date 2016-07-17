#### Programming Assignment Week 1. Exploratory Data Analysis #############################################
#Set main directory

setwd("C:/Users/Helen/Documents/Coursera/Data Science/IV. Exploratory Data Analysis")
library(data.table)
library(dplyr)
library(reshape2)
library(ggplot2)
library(lattice)

#Create folder, download and unzip file w/dataset
if(!file.exists("./explore")){dir.create("./explore")}
fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,destfile="./explore/data.zip")
unzip(zipfile="./explore/data.zip",exdir="./explore")

#Load dataset

dataT<-read.table("./explore/household_power_consumption.txt", sep = ";", colClasses = "character")
colnames(dataT)<-dataT[1,]
dataT2<-dataT[66638:69517,]
rm(dataT)
#font.main=4

# Plot 3

x_1<-as.numeric(dataT2[,7])
x_2<-as.numeric(dataT2[,8])
x_3<-as.numeric(dataT2[,9])
dataT2[,1]=as.Date(dataT2[,1])

wdays<-weekdays(dataT2[,1])
v2<-c("Fri", "Thu", "Sat")
x <- 1:2880
png(filename = "plot3.png", width = 480, height = 480)
plot(x_1, type="n", xlab="", ylab="Energy submetering",xaxt = "n")
lines(x_1, col="black")
lines(x_2, col="red")
lines(x_3, col="blue")
legend("topright",cex = 0.9, c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
        horiz=FALSE,lty=c(1,1),
       col=c("black","red","blue"))
       
axis(side = 1,labels = v2,  cex.axis=0.75, at=c(0, 1500, 2800))
dev.off()
