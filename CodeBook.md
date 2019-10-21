# Getting and Cleaning Data Project

This code book describes the variables, the data, and any transformation or work performed to clean up the data.

## Study Design

* The data come from the accelerometers on a Samsung Galaxy S II smartphone. It recorded various accelerometer measurements for 30 subjects during different prescribed activities. More information on the experiment can be found at: https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* The data for the project is downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* This zip file has been saved in the working directory by the run_Analysis.R script (analysis script) as ProjectData.zip
* This file is unzipped in the working directory and creates the subdirectory 'UCI HAR Dataset' which contains all the raw data and a README.txt which describes the dataset.
* The raw data is separated into test and training datasets. Within each of the test and training datasets the data are separated into files for measurement data, the activity labels, and the test subject labels.

## Code Book

###1. Merges the training and test sets to create one data set.

The files for the test and training datasets raw data, activity labels and test subjects are imported into the following dataframes

*subject_test
*X_test
*y_test
*subject_train
*X_train
*y_train

The test files are combined together in data frame named testBind
The train files are combined together in data frame named trainBind

Test and Train data is combined into allBind

###2. Naming the Columns

The 1st and 2nd columns are named subject_number and activity_labels respectively

The rest of the columns are named sequentially with the data frame "thenames" created from the features.txt file

###3. Extracting only mean and standard deviation data 

Create a data frame called 

* subsetData

which only contains columsn which state the mean or the standard deviation, and the subject_number and activity_labels.

###4. Create a new column that labels the data set with descriptive activity names

* activity_name 

column describes what activity the subject was doing when the data was acquired 

###5. Label the dataset with descriptive variable names

###6. Create a tidy data set

* TidyData.txt

is created which is a txt file with the tidy data 