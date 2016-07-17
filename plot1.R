#### Programming Assignment Week 1. Exploratory Data Analysis #############################################
#1. Create and load new files

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
unzip(zipfile="./explore/data.zip",exdir="./explore") #extraer en esa misma carpeta

#Load datasets, features, activities, subjects

dataT<-read.table("./explore/household_power_consumption.txt", sep = ";", colClasses = "character")
colnames(dataT)<-dataT[1,]
dataT2<-dataT[66638:69517,]
rm(dataT)

#1 Plot 1

x<-as.numeric(dataT2[,3])
png(filename = "plot1.png",width = 480, height = 480)
hist(x, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", 
     ylim=c(0, 1200), cex.axis=0.8, cex.main=0.9)

dev.off()