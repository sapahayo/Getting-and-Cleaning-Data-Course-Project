###########################################
#data preparation
###########################################

#get working location
getwd()
#list of source files
f_subject_test <- "./UCI HAR Dataset/test/subject_test.txt"
f_X_test <- "./UCI HAR Dataset/test/X_test.txt"
f_Y_test <- "./UCI HAR Dataset/test/y_test.txt"
f_subject_train <-"./UCI HAR Dataset/train/subject_train.txt"
f_X_train <- "./UCI HAR Dataset/train/X_train.txt"
f_Y_train <- "./UCI HAR Dataset/train/y_train.txt"
f_activity_labels <-"./UCI HAR Dataset/activity_labels.txt"
f_features <- "./UCI HAR Dataset/features.txt"


#open test files
subject_test_dat <- read.table(f_subject_test)
X_test_dat <- read.table(f_X_test)
Y_test_dat <- read.table(f_Y_test)
#open training data
subject_train_dat <- read.table(f_subject_train)
X_train_dat <- read.table(f_X_train)
Y_train_dat <- read.table(f_Y_train)
#open features and activities
activity_labels_dat <- read.table(f_activity_labels)
features_dat <- read.table(f_features)


##################################
#Q1 merge test and training data set#
##################################

# merge X train and test
X_merged_dat <- rbind(X_test_dat, X_train_dat)
# set column names by using features.txt
colnames(X_merged_dat) <- as.character(features_dat[,2])
# merge subject
subject_merged_dat <- rbind(subject_train_dat, subject_test_dat)
# merge Y train and test
Y_merged_dat <- rbind(Y_train_dat, Y_test_dat)
# Create one data set from merge subject and Y
Y_subject_merged_dat <- cbind(subject_merged_dat, Y_merged_dat)

##############################################
#Q2 Extracts only the measurements on the mean 
#and standard deviation for each measurement. 
##############################################
Col_mean_std <- grep("mean\\(\\)|std\\(\\)", names(X_merged_dat))
X_mean_std_dat <- X_merged_dat[,Col_mean_std]


#############################################
#Q3 Uses descriptive activity names to 
#name the activities in the data set
#############################################

activity_labels <- activity_labels_dat$V2[Y_subject_merged_dat[,2]]
Y_subject_merged_dat$activity_label <- activity_labels


#############################################
#Q4 Appropriately labels the data set 
#with descriptive variable names. 
#############################################

combine_dat <- cbind(Y_subject_merged_dat, X_mean_std_dat)
colnames(combine_dat)[1:2] <- c("Subject", "Activity_ID")

#####################################################
#Q5 From the data set in step 4, creates a second, 
#independent tidy data set with the average 
#of each variable for each activity and each subject.
######################################################


avg_combine_dat <- aggregate.data.frame(combine_dat, list(combine_dat$Subject, combine_dat$activity_label), mean)[, c(-3, -5)]
colnames(avg_combine_dat)[1:2] <- c("Subject", "Activity_Label")
write.table(avg_combine_dat,"average_Per_Subject.txt",row.names=FALSE)
