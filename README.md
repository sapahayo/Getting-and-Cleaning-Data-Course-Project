# Getting and Cleaning Data Course Project

in this README.md, contains about the repo describing how the **script works** and the **code book** describing the variables.

below the steps:

### Step 0, Download file
Download file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and extract it. 

Using __getwd()__ to check working directory. and then put downloded file in that directory. 
it will make easier to locate the path file, using "./". 

### Step 1A, listed all files

#### Define all files 
##### Test files:
<ol><li>f_subject_test <- "./UCI HAR Dataset/test/subject_test.txt"  </li>
<li>f_X_test <- "./UCI HAR Dataset/test/X_test.txt" </li>
<li>f_Y_test <- "./UCI HAR Dataset/test/y_test.txt" </li>
</ol>

##### Train Files:
<ol><li>f_subject_train <-"./UCI HAR Dataset/train/subject_train.txt"</li>
<li>f_X_train <- "./UCI HAR Dataset/train/X_train.txt"</li>
<li>f_Y_train <- "./UCI HAR Dataset/train/y_train.txt"</li>
</ol>

##### Activity file:
<ol><li>f_activity_labels <-"./UCI HAR Dataset/activity_labels.txt"</li></ol>

##### Features file:
<ol><li>f_features <- "./UCI HAR Dataset/features.txt"</li></ol>

variable with prefix "f_", means for file path 

### Step 1B,  load all files to memory
  
#### Read the files :
##### Read test files
<ol><li>subject_test_dat <- read.table(f_subject_test)</li>
   <li>X_test_dat <- read.table(f_X_test)</li>
    <li>Y_test_dat <- read.table(f_Y_test)</li></ol>
    
##### Read training data
<ol><li>subject_train_dat <- read.table(f_subject_train)</li>
    <li>X_train_dat <- read.table(f_X_train)</li>
    <li>Y_train_dat <- read.table(f_Y_train)</li></ol>
    
##### Read features and activities
<ol><li>activity_labels_dat <- read.table(f_activity_labels)</li>
   <li>features_dat <- read.table(f_features)</li></ol>
  
### Step 2, Merge test and training data set

<p>In this step, files that already readed at step 1B will be merged using rbind and rbind.
*for more detail regading rbind and cbind you can check using ?rbind or ?cbind. </p>
#### Merge X train and test
<ol><li>X_merged_dat <- rbind(X_test_dat, X_train_dat)</li></ol>

#### Set column names using features.txt
<ol><li>colnames(X_merged_dat) <- as.character(features_dat[,2])</li></ol>

#### Merge subject
<ol><li>subject_merged_dat <- rbind(subject_train_dat, subject_test_dat)</li></ol>

#### Merge Y train and test
<ol><li>Y_merged_dat <- rbind(Y_train_dat, Y_test_dat)</li></ol>

#### Create one data set from merge subject and Y
<ol><li>Y_subject_merged_dat <- cbind(subject_merged_dat, Y_merged_dat)</li></ol>

  
### Step 3, Extracts only the measurements on the mean and standard deviation for each measurement
  
### step 4, Uses descriptive activity names to name the activities in the data set
  
### step 5, Appropriately labels the data set with descriptive variable names.
  
### step 6, Creates a second, independent tidy data set with the average of each variable for each activity and each subject
