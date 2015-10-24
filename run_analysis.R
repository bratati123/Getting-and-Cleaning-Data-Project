## Prepare tidy data that can be used later for analysis

CurrDir <- setwd("C:/Coursera/Getting and Cleaning Data/Project")

##Reading test and train data sets in R

Xtest <- read.table("X_test.txt", colClasses = "numeric")

Xtrain <- read.table("X_train.txt", colClasses = "numeric")

features <- read.table("features.txt", colClasses = "character")
features <- features[,2]


##AllData : Obtained by doing rbind on the test and train data text files

              
##Merges the training and the test sets to create one data set

XTestTrainData <- rbind(Xtest,Xtrain)

              ###############################################################


##2.Extracts only the measurements on the mean and standard deviation for each measurement
extractMeanStdfeatures <- features[grepl("mean|std", features)==TRUE]

##3.Uses descriptive activity names to name the activities in the data set

##4.Appropriately labels the data set with descriptive variable names.
names(XTestTrainData) = features
XTestTrainData <- XTestTrainData[,extractMeanStdfeatures ]

##5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

write.table(XTestTrainData, file = "./tidy_data.txt", row.names = FALSE)

