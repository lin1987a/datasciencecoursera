---
title: "course 3 final project"
author: "Yi Lin"
date: "December 2, 2017"
output: text using write.table()
---

Reqirements
================================================================================
This project is to generate tidy dataset out of the source data. in order to
get there, below requirements should be met:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each
measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set 
with the average of each variable for each activity and each subject.


What's Include
================================================================================
1. run_analysis.R  -- R script conducting the cleansing job
2. run_analysis_result.txt  -- output data in .txt format using write.table
3. ReedMe.md    -- instructions of this projct


Source Data
================================================================================
Below link provides the data for the project:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Details can be found in Readme.txt enclosed in the data package


Cookbook of the Script
================================================================================
Detail comments is provided in run_analysis.R, including how each step complete
the requirements of tidy data requested by this project.


Code Book of the Output
================================================================================
it's a table with 180 rows and 69 variables (the last one is optional, please
see the notes).

Variables can be interpreted as below:

1,"activity"	 -- descriptive activity
2,"subject"	 -- the # of subject who participated in the project
3,"avgof-tBodyAcc-mean()-X"	 -- avg. of measure tBodyAcc-mean()-X
4,"avgof-tBodyAcc-mean()-Y"	 -- avg. of measure tBodyAcc-mean()-Y
5,"avgof-tBodyAcc-mean()-Z"	 -- avg. of measure tBodyAcc-mean()-Z
6,"avgof-tBodyAcc-std()-X"	 -- avg. of measure tBodyAcc-std()-X
7,"avgof-tBodyAcc-std()-Y"	 -- avg. of measure tBodyAcc-std()-Y
8,"avgof-tBodyAcc-std()-Z"	 -- avg. of measure tBodyAcc-std()-Z
9,"avgof-tGravityAcc-mean()-X"	 -- avg. of measure tGravityAcc-mean()-X
10,"avgof-tGravityAcc-mean()-Y"	 -- avg. of measure -tGravityAcc-mean()-Y
11,"avgof-tGravityAcc-mean()-Z"	 -- avg. of measure -tGravityAcc-mean()-Z
12,"avgof-tGravityAcc-std()-X"	 -- avg. of measure -tGravityAcc-std()-X
13,"avgof-tGravityAcc-std()-Y"	 -- avg. of measure -tGravityAcc-std()-Y
14,"avgof-tGravityAcc-std()-Z"	 -- avg. of measure -tGravityAcc-std()-Z
15,"avgof-tBodyAccJerk-mean()-X"	 -- avg. of measure -tBodyAccJerk-mean()-X
16,"avgof-tBodyAccJerk-mean()-Y"	 -- avg. of measure -tBodyAccJerk-mean()-Y
17,"avgof-tBodyAccJerk-mean()-Z"	 -- avg. of measure -tBodyAccJerk-mean()-Z
18,"avgof-tBodyAccJerk-std()-X"	 -- avg. of measure -tBodyAccJerk-std()-X
19,"avgof-tBodyAccJerk-std()-Y"	 -- avg. of measure -tBodyAccJerk-std()-Y
20,"avgof-tBodyAccJerk-std()-Z"	 -- avg. of measure -tBodyAccJerk-std()-Z
21,"avgof-tBodyGyro-mean()-X"	 -- avg. of measure -tBodyGyro-mean()-X
22,"avgof-tBodyGyro-mean()-Y"	 -- avg. of measure -tBodyGyro-mean()-Y
23,"avgof-tBodyGyro-mean()-Z"	 -- avg. of measure -tBodyGyro-mean()-Z
24,"avgof-tBodyGyro-std()-X"	 -- avg. of measure -tBodyGyro-std()-X
25,"avgof-tBodyGyro-std()-Y"	 -- avg. of measure -tBodyGyro-std()-Y
26,"avgof-tBodyGyro-std()-Z"	 -- avg. of measure -tBodyGyro-std()-Z
27,"avgof-tBodyGyroJerk-mean()-X"	 -- avg. of measure -tBodyGyroJerk-mean()-X
28,"avgof-tBodyGyroJerk-mean()-Y"	 -- avg. of measure -tBodyGyroJerk-mean()-Y
29,"avgof-tBodyGyroJerk-mean()-Z"	 -- avg. of measure -tBodyGyroJerk-mean()-Z
30,"avgof-tBodyGyroJerk-std()-X"	 -- avg. of measure -tBodyGyroJerk-std()-X
31,"avgof-tBodyGyroJerk-std()-Y"	 -- avg. of measure -tBodyGyroJerk-std()-Y
32,"avgof-tBodyGyroJerk-std()-Z"	 -- avg. of measure -tBodyGyroJerk-std()-Z
33,"avgof-tBodyAccMag-mean()"	 -- avg. of measure -tBodyAccMag-mean()
34,"avgof-tBodyAccMag-std()"	 -- avg. of measure -tBodyAccMag-std()
35,"avgof-tGravityAccMag-mean()"	 -- avg. of measure -tGravityAccMag-mean()
36,"avgof-tGravityAccMag-std()"	 -- avg. of measure -tGravityAccMag-std()
37,"avgof-tBodyAccJerkMag-mean()"	 -- avg. of measure -tBodyAccJerkMag-mean()
38,"avgof-tBodyAccJerkMag-std()"	 -- avg. of measure -tBodyAccJerkMag-std()
39,"avgof-tBodyGyroMag-mean()"	 -- avg. of measure -tBodyGyroMag-mean()
40,"avgof-tBodyGyroMag-std()"	 -- avg. of measure -tBodyGyroMag-std()
41,"avgof-tBodyGyroJerkMag-mean()"	 -- avg. of measure -tBodyGyroJerkMag-mean()
42,"avgof-tBodyGyroJerkMag-std()"	 -- avg. of measure -tBodyGyroJerkMag-std()
43,"avgof-fBodyAcc-mean()-X"	 -- avg. of measure -fBodyAcc-mean()-X
44,"avgof-fBodyAcc-mean()-Y"	 -- avg. of measure -fBodyAcc-mean()-Y
45,"avgof-fBodyAcc-mean()-Z"	 -- avg. of measure -fBodyAcc-mean()-Z
46,"avgof-fBodyAcc-std()-X"	 -- avg. of measure -fBodyAcc-std()-X
47,"avgof-fBodyAcc-std()-Y"	 -- avg. of measure -fBodyAcc-std()-Y
48,"avgof-fBodyAcc-std()-Z"	 -- avg. of measure -fBodyAcc-std()-Z
49,"avgof-fBodyAccJerk-mean()-X"	 -- avg. of measure -fBodyAccJerk-mean()-X
50,"avgof-fBodyAccJerk-mean()-Y"	 -- avg. of measure -fBodyAccJerk-mean()-Y
51,"avgof-fBodyAccJerk-mean()-Z"	 -- avg. of measure -fBodyAccJerk-mean()-Z
52,"avgof-fBodyAccJerk-std()-X"	 -- avg. of measure -fBodyAccJerk-std()-X
53,"avgof-fBodyAccJerk-std()-Y"	 -- avg. of measure -fBodyAccJerk-std()-Y
54,"avgof-fBodyAccJerk-std()-Z"	 -- avg. of measure -fBodyAccJerk-std()-Z
55,"avgof-fBodyGyro-mean()-X"	 -- avg. of measure -fBodyGyro-mean()-X
56,"avgof-fBodyGyro-mean()-Y"	 -- avg. of measure -fBodyGyro-mean()-Y
57,"avgof-fBodyGyro-mean()-Z"	 -- avg. of measure -fBodyGyro-mean()-Z
58,"avgof-fBodyGyro-std()-X"	 -- avg. of measure -fBodyGyro-std()-X
59,"avgof-fBodyGyro-std()-Y"	 -- avg. of measure -fBodyGyro-std()-Y
60,"avgof-fBodyGyro-std()-Z"	 -- avg. of measure -fBodyGyro-std()-Z
61,"avgof-fBodyAccMag-mean()"	 -- avg. of measure -fBodyAccMag-mean()
62,"avgof-fBodyAccMag-std()"	 -- avg. of measure -fBodyAccMag-std()
63,"avgof-fBodyBodyAccJerkMag-mean()"	 -- avg. of measure -fBodyBodyAccJerkMag-mean()
64,"avgof-fBodyBodyAccJerkMag-std()"	 -- avg. of measure -fBodyBodyAccJerkMag-std()
65,"avgof-fBodyBodyGyroMag-mean()"	 -- avg. of measure -fBodyBodyGyroMag-mean()
66,"avgof-fBodyBodyGyroMag-std()"	 -- avg. of measure -fBodyBodyGyroMag-std()
67,"avgof-fBodyBodyGyroJerkMag-mean()"	 -- avg. of measure -fBodyBodyGyroJerkMag-mean()
68,"avgof-fBodyBodyGyroJerkMag-std()"	 -- avg. of measure -fBodyBodyGyroJerkMag-std()
69,"label"	 -- label of the activity

Notes: variable "label" is a duplicate to variable "activity", I chose to keep
it just because it reserves the original one digit classification of each 
activity, which is concise and computable. Remove it won't change anything.

License:
========
Use of any material in publications must be acknowledged.
Yi Lin. 12/01/2017.


