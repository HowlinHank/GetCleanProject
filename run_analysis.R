## run_analysis.R
## author: HowlinHank
## creation date: 2015-06-18
## modification date: 2015-06-19
## Copyright 2015 Henry Sang, Jr.  All Rights Reserved

# This code is for fulfillment of the Coursera June 2015 Getting and Cleaning Data course offered
# by Johns Hopkins as part of the Data Science SPecialization series.
#
# The project analyses data from smartphones from subjects undergoing six supervised tasks such as
# walking, walking, sitting, laying, etc. while wearing a Samsung SII smart phone and using its
# sensors.
#
# The goal is to return a tidy data set of means and standard deviation values. Proper execution
# is described below in the USAGE section.  There is an associated Readme.md file with 
# instructions and a CodeBook.md file to describe the data in the output and inputs.
#
#
# Per the license agreement. Attribution to the authors of the data
#
# Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
# Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support 
# Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). 
# Vitoria-Gasteiz, Spain. Dec 2012




##----------------------------------------------------------------------------------------------
##----------------------------------------------------------------------------------------------
## USAGE
#
# 1) Download and decompress the UCI package
# 2) source this code: source("run_analysis.R")
# 3) Execute run_analysis(dir) where dir should be the path to the uncompressed UCI code
# 4) The return is the tidy data frame described in the COdeBook.md file
##----------------------------------------------------------------------------------------------
##----------------------------------------------------------------------------------------------




##----------------------------------------------------------------------------------------------
##----------------------------------------------------------------------------------------------
## run_analysis(dir)
#
# This routine uses the directory "dir" as the parent directory containing the uncompressed data
# provided by Anjuita, et al.  
#
# The routine
# 1) calls the helper function run_analysis_input() to read in the input data and create a
#   merged summary data table.
# 2) Then the routine will tidy up the raw data by appending time or freq for "t" or "f" 
#   measurements, converting all measurement names to lowercase, and eliminating "-"
# 3) Then we will filter out all measurements except for those that are mean() or std() in their
#   names.  This is a reduced data table of summaries. Keep the subject and activities columns.
#   These column names are written out to the text file "reducedColNames.txt"
# 4) Next we will group these by subject then activity


run_analysis <- function(uci_dir="."){
    library(dplyr)
    library(data.table)
    
    
    # Set the proper working directory. Parent for the UCI data
    if( file.exists(uci_dir)) {
        setwd(uci_dir)
    }
    else( stop("No directory for UCI data. Give path to head directory."))
    
    # Load all of the test and train data into a single frame
    rawData <- run_analysis_input()
    
    
    # Now start to tidy up the data by subselecting the columns with mean() and std().
    # selCol will be a vector with those fields
    colNames <- colnames(rawData)
    selCol <- grepl("mean\\(\\)|std\\(\\)", colNames)
    
    #tidy up column names by converting all to lower case and preface all of the "t" and "f"
    # values with time or freq (for frequency). Sub out the "-"
    colNames <- gsub("-","", colNames)
    colNames <- tolower(colNames)
    colNames <- sub("^t", "time", colNames)
    colNames <- sub("^f", "freq", colNames)
    colnames(rawData) <- colNames
    
    #Reduce to the columns that are wanted with mean and std
    # since selCol is only for the measurements, need to also keep the first two cols
    # for subject and activity, then mask out the rawData using selCol to subselect cols
    selCol <- c(TRUE, TRUE, selCol)
    reducedData <-rawData[ ,selCol]
    write(colNames,"./reducedColNames.txt")
    
    #Now will create a summary table with average of measurements for each subject and activity
    reducedData <- group_by(reducedData, subject, activity)
    sumData <- summarise_each(reducedData, funs(mean))
    sumData
}
#end of run_analysis()





##----------------------------------------------------------------------------------------------
##----------------------------------------------------------------------------------------------
## run_analysis_input(dir)
## 
# dir is the input directory for the UCI data set. This routine retrieves the necessary files
# to build a full raw summary dataset from the summary data.
#
# Steps
# 1) read the "features.txt" file to get the column names
# 2) read the "activity_labels.txt" file to be get the description of the activity from the coding
# 3) For each of the test and training date
#       a) read the summary data X_test.txt or X_train.txt into a datafram
#       b) add column names
#       c) read the activity performed in the y_test.txt or y_train.txt files
#       d) change the activity to the desciption of the activity e.g. "WALKING" from code and
#           add column name of "activity"
#       f) merge the activity to the left of the summary data frame
#       g) read the subject codes for each rom from the subject_test.txt or subject_train.txt files
#       h) label those columns "subject"
#       i) merge subject to the left of the summary data set
# 4) append the train set to the test set 
# 5) return

run_analysis_input <- function() {
    
       
    #Get the column names into variable colNames.  Strip off the leading number. Then
    #select out the columns which have mean() or std() into a vector that will be used
    #to subselect columns per assignment
    #tmpFr <- read.table("features.txt", colClasses="character")
    #colNames <- tmpFr[2]
    #colNames <-unlist(colNames)
    #rm(tmpFr)
    colNames <- get_colNames("features.txt")
        
    #Get activity labels and codes, turn the first column index into a factor
    activityLabels <- read.table("activity_labels.txt", colClasses="character")
    activityLabels$V1 <- as.factor(activityLabels$V1)
    
    ## Start to load the test data and label these according to the colNames
    # then get the actitivies and subjects for each row and name these activity and subject
    # then merge them to have subject, activity, data
    
    testData <- read.table("./test/X_test.txt", colClasses="numeric", strip.white=TRUE)
    setnames(testData,colNames)     ## add column names
    tmp <- read.table("./test/y_test.txt", colClasses="factor")
    # now do a lookup substitution of activity description for the activity code and add colName
    tmp <- data.frame(activity = activityLabels[ tmp[[1]],2])    
    testData <- cbind(tmp, testData)
    tmp <- read.table("./test/subject_test.txt",colClasses="factor")
    names(tmp) <- "subject"
    testData <- cbind(tmp, testData)
 
    ## Start to load the train data and label these according to the colNames
    # then get the actitivies and subjects for each row and name these activity and subject
    # then merge them to have subject, activity, data
    trainData <- read.table("./train/X_train.txt", colClasses="numeric", strip.white=TRUE)
    setnames(trainData,colNames)
    tmp <- read.table("./train/y_train.txt", colClasses="factor")
    # now do a lookup substitution of activity description for the activity code and add colName
    tmp <- data.frame(activity = activityLabels[ tmp[[1]],2])    
    trainData <- cbind(tmp, trainData)
    tmp <- read.table("./train/subject_train.txt",colClasses="factor")
    setnames(tmp,"subject")
    trainData <- cbind(tmp, trainData)
    
    #OK, now merge the rows together
    data <- rbind(testData, trainData)
    
    data
}
# end of run_analysis_input()




##----------------------------------------------------------------------------------------------
##----------------------------------------------------------------------------------------------
## get_colNames(file)

#   Helper function that takes the file that describes the measurements. The length of it
#   corresponds to the number of measurements taken.  The second column are those names.
#   RETURNS: list of column names


get_colNames <- function(file) {
    #Get the column names into variable colNames.  Strip off the leading number. Then
    #select out the columns which have mean() or std() into a vector that will be used
    #to subselect columns per assignment
    tmpFr <- read.table(file, colClasses="character")
    colNames <- tmpFr[2]
    colNames <-unlist(colNames)
    rm(tmpFr)
    colNames
}