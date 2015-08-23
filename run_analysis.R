library(plyr)

## download data from source and unzip file
## files in ./projectData folder contain measured data
if(!file.exists("./projectData")) (dir.create("./projectData"))
dataURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(dataURL, destfile = "./projectData/dataSET.zip", method = "curl")
unzip(zipfile = "./projectData/dataSET.zip", exdir = "./projectData")

## creat tables from source files
actTestData <- read.table("./projectData/UCI HAR Dataset/test/y_test.txt", header = FALSE)
subTestData <- read.table("./projectData/UCI HAR Dataset/test/subject_test.txt", header = FALSE)
featTestData <- read.table("./projectData/UCI HAR Dataset/test/X_test.txt", header = FALSE)
actTrainData <- read.table("./projectData/UCI HAR Dataset/train/y_train.txt", header = FALSE)
subTrainData <- read.table("./projectData/UCI HAR Dataset/train/subject_train.txt", header = FALSE)
featTrainData <- read.table("./projectData/UCI HAR Dataset/train/X_train.txt", header = FALSE)

## Merges the training and the test sets to create one data set.
actData <- rbind(actTestData, actTrainData)
names(actData) <- c("activity")
subData <- rbind(subTestData, subTrainData)
names(subData) <- c("subject")
featData <- rbind(featTestData, featTrainData)
featNames <- read.table("./projectData/UCI HAR Dataset/features.txt", header = FALSE)
names(featData) <- featNames$V2
allData <- cbind(featData, subData, actData)

## Extracts only the measurements on the mean and standard deviation for each measurement. 
featNamesMS <- featNames$V2[grep("mean\\(\\)|std\\(\\)", featNames$V2)]
namesSA <- c(as.character(featNamesMS), "subject", "activity")
allData <- subset(allData, select = namesSA)

## Uses descriptive activity names to name the activities in the data setactLabels <- read.table("./projectData/UCI HAR Dataset/activity_labels.txt", header = FALSE)
actLabels <- read.table("./projectData/UCI HAR Dataset/activity_labels.txt", header = FALSE)
for(i in 1:6) allData$activity[allData$activity == i] <- as.character(actLabels[i,2])
allData$activity <- as.factor(allData$activity)

## Appropriately labels the data set with descriptive variable names. 
names(allData) <- gsub("^t", "time", names(allData))
names(allData) <- gsub("^f", "frequency", names(allData))
names(allData) <- gsub("Body", "_Body", names(allData))
names(allData) <- gsub("Acc", "_Accelerometer", names(allData))
names(allData) <- gsub("Gyro", "_Gyroscope", names(allData))
names(allData) <- gsub("_Body_Body", "_Body", names(allData))
names(allData) <- gsub("Mag", "_Magnitude", names(allData))
names(allData) <- gsub("Gravity", "_Gravity", names(allData))
names(allData) <- gsub("Jerk", "_Jerk", names(allData))

## independent tidy data set with the average of each variable for each activity and each subject
allData$subject <- as.factor(allData$subject)
tidyData <- aggregate(. ~subject + activity, allData, mean)
tidyData <- tidyData[order(tidyData$subject, tidyData$activity),]
write.table(tidyData, file = "tidyData.txt", row.names = FALSE)
