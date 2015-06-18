#run_analysis.R - Program to merge and clean data- Course project for "Getting and cleaning data"

#****************************************PART 1**************************************** 
# Merges the training and the test sets to create one data set
#************************************************************************************** 
destinationfilename<-"UCI_HAR_Dataset.zip"

#Download data to working DIR
if(!file.exists(destinationfilename)){
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destinationfilename)
}
#Unzip file
if(!file.exists("UCI HAR Dataset")){
  unzip(destinationfilename);  
}

#----------TRAIN DATA-----------
#train file
trainfile<-"UCI HAR Dataset/train/X_train.txt"

#train subjects
trainsubjectfile<-"UCI HAR Dataset/train/subject_train.txt"

#train activity
trainactfile<-"UCI HAR Dataset/train/y_train.txt"


#----------TEST DATA-----------
#test file
testfile <-"UCI HAR Dataset/test/X_test.txt"

#test subjects
testsubjectfile<-"UCI HAR Dataset/test/subject_test.txt"

#train activity
testactfile<-"UCI HAR Dataset/test/y_test.txt"

#-----------FEATURES FILE-----------
#features - as header of the train and test data set
featuresfile<-"UCI HAR Dataset/features.txt"

#-----------MERGE TRAIN AND TEST DATA -----------
#Read all train data
dfXtrain<-read.table(trainfile)
dftrainsubject<-read.table(trainsubjectfile)
dftrainactivity<-read.table(trainactfile)

#combine all train data
traindataset<-cbind(dfXtrain,dftrainsubject,dftrainactivity)

#Read all test data
dfXtest<-read.table(testfile)
dftestsubject<-read.table(testsubjectfile)
dftestactivity<-read.table(testactfile)

#combine all train data
traindataset<-cbind(dfXtrain,dftrainsubject,dftrainactivity)

#combine all test data
testdataset<-cbind(dfXtest,dftestsubject,dftestactivity)

# combine/merge train and test data
combineddataset<-rbind(traindataset,testdataset)

#Read features.txt to add column names in a vector call features
dffeatures<-read.table(featuresfile)
features<-as.character(dffeatures[,2])

#apply columns to combined data set
colnames(combineddataset)<-c(features,"Subject","Activity")

#****************************************PART 2**************************************** 
# Extracts only the measurements on the mean and standard deviation for each measurement.
#**************************************************************************************

#search for "mean" and "std" in column names
meanandstdcol<-grep("mean|std", features, ignore.case = TRUE)

#extract mean and std columns from the combined data set 
meanandstddata<-combineddataset[,meanandstdcol]
extractedData<-data.frame(meanandstddata,combineddataset$Subject,combineddataset$Activity)
colnames(extractedData)<-c(colnames(meanandstddata),"Subject","Activity")


#****************************************PART 3**************************************** 
# Uses descriptive activity names to name the activities in the data set
#**************************************************************************************

#Read Activity file in a table first
activitylabelfile<-"UCI HAR Dataset/activity_labels.txt"
dfactivitylabel<-read.table(activitylabelfile)

# Replace "_" with space, from the Activity label, to make it more user friendly and readable
dfactivitylabel[,2]<-gsub("_"," ",dfactivitylabel[,2])

#assigning activity label to the activity id in the extracted data
extractedData$Activity<-dfactivitylabel[match(extractedData$Activity,dfactivitylabel[,1]),2]

#factorizing activity and subject
extractedData$Activity <-as.factor(extractedData$Activity)
extractedData$Subject <-as.factor(extractedData$Subject)


#****************************************PART 4**************************************** 
# Appropriately labels the data set with descriptive variable names. 
#**************************************************************************************

#Changing character "t" at the begining of column name to "Time"
names(extractedData)<-gsub("^t", "Time", names(extractedData))

#Chaging charachter "f" in the begining of column name to "Frequency"
names(extractedData)<-gsub("^f", "Frequency", names(extractedData))

#Changing "-mean()" to "Mean"
names(extractedData)<-gsub("-mean()", "Mean", names(extractedData), ignore.case = TRUE)

#changing ".std" to "STD" 
names(extractedData)<-gsub("-std()", "STD", names(extractedData), ignore.case = TRUE)

#changing "Acc" to "Accelerometer"
names(extractedData)<-gsub("Acc", "Accelerometer", names(extractedData))

#changing "Mag" to "Magnitude"
names(extractedData)<-gsub("Mag", "Magnitude", names(extractedData))

#changing "-freq()" to "Frequency"
names(extractedData)<-gsub("-freq()", "Frequency", names(extractedData), ignore.case = TRUE)

#changing "angle" to "Angle"
names(extractedData)<-gsub("angle", "Angle", names(extractedData))

#changing "gravity" to "Gravity"
names(extractedData)<-gsub("gravity", "Gravity", names(extractedData))

#changing "tBody" to "TimeBody"
names(extractedData)<-gsub("tBody", "TimeBody", names(extractedData))

#changing "BodyBody" to "Body"
names(extractedData)<-gsub("BodyBody", "Body", names(extractedData))


#****************************************PART 5**************************************** 
# From the data set in step 4, creates a second, independent tidy data set with 
# the average of each variable for each activity and each subject.
#**************************************************************************************

library(data.table)
extractedData <- data.table(extractedData)
tidydata <- aggregate(. ~Subject + Activity, extractedData, mean)
tidydata <- tidydata[order(tidydata$Subject,tidydata$Activity),]
write.table(tidydata, file = "TidyDataSet.txt", row.names = FALSE)
