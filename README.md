# Getting-and-Cleaning-Data

This project introduces a clean up script that merges cleans and simplifies data on UCI HAR Dataset, a set of data that is based on human activity measurements via smartphone on the waist. Data is collected via smartphone's embedded accelerometer and gyroscope for different activities such as sitting walking,standing... 3-axial linear acceleration and 3-axial angular velocity is recorded from 30 subjects, and processed for further feature generation. Script simply merges training and test data into a single dataset, simplifies the data and aggragate and order it for a simple output.

#Script
Run_analysis.R cleaning script does the following:

Merges the training and the test sets from UCI HAR Dataset to create one single combined set.

Filters the mean and standard deviation variables for each measurement for a simpler data.

Re-populates the data set with more human readable activity data.

Re-labels the data set with more human readable variable names.

Creates a independent tidy data set with the average of each variable per activity and per subject as requested.

Created data is writen as tidydata.txt to disk

#Files
readme.txt    :this file

run_analysis.R: Data clean up script on R

codebook.txt  :information on original and modified data set


For more information about UCI HAR Dataset contact: activityrecognition@smartlab.ws

#License
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
