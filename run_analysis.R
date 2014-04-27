## set the working directory and load libraries
setwd("/UCI HAR Dataset")
library(reshape2)

##Step 1
subjectTest <- read.table("test/subject_test.txt") # subject id
xTest <- read.table("test/X_test.txt") # measurements
yTest <- read.table("test/y_test.txt") # activity id
test <- cbind(subjectTest, yTest, xTest )
subjectTrain <- read.table("train/subject_train.txt") 
xTrain <- read.table("train/X_train.txt") 
yTrain <- read.table("train/y_train.txt") 
train <- cbind(subjectTrain,  yTrain, xTrain )
data <- rbind(train, test)
features <- read.table("features.txt") 
colnames(data) <- c("subject", "activity", as.character(features[, 2]))

##Step 2 
means <- grep("[Mm]ean", colnames(data))
stds <- grep("std()", colnames(data))
cols <- c(means, stds) 
cols <- cols[order(cols)]
data <- data[, c(1,2,cols)]

##Step 3
activityLabels <- read.table("activity_labels.txt")

##Step 4
data<- merge(data, activityLabels,  by.x="activity", by.y="V1", all=TRUE)
colnames(data)[colnames(data) == "V2"] <- "descriptiveActivityName"
data <- data[, c(1, ncol(data), 2, 3:(ncol(data)-1))]

##Step 5
melt <- melt(data, id=c("activity", "descriptiveActivityName", "subject"))
tidyData <- dcast(melt, activity + descriptiveActivityName + subject ~ variable, mean)
write.table(tidy.data, "tidyData.txt", sep="\t")
write.table(tidy.data, "tidyDataOpenAsCsv.txt", sep=",")
write.table(tidy.data, "tidyDataOpenAs.csv", sep=",")
