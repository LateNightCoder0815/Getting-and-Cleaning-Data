## Script requires reshape2 from CRAN. Please use install.packages('reshape2') if not yet installed
library(reshape2)

## Define file name for download of dataset
fileName <- 'dataset.zip'

## Defined folder in zip file
folderName <- 'UCI HAR Dataset'

## Download dataset if not exist
if (!file.exists(fileName)){
  download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip',
                fileName)
}

## Unzip files if not done previously
if (!file.exists(folderName)){
  unzip(fileName)
}


## Task 1) Merges the training and the test sets to create one data set.

testX = read.table(file.path(folderName,'test','X_test.txt'))
testY = read.table(file.path(folderName,'test','y_test.txt'))
testSub = read.table(file.path(folderName,'test','subject_test.txt'))

trainX = read.table(file.path(folderName,'train','X_train.txt'))
trainY = read.table(file.path(folderName,'train','y_train.txt'))
trainSub = read.table(file.path(folderName,'train','subject_train.txt'))

## Combine all in one dataset
dataX <- rbind(testX,trainX)
dataY <- rbind(testY,trainY)
dataSub <- rbind(testSub,trainSub)

## Add names
measures <- read.table(file.path(folderName,'features.txt'))
names(dataX) <- measures$V2
names(dataY) <- 'activity'
names(dataSub) <- 'subject'

## Data frame with subject, y and features (X) columns
data <- cbind(dataSub,dataY,dataX)


## Task 2) Extracts only the measurements on the mean and standard deviation for each measurement.

## Grep all mean() and std() variables
relevantMeasures <- as.character(measures[grep('-(mean|std)\\(\\)', measures[,2]),]$V2)

data <- data[,c('subject','activity',relevantMeasures)]


## Task 3) Uses descriptive activity names to name the activities in the data set
labels <- read.table(file.path(folderName, 'activity_labels.txt'))

## Lookup activity and overwrite with clear name
data[,2] <- labels[data[,2],2]


## Task 4) Appropriately labels the data set with descriptive variable names. 

## Labels have been added in step 1
## Remove brackets and dashes from X value names for readability
names(data) <- c('subject','activity',gsub('\\-|\\(|\\)','',relevantMeasures))


## Task 5) From the data set in step 4, creates a second, independent tidy data set 
##          with the average of each variable for each activity and each subject.

## Good introduction to reshape2: http://seananderson.ca/2013/10/19/reshape/
## All features will be in the column 'variable'
dataMelt <- melt(data, id = c('subject','activity'))

## Cast the features back in but calculate the average over repeated occurances
dataFinal <- dcast(dataMelt, subject + activity ~ variable, mean)

## Write our result to disk
write.table(dataFinal, "tidy.txt", row.names=FALSE)