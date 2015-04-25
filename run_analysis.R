library(plyr);

datapath <- file.path("UCI HAR Dataset")

#######Merge the training and the test sets to create one data set.
#reading all the data

features <- read.table(file.path(datapath, "features.txt"),head=FALSE)
activity_labels <- read.table(file.path(datapath, "activity_labels.txt"),head=FALSE)
names(activity_labels)<-c("activity_id","activity")

#reading subjets
subjectTest  <- read.table(file.path(datapath, "test" , "subject_test.txt"),header = FALSE)
subjectTrain <- read.table(file.path(datapath, "train", "subject_train.txt"),header = FALSE)

#reading activity
activityTest  <- read.table(file.path(datapath, "test" , "y_test.txt" ),header = FALSE)
activityTrain <- read.table(file.path(datapath, "train", "y_train.txt"),header = FALSE)

#reading raw data readings
dataTest  <- read.table(file.path(datapath, "test" , "X_test.txt" ),header = FALSE)
dataTrain <- read.table(file.path(datapath, "train", "X_train.txt"),header = FALSE)

#merging and giving appropriate labels for merged data
subject <- rbind(subjectTest, subjectTrain)
names(subject)<-c("subject")

activity<- rbind(activityTest, activityTrain)
names(activity)<- c("activity_id")

data<- rbind(dataTest, dataTrain)
names(data)<- features[,2]


#######Extracts only the measurements on the mean and standard deviation for each measurement.
#filtering data for to only include mean and STD measurement columns
sub_features <- grepl("mean|std", features[,2])
data<-data[,sub_features]


#######Use descriptive activity names to name the activities in the data set

#making data more human readable, replacing activity id with readable labels
names(activity_labels)<-c("activity_id","activity")
activity <- join(activity, activity_labels, by = "activity_id", match = "first")
activity <- activity[,-1]

#all 3 merged data included in single one
data <- cbind(subject,activity,data)

#######Appropriately labels the data set with descriptive variable names. 
#data fields replaced with more readable ones
names(data)<-gsub("Acc", "Accelerometer", names(data))
names(data)<-gsub("Gyro", "Gyroscope", names(data))
names(data)<-gsub("BodyBody", "Body", names(data))
names(data)<-gsub("Mag", "Magnitude", names(data))
names(data)<-gsub("^t", "Time", names(data))
names(data)<-gsub("^f", "Frequency", names(data))
names(data)<-gsub("tBody", "TimeBody", names(data))
names(data)<-gsub("-mean()", "Mean", names(data), ignore.case = TRUE)
names(data)<-gsub("-std()", "STD", names(data), ignore.case = TRUE)
names(data)<-gsub("-freq()", "Frequency", names(data), ignore.case = TRUE)
names(data)<-gsub("angle", "Angle", names(data))
names(data)<-gsub("gravity", "Gravity", names(data))

#######create a second, independent tidy data set with the average of each variable for each activity and each subject.
#final data is aggregated and ordered by subject and activity 
TidyData<-aggregate(. ~subject + activity, data, mean)
TidyData<-TidyData[order(TidyData$subject,TidyData$activity),]

#write the output file of the result
write.table(TidyData, file = "tidydata.txt",row.name=FALSE)


