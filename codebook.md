
## Description

Additional information about the variables, data and transformations used in the course project for the Johns Hopkins Getting 
and Cleaning Data course.

## Source Data
A full description of the data used in this project can be found at The UCI Machine Learning Repository
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing
a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the captured readings were:
3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for
generating the training data and 30% the test data. 


## Attribute Information
For each record in the dataset it is provided: 
•Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
•Triaxial Angular velocity from the gyroscope. 
•A 561-feature vector with time and frequency domain variables. 
•Its activity label. 
•An identifier of the subject who carried out the experiment.

## Programming/Analysis STEPS SUMMARY :

## STEP I.   Read ALL the relevant Data Files 
## STEP II.  Merges the Training and the Test Data Sets to create One Super Data Set. 
## STEP III. Extracts only the measurements on the mean and standard deviation for each measurement. 
## STEP IV.  Label All the Data Set with Descriptive Activity Names. 
## STEP V.   Generate Independent tidy data set with the average of each variable for Each Activity and Each Subject. 


## STEP I Read ALL the relevant Data Files SubSteps:
For the purposes of this project, the files in the Inertial Signals folders are not used. 
The files are assumed in current working directory.
The files that will be used to load data are listed as follows:
•features.txt
•activity_labels.txt
•test/subject_test.txt
•test/X_test.txt
•test/y_test.txt
•train/subject_train.txt
•train/X_train.txt
•train/y_train.txt

Brief Description of the above files are:
1.Values of Varible Activity consist of data from “Y_train.txt” and “Y_test.txt”
2.values of Varible Subject consist of data from “subject_train.txt” and subject_test.txt"
3.Values of Varibles Features consist of data from “X_train.txt” and “X_test.txt”
4.Names of Varibles Features come from “features.txt”
5.Labels of Varible Activity come from “activity_labels.txt”

Read Data from above files into following variables:
subjectTestData, featuresTestData, activityTestData, subjectTrainData, featuresTrainData,activityTrainData,featuresNameLabels,
activitiesNameLabels.

## STEP II.  Merges the Training and the Test Data Sets to create One Super Data Set. 

-Concatenate Three pairs (Train/Test Relevant Pairs)  of Data Table By Rows
-Apply Names to Variables after concatenation
-Merging Colums to get the Data Frame "AllData" which contains both the Training and Test Data Sets.

This "AllData" contains 10299 observations of 68 variables:

## STEP III. Extracts only the measurements on the mean and standard deviation for each measurement. 

Subset the "AllData" data to keep only the necessary columns pertaining to mean and standard deviation.

## STEP IV.  Label All the Data Set with Descriptive Activity Names. 

Use gsub function for pattern replacement to clean up the data labels.

## STEP V.   Generate a second Independent tidy data set with the average of each variable for Each Activity and Each Subject. 

The Second Tidy Set is shown in the console and then written to the following text file viz: Output_Tidy_Samsung_Data.txt
It contains 180 Rows and 68 Variables.
