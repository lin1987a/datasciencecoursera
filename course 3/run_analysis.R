rm(list=ls())
getwd()

################################################################################
## This script is to generate tidy dataset out of the source data. in order to
## get there, below requirements should be met:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each
##    measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, independent tidy data set 
##    with the average of each variable for each activity and each subject.
################################################################################

library(dplyr)

## read description of labels (i.e. activity)
labels <- read.table('.\\myWD\\course3\\UCI HAR Dataset\\activity_labels.txt')
labels
# assign meaningful names to columns
names(labels) <- c("label", "activity")

## read description of variables (i.e. measures) 
features <- read.table('.\\myWD\\course3\\UCI HAR Dataset\\features.txt') 
View(features)

## create a vestor 'select', containing the variables required just for this 
## assignment, to meet requirement #2
grep("mean[^F]|std", features$V2, value = TRUE) # visual check 
select <- grep("mean[^F]|std", features$V2)
select 

## read training dataset
# read subject
subject_train <- read.table('.\\myWD\\course3\\UCI HAR Dataset\\train\\subject_train.txt') 
dim(subject_train)
table(subject_train)
names(subject_train) <- c("subject") # assign meaningful names to column
# read measures
x_train <- read.table('.\\myWD\\course3\\UCI HAR Dataset\\train\\X_train.txt') 
dim(x_train)
str(x_train)
names(x_train) <- features$V2 # assign meaningful names to column
# read labels
y_train <- read.table('.\\myWD\\course3\\UCI HAR Dataset\\train\\y_train.txt')
dim(y_train)
table(y_train)
names(y_train) <- c("label") # assign meaningful names to column
# consolicate training dataset and select only required measures
data_train <- cbind(subject_train, x_train[, select], y_train) #, dataset = "train")
dim(data_train)

subject_test <- read.table('.\\myWD\\course3\\UCI HAR Dataset\\test\\subject_test.txt') 
dim(subject_test)
table(subject_test)
names(subject_test) <- c("subject") # assign meaningful names to column
x_test <- read.table('.\\myWD\\course3\\UCI HAR Dataset\\test\\X_test.txt') 
dim(x_test)
names(x_test) <- features$V2    # assign meaningful names to column
y_test <- read.table('.\\myWD\\course3\\UCI HAR Dataset\\test\\y_test.txt') 
dim(y_test)
table(y_test)
names(y_test) <- c("label") # assign meaningful names to column
# consolicate training dataset and select only required measures
data_test <- cbind(subject_test, x_test[, select], y_test) #, dataset = "test")
dim(data_test)
length(select)

## merge training and test dataset to meet requirement #1
data_all <- rbind(data_train, data_test)
dim(data_all)

## name the labels (activities) to meet rqquirement #3
data_all <- data_all %>% inner_join(labels) 
head(data_all)
str(data_all)

## summarize the measures to meet the requirement #5
result <- data_all %>% group_by(activity, subject) %>% summarize_if(is.numeric, mean)
View(result)

## rename the column names to make them reflect the true meaning, together with
## the naming of subject and activity, to meet the requirement #4
cols <- grep("mean|std", names(result))
new_colnames <- paste0("avgof-", grep("mean|std", names(result), value = TRUE))
names(result)[cols] <- new_colnames
names(result)

## ??? below does't work
# result %>% select(cols) %>% setNames(paste0("avgof-", .))
# 
# old_colnames <- grep("mean|std", names(result), value = TRUE)
# result %>% rename_at(vars(old_colnames), funs(paste0("avgof-", .)))
# result %>% rename_if(is.numeric, funs(paste0("avgof-", )))

## export the resulted tidy dataset
write.table(result, ".\\myWD\\course3\\run_analysis_result.txt", row.names = FALSE)
      