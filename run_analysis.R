# run_analysis.R
# Getting And Cleaning Data Data Science Course Project Script

## STEP I.   Read ALL the relevant Data Files 
## STEP II.  Merges the Training and the Test Data Sets to create One Super Data Set. 
## STEP III. Extracts only the measurements on the mean and standard deviation for each measurement. 
## STEP IV.  Label All the Data Set with Descriptive Activity Names. 
## STEP V.   Generate Independent tidy data set with the average of each variable for Each Activity and Each Subject. 


## STEP I.   Read ALL the relevant Data Files 

# Read all the relevant data files from sub folders "test" and "train" in current working directory and also the input files present in current working directory.
# Read data from the files into the variables

# Read files from test subfolder
subjectTestData  <- read.table("./test/subject_test.txt", header = FALSE)
featuresTestData <- read.table("./test/X_test.txt",       header = FALSE)
activityTestData <- read.table("./test/Y_test.txt",       header = FALSE)

# Read files from train subfolder
subjectTrainData  <- read.table("./train/subject_train.txt", header = FALSE)
featuresTrainData <- read.table("./train/X_train.txt",       header = FALSE)
activityTrainData <- read.table("./train/Y_train.txt",       header = FALSE)

# Read features and activity_labels text files
featuresNameLabels <- read.table("./features.txt",           header = FALSE)
activitiesNameLabels <- read.table("./activity_labels.txt" , header = FALSE)

## STEP II.  Merges the Training and the Test Data Sets to create One Super Data Set.

#Concatenate each Data Table By Rows
subjectData  <- rbind (subjectTrainData,  subjectTestData)
activityData <- rbind (activityTrainData, activityTestData)
featuresData <- rbind (featuresTrainData, featuresTestData)

# Apply Names to Variables
names (subjectData)  <- c ("Subject")
names (activityData) <- c ("Activity")
names (featuresData) <- featuresNameLabels$V2


# Merging Colums to get the Data Frame "AllData" which contains both the Training and Test Data Sets.

dataCombine <- cbind (subjectData, activityData)
AllData     <- cbind (featuresData, dataCombine)


## STEP III. Extracts only the measurements on the mean and standard deviation for each measurement. 

# Extract only the Mean and Standard Deviation for each measurement. Taking only subset of Mean(mean) and Standard Deviation(std)

featuresNamesSubData <- featuresNameLabels$V2[grep("mean\\(\\)|std\\(\\)", featuresNameLabels$V2)]

#Subset the data frame AllData by selected names of Features
selectedNames<-c(as.character(featuresNamesSubData), "Subject", "Activity" )
AllData<-subset(AllData,select=selectedNames)

# Show the Full Data Set
str(AllData)


## STEP IV.   Label All the Data Set with Descriptive Activity Names.

names(AllData)<-gsub("^t",      "Time",         names(AllData))
names(AllData)<-gsub("^f",      "Frequency",    names(AllData))
names(AllData)<-gsub("Acc",     "Accelerometer",names(AllData))
names(AllData)<-gsub("Gyro",    "Gyroscope",    names(AllData))
names(AllData)<-gsub("Mag",     "Magnitude",    names(AllData))
names(AllData)<-gsub("BodyBody","Body",         names(AllData))

names (AllData)

## STEP V.  Generate Final Independent tidy data set with the average of each variable for Each Activity and Each Subject.
 
library(plyr);
FinalTidyAllData<-aggregate(. ~Subject + Activity, AllData, mean)
FinalTidyAllData<- FinalTidyAllData[order( FinalTidyAllData$Subject, FinalTidyAllData$Activity),]

# Show the Final Tidy All Data Set
str(FinalTidyAllData)

write.table( FinalTidyAllData, file = "Output_Tidy_Samsung_Data.txt",row.name=FALSE)
