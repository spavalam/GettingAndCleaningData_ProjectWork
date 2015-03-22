# run_analysis.R
# Getting And Cleaning Data Data Science Course Project Script


# STEP 1. Read all the relevant data files from sub folders "test" and "train" in current working directory and also the input files present in current working directory.

# Read files from test subfolder.
SubjectTest <- read.table("./test/subject_test.txt")
xTest <- read.table("./test/X_test.txt")
yTest <- read.table("./test/Y_test.txt")

# Read files from train subfolder
SubjectTrain <- read.table("./train/subject_train.txt")
xTrain <- read.table("./train/X_train.txt")
yTrain <- read.table("./train/Y_train.txt")

# Read features and activity_labels text files
features <- read.table("./features.txt")
activities <- read.table("./activity_labels.txt")


# STEP 2. Merges all the read relevant data into one dataset
xall <- rbind(xTrain, xTest)
yall <- rbind(yTrain, yTest)
suball <- rbind(SubjectTrain, SubjectTest)
allofit <- cbind(suball, yall, xall)

rm(xTest,yTest,xTrain,yTrain,SubjectTrain,SubjectTest,xall,yall,suball) # Remove unwanted files

# STEP 3. Name the measurement columns after the feature names, and give names to the id columns
featureNames <- as.character(features[,2])
newCols <- c("subject", "activity", featureNames)
colnames(allofit) <- newCols

# STEP 4. Create a new data frame whose measurement columns contain only Mean and Standard Deviation features
onlyMeans <- grep("mean()", colnames(allofit))
onlyStdDeviations <- grep("std()", colnames(allofit))
revisedColumns <- c(onlyMeans, onlyStdDeviations)
sortedRevisedColumns <- sort(revisedColumns) 

newDataFrame <- allofit[, c(1,2,sortedRevisedColumns)]
newDataFrame2 <- newDataFrame[, !grepl("Freq", colnames(newDataFrame))] 

rm(newDataFrame, allofit) 

# STEP 5. Trim the rows to the 180 needed to show mean values for each subject-activity pair
tidyframe <- data.frame()
for (i in 1:30) {
        subj<- subset(newDataFrame2,subject==i)
        for (j in 1:6){
                actv<- subset(subj, activity==j)
                myresult<-as.vector(apply(actv,2,mean))
                tidyframe<-rbind(tidyframe,myresult) 
        }
  
}

# STEP 6. Rename stuff and output the data to "Output_Tidy_Samsung_Data.txt"
colnames(tidyframe)<-colnames(newDataFrame2) #rename the columns again, as the names get lost in the mix above
levels(tidyframe[,2])<-c('walk','upstairswalk','downstairswalk', 'sit','stand', 'lay')
write.table(tidyframe, "Output_Tidy_Samsung_Data.txt", sep = "")      
