library(dplyr)

#Step 1 - read data
#Read features and activities
features<-read.table("UCI HAR Dataset/features.txt", header = FALSE)
activity<-read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)

#Read train data
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
data_train<-read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
activity_train<-read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)

#read test data
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
data_test<-read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
activity_test<-read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)

# rename column in activiries and subject data fraims
names(activity_train) <- "activity"
names(activity_test) <- "activity"
names(subject_train) <- "subject"
names(subject_test) <- "subject"

#Question 4.Appropriately labels the data set with descriptive variable names
# Remane columns
names(data_train)<-sub(",","_",gsub("-","_",gsub("[()]","",features$V2)))
names(data_test)<-sub(",","_",gsub("-","_",gsub("[()]","",features$V2)))

# Question 1 Merges the training and the test sets to create one data set 
# combain activity,subject and data daitaset in one

# Train
data_train<-bind_cols(activity_train,subject_train,data_train)

# Test
data_test  <-bind_cols(activity_test,subject_test,data_test)

# Merge together train and test
data_all <-bind_rows(data_train,data_test)

# Question 2 Extracts only the measurements on the mean and standard deviation for each measurement.
data_all<-select(data_all,activity, subject, matches("mean|std", ignore.case = FALSE))

# Question 3 Uses descriptive activity names to name the activities in the data set
data_all <- merge(activities,data_all,by.x = "V1",by.y = "activity",all.x = TRUE)
data_all <-mutate(data_all,activity=V2)  
data_all <- select(data_all,-V1,-V2)

# Question 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
data_average <- data_all %>% 
        group_by(subject, activity) %>% 
        summarise_all(mean)
        

## Write result file
write.table(data_average, "AverageData.txt", row.name=FALSE)
