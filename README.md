## Peer-graded Assignment: Getting and Cleaning Data Course Project

This repository is contains all files relevant to the course project for Getting and Cleaning Data of the Coursera Data Science Spezialization. 

The course work is based on the data set provided by the [UCI Machine Learning Repository: Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

### Description of the files

* run_analysis.R: Main script to process the data from above source:
	** Download the data set from source if not existant
	** Unzip all files if necessary
	** Merges the training and the test sets to create one data set.
	** Extracts only the measurements on the mean and standard deviation for each measurement.
	** Uses descriptive activity names to name the activities in the data set
	** Appropriately labels the data set with descriptive variable names. 
	** Create tidy data set with the average of each variable for each activity and each subject.
* tidy.txt: Output of the script as requested on the Coursera submission page: Created with write.table() using row.name=FALSE
* CodeBook.md: Code book for the tidy data set. Code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.

### Prerequisites

The script uses the reshape2 library from CRAN. If you do not have this library installed please use the following command before executing the script:
* install.packages('reshape2')