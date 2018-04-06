## first install.packages("reshape") and install.packages("reshape2")
## then load with library("reshape") and library("reshape2")

install.packages("reshape")
install.packages("reshape2")
library("reshape")
library("reshape2")

## Load files

X_test <- read.table("C:/Users/15473/Desktop/UCI HAR Dataset/test/X_test.txt", quote="\"", comment.char="")

X_train <- read.table("C:/Users/15473/Desktop/UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="")

## Merge tables

total <- rbind(X_test, X_train)

#Label

labels_activity <- read.table("activity_labels.txt")
labels_activity[,2] <- as.character(labels_activity[,2])

features <- read.table("features.txt")
features[,2] <- as.character(features[,2])

#Only mean and st. deviation

features_reduced <- grep(".*mean.*|.*std.*", features[,2])
features_reduced.names <- features[features_reduced,2]
features_reduced.names = gsub('-mean', 'Mean', features_reduced.names)
features_reduced.names = gsub('-std', 'Std', features_reduced.names)
features_reduced.names <- gsub('[-()]', '', features_reduced.names)

#Read files

train <- read.table("train/X_train.txt")[features_reduced]
trainActivities <- read.table("train/Y_train.txt")
trainSubjects <- read.table("train/subject_train.txt")
train <- cbind(trainSubjects, trainActivities, train)

test <- read.table("test/X_test.txt")[features_reduced]
testActivities <- read.table("test/Y_test.txt")
testSubjects <- read.table("test/subject_test.txt")
test <- cbind(testSubjects, testActivities, test)

#Name activities via descriptive activity 

allData <- rbind(train, test)
colnames(allData) <- c("subject", "activity", features_reduced.names)

allData$activity <- factor(allData$activity, levels = labels_activity[,1], labels = labels_activity[,2])
allData$subject <- as.factor(allData$subject)

allData.melted <- melt(allData, id = c("subject", "activity"))
allData.mean <- dcast(allData.melted, subject + activity ~ variable, mean)

# Creates tidy data set with the average of each variable for each activity and each subject.

write.table(allData.mean, "tidy.txt", row.names = FALSE, quote = FALSE)
