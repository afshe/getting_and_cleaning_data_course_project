#CodeBook

This CodeBook described the metadata and variables used for reading data , merging and cleaning data and for generating a new tidy dataset (file)

##Input Dataset and Files

The source dataset for this project is downloaded from 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

####Input files
The [file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) is downloaded, unzipped and stored in working directory as

| Variable | Value | Description|
| ------ | ----- | ----------- |
| destinationfilename|UCI_HAR_Dataset.zip| File downlaoded stored as "UCI_HAR_Dataset.zip" |

The above file is then unzipped to read the "test" and "train" data files

| Variable | Value | Description|
| ------ | ----- | ----------- |
|trainfile|UCI HAR Dataset/train/X_train.txt|Training Set|
|trainsubjectfile|UCI HAR Dataset/train/subject_train.txt|Each row identifies the subject who performed the activity for each window sample.|
|trainactfile|UCI HAR Dataset/train/y_train.txt|Training labels|
|testfile|UCI HAR Dataset/test/X_test.txt|Training Set|
|testsubjectfile|UCI HAR Dataset/test/subject_test.txt|Each row identifies the subject who performed the activity for each window sample.|
|testactfile|UCI HAR Dataset//test/y_test.txt|Test labels|
|featuresfile|UCI HAR Dataset/features.txt|List of all features|
|activitylabelfile|UCI HAR Dataset/activity_labels.txt|Links the class labels with their activity name|

##Transformations 
####Part1
Merges the training and the test sets to create one data set

| Variable | Description|
| ------ | ----------- |
|dfXtrain| Dataframe from "X_train.txt" file|
|dftrainsubject| Dataframe from "subject_train.txt" file|
|dftrainactivity| Dataframe from "y_train.txt" file|
|dfXtest| Dataframe from "X_test.txt" file|
|dftestsubject| Dataframe from "subject_test.txt" file|
|dftestactivity| Dataframe from "y_test.txt" file|
|traindataset| Combined "Train" dataset with data from dfXtrain,dftrainsubject and dftrainactivity dataframes (using "cbind")|
|testdataset| Combined "Test" dataset with data from dfXtest,dftestsubject and dftestactivity dataframes (using "cbind")|
|combineddataset| Train and Test records merged into this dataset using "rbind"|


