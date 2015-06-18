# Course Project - Getting and Cleaning Data

This is the repo for "Getting and Cleaning Data" Course Project. The purpose of this project is to demonstrate the ability to

- Read data from different files
- Merge data into one file 
- Tidy the merged data set to make it user friendly
- Extract desired columns 
- Finally,create a new data file from the tidied data set to perform aggregate operations grouped by a few columns

The objective is to read the data from [Human Activity Recognition Using Samsung Galaxy S Smartphone Dataset] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ). 

More details about this dataset can be found here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

# Files

* run_analysis.R - Script to download, read, clean data and to create a new Tidy data set
* README.md - Overview of reporsitory, its contents and explains how the files and script are connected
* CodeBook.md - describes the variables, the data, and any transformations or work that you performed to clean up the data
* TidyDataSet.txt - Output of "run_analysis.R" .Tidy data file with means of each measurement by Subject and Activity

##Script

"run_analysis.R"- performs the operations/ tranformations defined in the transformation section below. The script can be loaded and run by the following command

```
source("run_analysis.R")
```
##Transformation


