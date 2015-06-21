# GetCleanProject
## run_analysis.R
#### author: HowlinHank
#### creation date: 2015-06-18
#### modification date: 2015-06-21
#### Copyright 2015 Henry Sang, Jr.  All Rights Reserved

##### This code is for fulfillment of the Coursera June 2015 Getting and Cleaning Data course offered
##### by Johns Hopkins as part of the Data Science SPecialization series.
####
##### The project analyses data from smartphones from subjects undergoing six supervised tasks such as
##### walking, walking, sitting, laying, etc. while wearing a Samsung SII smart phone and using its
##### sensors.
#
##### The goal is to return a tidy data set of means and standard deviation values. Proper execution
##### is described below in the USAGE section.  There is an associated Readme.md file with 
##### instructions and a CodeBook.md file to describe the data in the output and inputs.
#
#
## Per the license agreement. Attribution to the authors of the data
#
##### Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
##### Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support 
##### Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). 
##### Vitoria-Gasteiz, Spain. Dec 2012




##----------------------------------------------------------------------------------------------
##----------------------------------------------------------------------------------------------
## USAGE
#
## 1) Download and decompress the UCI package
## 2) source this code: source("run_analysis.R")
## 3) Execute run_analysis(dir) where dir should be the path to the uncompressed UCI code
## 4) The return is the tidy data frame described in the CodeBook.md file
##----------------------------------------------------------------------------------------------
##----------------------------------------------------------------------------------------------
