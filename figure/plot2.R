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

# Plot 2

x<-as.numeric(dataT2[,3])
dataT2[,1]=as.Date(dataT2[,1])

wdays<-weekdays(dataT2[,1])
v2<-c("Fri", "Thu", "Sat")
png(filename = "plot2.png",width = 480, height = 480)
plot(x, type="l", ylab="Global Active Power (kilowatts)",
     cex.lab=0.8, xaxt = "n", xlab="")
axis(side = 1,labels = v2,  cex.axis=0.85, at=c(0, 1500, 2800))
dev.off()