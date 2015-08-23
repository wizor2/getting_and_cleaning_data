## Code Book for run_analysis.R

This code book describes variables, data and procedure of clean up data via R script called run_analysis.R.

### The Data Source
- original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- data description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
- additional information: http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/

### Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### List of files with original data
- "activity_labels.txt"
- "features_info.txt"                           
- "features.txt"                                 
- "README.txt"                                  
- "test/Inertial Signals/body_acc_x_test.txt"   
- "test/Inertial Signals/body_acc_y_test.txt"   
- "test/Inertial Signals/body_acc_z_test.txt"   
- "test/Inertial Signals/body_gyro_x_test.txt"  
- "test/Inertial Signals/body_gyro_y_test.txt"  
- "test/Inertial Signals/body_gyro_z_test.txt"  
- "test/Inertial Signals/total_acc_x_test.txt"  
- "test/Inertial Signals/total_acc_y_test.txt"  
- "test/Inertial Signals/total_acc_z_test.txt"   
- "test/subject_test.txt"                       
- "test/X_test.txt"                             
- "test/y_test.txt"                             
- "train/Inertial Signals/body_acc_x_train.txt"
- "train/Inertial Signals/body_acc_y_train.txt" 
- "train/Inertial Signals/body_acc_z_train.txt" 
- "train/Inertial Signals/body_gyro_x_train.txt"
- "train/Inertial Signals/body_gyro_y_train.txt"
- "train/Inertial Signals/body_gyro_z_train.txt"
- "train/Inertial Signals/total_acc_x_train.txt"
- "train/Inertial Signals/total_acc_y_train.txt"
- "train/Inertial Signals/total_acc_z_train.txt"
- "train/subject_train.txt"                     
- "train/X_train.txt"                           
- "train/y_train.txt"

### Data table "allData"

A data table named `allData` has class data.frame and it contains merged data from original files (original data set).

Names of original variables is modified.
- "^t" is changed to "time"
- "^f" is changed to  "frequency"
- "Body" is changed to  "_Body"
- "Acc" is changed to "_Accelerometer"
- "Gyro"is changed to  "_Gyroscope"
- "_Body_Body" is changed to  "_Body"
- "Mag" is changed to  "_Magnitude"
- "Gravity" is changed to  "_Gravity"
- "Jerk" is changed to  "_Jerk"

for example
- "tBodyAcc-mean()-X" is changed to "time_Body_Accelerometer-mean()-X"                  
- "tBodyAcc-mean()-Y" is changed to "time_Body_Accelerometer-mean()-Y"          
- "tBodyAcc-mean()-Z" is changed to "time_Body_Accelerometer-mean()-Z"

### Data table "tidyData"
A data table named `tidyData` has class data.frame and it contains independent tidy data set with the average of each variable for each activity and each subject.

### Procedure of clean up data
1.     Merges the training and the test sets to create one data set.
2.     Extracts only the measurements on the mean and standard deviation for each measurement. 
3.     Uses descriptive activity names to name the activities in the data set
4.     Appropriately labels the data set with descriptive variable names. 
5.     From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
