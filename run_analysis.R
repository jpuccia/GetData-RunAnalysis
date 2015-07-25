## run_analysis.R
##

run_analysis <- function(){
        ## constants
        dataFolderName <- "data"
        dataFolderAndPath <- paste0("./", dataFolderName)
        
        zipFile <- "getdata-projectfiles-UCI HAR Dataset.zip"
        zipFileAndPath <- paste0(dataFolderAndPath, "/", zipFile)
        
        zipDataFolder <- "UCI HAR Dataset"
        zipDataFolderAndPath <- paste0(dataFolderAndPath, "/", zipDataFolder)

        featuresFileAndPath <- "./data/UCI HAR Dataset/features.txt"
        activityFileAndPath <- "./data/UCI HAR Dataset/activity_labels.txt"
        
        ## File names and paths for the Test data
        activityDataFileAndPath_test <- "./data/UCI HAR Dataset/test/X_test.txt"
        subjectsFileAndPath_test <- "./data/UCI HAR Dataset/test/subject_test.txt"
        testFileAndPath_test <- "./data/UCI HAR Dataset/test/y_test.txt"
        
        ## File names and paths for the Training data
        activityDataFileAndPath_train <- "./data/UCI HAR Dataset/train/X_train.txt"
        subjectsFileAndPath_train <- "./data/UCI HAR Dataset/train/subject_train.txt"
        testFileAndPath_train <- "./data/UCI HAR Dataset/train/y_train.txt"
        
        
        ## Download and Unzip the raw data files to our working directory.
        downloadZipFile(dataFolderName, zipFileAndPath)
        unzipDataFile(zipDataFolderAndPath, zipFileAndPath, dataFolderAndPath)

        ## Merge all of the Test data together
        print("Merging Test data...")
        testData <- buildActivityDataSet(
                featuresFileAndPath, activityDataFileAndPath_test, subjectsFileAndPath_test, 
                testFileAndPath_test, activityFileAndPath)
        
        
        ## Merge all of the Training data together
        print("Merging Training data...")
        trainData <- buildActivityDataSet(
                featuresFileAndPath, activityDataFileAndPath_train, subjectsFileAndPath_train, 
                testFileAndPath_train, activityFileAndPath)
        
        ## Merge test and train data together
        print("Merging Test and Training data together...")
        
        ## Req. 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
        ##
        ##... plus the subject numbers and activity descriptions
        stdAndMeanColumns <- 
                c(grep("*std*", names(testData)), grep("*mean*", names(testData)), 
                  grep("*Mean*", names(testData)))
        factorColumns <- 
                c(grep("subject", names(testData)),
                  grep("activity", names(testData)))
        allColumns <- c(stdAndMeanColumns, factorColumns)
        
        variableColumnNames <- names(testData)[stdAndMeanColumns]
        factorColumnNames <- names(testData)[factorColumns]
        
        ## Req. 1. Merges the training and the test sets to create one data set.
        ##
        allData <- rbind(testData[,allColumns], trainData[,allColumns])
        
        ## Req. 5. From the data set in step 4, creates a second, independent tidy data 
        ##... set with the average of each variable for each activity and each subject.
        ##
        library(reshape2)
        allDataMelt <- melt(allData, id=factorColumnNames, measure.vars=variableColumnNames)
        tidyData <- dcast(allDataMelt, subject + activity ~ variable,mean)

        ## TODO: Write the tidyData to a text file
        tidyData
}

downloadZipFile <- function(dataFolderName, zipFileAndPath){
        
        ## Does our data folder exist
        if (!file.exists(dataFolderName)) {
                print(paste("Creating folder", dataFolderName))
                dir.create(dataFolderName)
        }
        else {
                print(paste(dataFolderName,"folder found"))
        }
        
        if (!file.exists(zipFileAndPath)){
                ## Pull down data (zip file) to the data folder in the project's working directory
                print(paste0("Downloading ", zipFileAndPath, "..."))
                fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
                invisible(download.file(fileUrl, destfile = zipFileAndPath, method = "curl"))
                print(paste(zipFileAndPath,"downloaded"))
        }
        else{
                print(paste(zipFileAndPath,"found"))
        }
}

unzipDataFile <- function(zipDataFolderAndPath, zipFileAndPath, dataFolderAndPath){
        ## Unzip contents of file
        if (!file.exists(zipDataFolderAndPath)){
                print("Unzipping raw data...")
                unzip(zipfile = zipFileAndPath, exdir = dataFolderAndPath)
                print("Raw data unzipped")
        }
        else{
                print("Raw data found")
        }
}

buildActivityDataSet <- function(featuresFileAndPath, activityDataFileAndPath, 
                                 subjectsFileAndPath, testFileAndPath, activityFileAndPath){
        ## Read the test featues. These are the labels for the 561 measurements 
        ##... in the X_test.txt and X_train.txt files. These will become our 
        ##... headers.
        features <- read.table(
                file=featuresFileAndPath, 
                header=FALSE, sep=" ", colClasses=c("integer","character"), strip.white=TRUE)
        
        ## Read in all of the test data
        activityData <- read.table(
                file=activityDataFileAndPath, 
                header=FALSE, colClasses=as.vector(rep("numeric",561)))
        
        ## Req. 4. Appropriately labels the data set with descriptive variable names. 
        ##
        ## Use the feature labels as the header for our activityData
        names(activityData) <- features$V2
        
        ## Read in a list of the subject numbers that performed the tests.
        ##... There is one subject for each row of our activityData.
        subjects <- read.fwf(file=subjectsFileAndPath, header=FALSE, width=c(2), strip.white=TRUE)
        
        ## Read in a list of the test activity codes for tests performed by the subject.
        ##... There is one test code for each row of activityData.
        tests <- read.fwf(file=testFileAndPath, header=FALSE, width=c(1), strip.white=TRUE)
        
        ## Read in the activty code table.  This will be used to provide a 
        ##... readable activity name for the codes in each row of 
        ##... activityData.
        activities <- read.table(
                file=activityFileAndPath, 
                header=FALSE, sep=" ", colClasses=c("integer","character"), strip.white=TRUE)
        
        ## Req. 3. Uses descriptive activity names to name the activities in the data set
        ##
        ## Update the activity codes in our activityData with the
        ##... name of each activity
        activityData[, "activity"] <- tests
        activityData[activityData$activity==1,]$activity <- "WALKING"
        activityData[activityData$activity==2,]$activity <- "WALKING_UPSTAIRS"
        activityData[activityData$activity==3,]$activity <- "WALKING_DOWNSTAIRS"
        activityData[activityData$activity==4,]$activity <- "SITTING"
        activityData[activityData$activity==5,]$activity <- "STANDING"
        activityData[activityData$activity==6,]$activity <- "LAYING"
        
        ## Add the codes for the subjects that performed the tests to the activityData.
        activityData[, "subject"] <- subjects
        
        ## Return the activityData to the caller.
        activityData        
}