## Code Book

This code book summarizes the data used for esablishing the course work and describes the process deployed to create the tidy data set requested for the peer assignment.

## Data summary

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz [have been captured]. [...]

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain." [Source](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Source files

* 'features.txt': List of all features.

* 'activity_labels.txt': Links the class labels with their activity name.

* 'train/X_train.txt': Training set.

* 'train/y_train.txt': Training labels.

* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

* 'test/X_test.txt': Test set.

* 'test/y_test.txt': Test labels.

* 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

This is the extract of all relevant files used from the [UCI Machine Learning Repository: Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). More information can be found in the README.txt and features_info.txt of the data set including all feature descriptions and unit measures. All other files of the data set have not been used.

## Data process

The project goal is to combine the train and test set, merge activity labels and the subject IDs, tidy the feature names, select a subset of all variables which only contain the mean and standard deviation and to average over all occurences grouped by activity and subject. To establish this the following steps have been performed:

	* Merges the training and the test sets to create one data set.
	* Extracts only the measurements on the mean and standard deviation for each measurement.
	* Uses descriptive activity names to name the activities in the data set
	* Appropriately labels the data set with descriptive variable names. 
	* Create tidy data set with the average of each variable for each activity and each subject.

## Variable description

A complete desciption can be found in the downloaded data set within the README.txt and features_info.txt. The project reduces the data set to the following variables including their mean and standard deviantion (std) as included in the variable names.

 
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag