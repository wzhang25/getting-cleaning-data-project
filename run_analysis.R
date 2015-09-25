#download data
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip?accessType=DOWNLOAD"
download.file(fileUrl, destfile="./data/project", method="curl")
unzip("./data/project")

#label all variables; generate dataframes with subject, activity and measurement 

file1 <- read.table("./UCI HAR Dataset/test/X_test.txt")
fileFeature <- read.table("./UCI HAR Dataset/features.txt")
colnames(file1) <- t(fileFeature[2])
file2 <- read.table("./UCI HAR Dataset/test/subject_test.txt")
file3 <- read.table("./UCI HAR Dataset/test/y_test.txt")
fileTest <- cbind(file2, file3, file1)
colnames(fileTest)[1] <- "subject"
colnames(fileTest)[2] <- "activity"

file4 <- read.table("./UCI HAR Dataset/train/X_train.txt")
colnames(file4) <- t(fileFeature[2])
file5 <- read.table("./UCI HAR Dataset/train/subject_train.txt")
file6 <- read.table("./UCI HAR Dataset/train/y_train.txt")
fileTrain <- cbind(file5, file6, file4)
colnames(fileTrain)[1] <- "subject"
colnames(fileTrain)[2] <- "activity"

#Assignment 1 # combine test and train data
all <- rbind(fileTest, fileTrain)

#Assignment 2 # extracts useful measurement by grep 

subsetNames <- grep("std\\(\\)|mean\\(\\)|subject|activity", names(all), value = FALSE)
shortAll <- all[subsetNames]

#Assignment 3 # Uses descriptive activity names to name the activities in the data set
shortAll$activity <- as.character(shortAll$activity)
shortAll$activity[all$activity == 1] <- "Walking"
shortAll$activity[all$activity == 2] <- "Walking Upstairs"
shortAll$activity[all$activity == 3] <- "Walking Downstairs"
shortAll$activity[all$activity == 4] <- "Sitting"
shortAll$activity[all$activity == 5] <- "Standing"
shortAll$activity[all$activity == 6] <- "Laying"
shortAll$activity <- as.factor(shortAll$activity)

#Assignment 4 # label the data set with descriptive variable names
names(shortAll) <- gsub("Acc", "Accelerator", names(shortAll))
names(shortAll) <- gsub("Mag", "Magnitude", names(shortAll))
names(shortAll) <- gsub("Gyro", "Gyroscope", names(shortAll))
names(shortAll) <- gsub("^t", "time", names(shortAll))
names(shortAll) <- gsub("^f", "frequency", names(shortAll))

#change the subject names
shortAll$subject <- as.character(shortAll$subject)
shortAll$subject[shortAll$subject == 1] <- "volunteer 1"
shortAll$subject[shortAll$subject == 2] <- "volunteer 2"
shortAll$subject[shortAll$subject == 3] <- "volunteer 3"
shortAll$subject[shortAll$subject == 4] <- "volunteer 4"
shortAll$subject[shortAll$subject == 5] <- "volunteer 5"
shortAll$subject[shortAll$subject == 6] <- "volunteer 6"
shortAll$subject[shortAll$subject == 7] <- "volunteer 7"
shortAll$subject[shortAll$subject == 8] <- "volunteer 8"
shortAll$subject[shortAll$subject == 9] <- "volunteer 9"
shortAll$subject[shortAll$subject == 10] <- "volunteer 10"
shortAll$subject[shortAll$subject == 11] <- "volunteer 11"
shortAll$subject[shortAll$subject == 12] <- "volunteer 12"
shortAll$subject[shortAll$subject == 13] <- "volunteer 13"
shortAll$subject[shortAll$subject == 14] <- "volunteer 14"
shortAll$subject[shortAll$subject == 15] <- "volunteer 15"
shortAll$subject[shortAll$subject == 16] <- "volunteer 16"
shortAll$subject[shortAll$subject == 17] <- "volunteer 17"
shortAll$subject[shortAll$subject == 18] <- "volunteer 18"
shortAll$subject[shortAll$subject == 19] <- "volunteer 19"
shortAll$subject[shortAll$subject == 20] <- "volunteer 20"
shortAll$subject[shortAll$subject == 21] <- "volunteer 21"
shortAll$subject[shortAll$subject == 22] <- "volunteer 22"
shortAll$subject[shortAll$subject == 23] <- "volunteer 23"
shortAll$subject[shortAll$subject == 24] <- "volunteer 24"
shortAll$subject[shortAll$subject == 25] <- "volunteer 25"
shortAll$subject[shortAll$subject == 26] <- "volunteer 26"
shortAll$subject[shortAll$subject == 27] <- "volunteer 27"
shortAll$subject[shortAll$subject == 28] <- "volunteer 28"
shortAll$subject[shortAll$subject == 29] <- "volunteer 29"
shortAll$subject[shortAll$subject == 30] <- "volunteer 30"
shortAll$subject <- as.factor(shortAll$subject)

#Assignment 5 # create a tidy set
library(plyr)
Data2<-aggregate(. ~subject + activity, shortAll, mean)
write.table(Data2, file = "tidydata.txt",row.name=FALSE)
