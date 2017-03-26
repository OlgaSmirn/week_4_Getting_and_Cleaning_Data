# week_4_Getting_and_Cleaning_Data
## Files in this repo
* README.md -- you are reading it right now
* CodeBook.md -- codebook describing variables, the data and transformations
* run_analysis.R -- actual R code

## Description of the DATA
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

## librarys used in run_analysis.R
* library(dplyr)

## Input Files located in UCI HAR Dataset folder:
* features.txt
* activity_labels.txt
* subject_train.txt
* X_train.txt
* y_train.txt
* subject_test.txt
* X_test.txt
* test/y_test.txt

## Code explanations
run_analysis.R

* Step 1 - string manipulation functions is used to create more clear and readable column labels.
* Step 2 - functions bind_cols and bind_rows to merge all training and test data in one dataset.
* Step 3 - Dplyr select function is used to extract only Mean and Standard Deviation (Std) columns.
* Step 4 - Dplyr functions left_join and mutate used to join data to Activity dataset to get ddiscriptive activity names.
* Step 5 - Dplyr group_by and summarise used to build separate dataset containing average of each variable for each activity and each subject.

Resulting dataset has been written itno file AverageData.txt.

