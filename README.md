Getting-and-Cleaning-Data
=========================

Repository for the peer assesment on Getting and Cleaning Data course.

This repository contains 4 files the run_analysis.R script that transforms the UCI HAR Dataset  data into a clean an tidy dataset, the CodeBook.rmd that contains  information about the script and the variables, and a .txt an a .csv file that shows the output of the script.

In order for this script to work you need to set the working directory to a location that contains the UCI HAR Dataset file and have the reshape2 library installed.
 
The script works in five steps:
1.- Merges the training and the test sets to create one data set.
	For this we get the data from the subject_train.txt, y_train.txt and the x_train.txt files and we bind them, then we do the same with the x_test.txt, y_test.txt and the subject_test.txt, the we bind their rows, and add the features from features.txt files as colnames.
2.- Extracts only the measurements on the mean and standard deviation for each measurement.
	We extract only the first and second columns and the ones with the word mean, Mean or std() from our dataset.
3.- Uses descriptive activity names to name the activities in the data set.
	We extract eht activity labels from the activity_labels.txt.
4.- Appropriately labels the data set with descriptive activity names. 
	We merge the dataset with the activity labels, and change the name for the V2 colum that is the last one to descriptiveActivityName and then put it in second spot. 
5.- Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
	We melt the dataset using the colums with the activity, descriptiveActivityName and subject, then we use dcast on our dataset to molen our dataset and obtain a 180 x 89 clean and tidy dataset