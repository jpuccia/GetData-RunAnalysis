---
title: "CodeBook.md"
author: "Getting and Cleaning Data"
date: "July 25, 2015"
output: html_document
---

****

This code book describes the data used and processed as part of a project for the *Getting and Cleaning Data* course through [Coursera](https://www.coursera.org).  The objective is to take raw cell phone data  provided by the *Machine Learning Repository* and combine it into a tidy data set as outlined in the course project requirements.  


<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;You should create one R script called run_analysis.R that does the following.  
<ol>
<li>Merges the training and the test sets to create one data set.  </li>
<li>Extracts only the measurements on the mean and standard deviation for each measurement.   </li>
<li>Uses descriptive activity names to name the activities in the data set.  </li>
<li>Appropriately labels the data set with descriptive variable names.  </li>
<li>From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  </li>
</ol>

  
## Data  
  
The data for this project was provided in the course requirements and can be downloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).  A full description of the source data can be found at the *Machine Learning Repository* link for the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  The files listed below were used in the creation of the tidy data set.  The process for creating the tidy data set is described in the README.md markdown file.
  
- features.txt': List of all features.
- activity_labels.txt: Links the class labels with their activity name.
- train/X_train.txt: Training set.
- train/y_train.txt: Training labels.
- train/subject_train.txt : Each row identifies the subject who performed the activity for each window sample.
- test/X_test.txt: Test set.
- test/y_test.txt: Test labels.
- test/subject_test.txt : Each row identifies the subject who performed the activity for each window sample.

## Variables  
  
The variables for the tidy data set are the averages of the standard deviation and mean data variables by test subject and activity from the combined raw data files. A complete list is shown below.  

subject  
activity  
tBodyAccStdX  
tBodyAccStdY  
tBodyAccStdZ  
tGravityAccStdX  
tGravityAccStdY  
tGravityAccStdZ  
tBodyAccJerkStdX  
tBodyAccJerkStdY  
tBodyAccJerkStdZ  
tBodyGyroStdX  
tBodyGyroStdY  
tBodyGyroStdZ  
tBodyGyroJerkStdX  
tBodyGyroJerkStdY  
tBodyGyroJerkStdZ  
tBodyAccMagStd  
tGravityAccMagStd  
tBodyAccJerkMagStd  
tBodyGyroMagStd  
tBodyGyroJerkMagStd  
fBodyAccStdX  
fBodyAccStdY  
fBodyAccStdZ  
fBodyAccJerkStdX  
fBodyAccJerkStdY  
fBodyAccJerkStdZ  
fBodyGyroStdX  
fBodyGyroStdY  
fBodyGyroStdZ  
fBodyAccMagStd  
fBodyBodyAccJerkMagStd  
fBodyBodyGyroMagStd  
fBodyBodyGyroJerkMagStd  
tBodyAccMeanX  
tBodyAccMeanY  
tBodyAccMeanZ  
tGravityAccMeanX  
tGravityAccMeanY  
tGravityAccMeanZ  
tBodyAccJerkMeanX  
tBodyAccJerkMeanY  
tBodyAccJerkMeanZ  
tBodyGyroMeanX  
tBodyGyroMeanY  
tBodyGyroMeanZ  
tBodyGyroJerkMeanX  
tBodyGyroJerkMeanY  
tBodyGyroJerkMeanZ  
tBodyAccMagMean  
tGravityAccMagMean  
tBodyAccJerkMagMean  
tBodyGyroMagMean  
tBodyGyroJerkMagMean  
fBodyAccMeanX  
fBodyAccMeanY  
fBodyAccMeanZ  
fBodyAccMeanFreqX  
fBodyAccMeanFreqY  
fBodyAccMeanFreqZ  
fBodyAccJerkMeanX  
fBodyAccJerkMeanY  
fBodyAccJerkMeanZ  
fBodyAccJerkMeanFreqX  
fBodyAccJerkMeanFreqY  
fBodyAccJerkMeanFreqZ  
fBodyGyroMeanX  
fBodyGyroMeanY  
fBodyGyroMeanZ  
fBodyGyroMeanFreqX  
fBodyGyroMeanFreqY  
fBodyGyroMeanFreqZ  
fBodyAccMagMean  
fBodyAccMagMeanFreq  
fBodyBodyAccJerkMagMean  
fBodyBodyAccJerkMagMeanFreq  
fBodyBodyGyroMagMean  
fBodyBodyGyroMagMeanFreq  
fBodyBodyGyroJerkMagMean  
fBodyBodyGyroJerkMagMeanFreq  
angletBodyAccMeangravity  
angletBodyAccJerkMeangravityMean  
angletBodyGyroMeangravityMean  
angletBodyGyroJerkMeangravityMean  
angleXgravityMean  
angleYgravityMean  
angleZgravityMean  

  
  