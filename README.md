# Course Project - Getting and Cleaning Data

This is the repo for "Getting and Cleaning Data" Course Project. The purpose of this project is to demonstrate the ability to:

- Read data from different files
- Merge data into one dataset
- Tidy the merged dataset to make it user friendly
- Extract desired columns from the merged dataset
- Finally,create a new data file from the tidied dataset, to perform aggregate operations grouped by few columns

The objective is to read the data from [Human Activity Recognition Using Samsung Galaxy S Smartphone Dataset] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ). 

More details about this dataset can be found here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

# Files

* run_analysis.R - Script to download, read, clean data and to create a new Tidy dataset
* README.md - Overview of reporsitory, its contents and explains how the files and script are connected
* CodeBook.md - describes the variables, the data, and any transformations or work that you performed to clean up the data
* TidyDataSet.txt - Output of "run_analysis.R" .Tidy data file with means of each measurement by Subject and Activity

##Script

"run_analysis.R"- performs the operations/ tranformations defined in the transformation section below. The script can be loaded and run by the following command

```
source("run_analysis.R")
```
##Transformations

###Part 1
1. Download the UCI_HAR_Dataset.zip file from the internet to the working directory
2. Unzip the input dataset downloaded
3. Read the following files in /train/ folder and combine the "train" dataset using "cbind" command
  - X_train.txt
  - subject_train.txt
  - y_train.txt
4. Read the following files in /test/ folder and combine the "test" dataset using "cbind" command
  - X_test.txt
  - subject_test.txt
  - y_test.txt
5. Merge all the combined "train" and test dataset from step 3 and 4 into one dataset
6. Read the following file to add column names to the combined dataset from step 5. Name  the last two columns as "Subject" and "Activity"
  - features.txt

###Part 2
1. Extracts only the measurements on the mean and standard deviation for each measurement from combined dataset (step6) , using the "grep" command
2. Create a new dataset that will only have Means,Standard Deviations, Subject and Activity fields

###Part 3
1. Uses descriptive activity labels to name the activities in the dataset. The Activity labels are read the second column of the following file. ( Replace "_" from the label with " " )
  - activity_labels.txt
 
###Part 4
1. Appropriately labels the dataset with descriptive variable names. The following has been replaced to make data user friendly
  - Columns starting with "t" to "Time"
  - Columns starting with "f" to "Frequency"
  - Replace "-mean()" with "Mean"
  - Replace ".std" with "STD"
  - Replace "Acc" with "Accelerometer"
  - Replace "Mag" to "Magnitude"
  - Replace "-freq()" to "Frequency"
  - Replace "angle" withe "Angle"
  - Replace "gravity" with "Gravity"
  - Replace "tBody" with "TimeBody"
  - Replace "BodyBody" with "Body"

###Part 5
1. From the dataset in Part 4, creates a second, independent tidy dataset with the mean of each variable calculated by subject and activity.
2. The mean of measurements are grouped by using "aggregate" command . To make this command work faster the following library is used 
  - library(data.table)
3. Tidy Dataset is written in a file "TidyDataSet.txt". ( this file is stored in the working directory

## More about Metadata, Variables and Files

See CodeBook.md (https://github.com/afshe/getting_and_cleaning_data_course_project/blob/master/CodeBook.md) for more details
