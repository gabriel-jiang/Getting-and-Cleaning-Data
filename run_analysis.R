#Load libraries
#tidyr library needed for gather function
library(tidyr)

#Get activity labels and features
setwd("D:/Online Learning/Getting and Cleaning Data/Course Project/UCI HAR Dataset")
activity_labels <- read.table("activity_labels.txt")
colnames(activity_labels) <- c("activity_class_num", "activity")
features <- read.table("features.txt")

#Get test data
setwd("D:/Online Learning/Getting and Cleaning Data/Course Project/UCI HAR Dataset/test")
subject_test <- read.table("subject_test.txt")
colnames(subject_test) <- "subject"
X_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
colnames(y_test) <- "activity_class_num"

#The column names for X_test are the rows in the second column of features
colnames(X_test) <- features$V2

variables <- X_test[ , grepl("mean()", names(X_test)) | grepl("std()", names(X_test))]
test_data <- cbind(subject_test, y_test, variables)
test_data2 <- merge(test_data, activity_labels, by = "activity_class_num")
test_data3 <- gather(test_data2, feature, value, -subject, -activity_class_num, -activity)
test_data4 <- aggregate(value ~ subject + activity + feature, data = test_data3, FUN= "mean")
test_set_label <- "test"
test_data5 <- merge(test_data4, test_set_label)
colnames(test_data5)[5] <- "set"

#Get training data
setwd("D:/Online Learning/Getting and Cleaning Data/Course Project/UCI HAR Dataset/train")
subject_train <- read.table("subject_train.txt")
colnames(subject_train) <- "subject"
X_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
colnames(y_train) <- "activity_class_num"

#The column names for X_train are the rows in the second column of features
colnames(X_train) <- features$V2

variables <- X_train[ , grepl("mean()", names(X_train)) | grepl("std()", names(X_train))]
training_data <- cbind(subject_train, y_train, variables)
training_data2 <- merge(training_data, activity_labels, by = "activity_class_num")
training_data3 <- gather(training_data2, feature, value, -subject, -activity_class_num, -activity)
training_data4 <- aggregate(value ~ subject + activity + feature, data = training_data3, FUN= "mean")
training_set_label <- "training"
training_data5 <- merge(training_data4, training_set_label)
colnames(training_data5)[5] <- "set"

#Merge test and training sets
merged_set <- rbind(test_data5, training_data5)
tidy_data <- merged_set[order(merged_set$subject, merged_set$activity, merged_set$feature), ]
setwd("D:/Online Learning/Getting and Cleaning Data/Course Project")
write.table(tidy_data, file = "tidy_data.txt", row.names = FALSE)