# Getting and Cleaning Data Course Project

in this README.md, contains about the repo describing how the script works and the code book describing the variables.

below the steps:
<ol>
<li>Step 0, Download file </li>
download file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and extract it 

using getwd() to check working directory. and then put downloded file in that directory. 
it will make easier to locate the path file, using "./".

<li>Step 1A, listed all files</li>
define all files 

Test files:
f_subject_test <- "./UCI HAR Dataset/test/subject_test.txt"
f_X_test <- "./UCI HAR Dataset/test/X_test.txt"
f_Y_test <- "./UCI HAR Dataset/test/y_test.txt"

Train Files:
f_subject_train <-"./UCI HAR Dataset/train/subject_train.txt"
f_X_train <- "./UCI HAR Dataset/train/X_train.txt"
f_Y_train <- "./UCI HAR Dataset/train/y_train.txt"

Activity file:
f_activity_labels <-"./UCI HAR Dataset/activity_labels.txt"

Features file:
f_features <- "./UCI HAR Dataset/features.txt"

variable with prefix f, means for file path

<li>Step 1B,  load all files to memory</li>
  
  read files
  #read test files
    subject_test_dat <- read.table(f_subject_test)
    X_test_dat <- read.table(f_X_test)
    Y_test_dat <- read.table(f_Y_test)
  #read training data
    subject_train_dat <- read.table(f_subject_train)
    X_train_dat <- read.table(f_X_train)
    Y_train_dat <- read.table(f_Y_train)
  #read features and activities
    activity_labels_dat <- read.table(f_activity_labels)
    features_dat <- read.table(f_features)
  
  
<li>Step 2, merge test and training data set</li>
<li>Step 3, Extracts only the measurements on the mean and standard deviation for each measurement</li>
<li>step 4, Uses descriptive activity names to name the activities in the data set</li>
<li>step 5, Appropriately labels the data set with descriptive variable names. </li>
<li>step 6, creates a second, independent tidy data set with the average of each variable for each activity and each subject</li>
</ol>
