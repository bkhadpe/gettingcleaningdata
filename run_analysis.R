# Read all the files

library(Hmisc)

subjectTest <- read.table("subject_test.txt")
subjectTrain <- read.table("subject_train.txt")

xTest <- read.table("x_test.txt")
xTrain <- read.table("x_train.txt")

yTest <- read.table("y_test.txt")
yTrain <- read.table("y_train.txt")

features <- read.table("features.txt")
activityLabels <- read.table("activity_labels.txt")

# 4. Appropriately labels the data set with descriptive variable names. 

colnames(xTrain) <- as.vector(features$V2)
colnames(xTest) <- as.vector(features$V2)

colnames(yTrain) <- c("Activity")
colnames(yTest) <- c("Activity")

colnames(subjectTrain) <- c("Subject")
colnames(subjectTest) <- c("Subject")

# 1. Merges the training and the test sets to create one data set.

mergedTrain <- cbind(subjectTrain, yTrain, xTrain)
mergedTest <- cbind(subjectTest, yTest, xTest)

mergedAll <- rbind(mergedTrain, mergedTest)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

mergedMean <- apply(mergedAll,2,mean)
mergedSd <- apply(mergedAll,2,sd)

# 3. Uses descriptive activity names to name the activities in the data set

mergedAll$Activity <- factor(mergedAll$Activity, levels = as.vector(activityLabels$V1), labels = as.vector(activityLabels$V2))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
colna <- colnames(mergedAll)
colna <- colna[-1]
colna <- colna[-1]
tidy <- summarize(mergedAll[colna],mergedAll[c('Subject','Activity')],colMeans)

write.table(tidy,file="tidyDataSet.txt",row.names=FALSE)

# also writing as a csv file with comma as a seperator for verification
write.table(tidy,file="tidyDataSet.csv",row.names=FALSE,sep=",")