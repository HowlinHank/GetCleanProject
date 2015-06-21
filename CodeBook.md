#CodeBook.md
#### This code book is for the Getting and Cleaning Data project June 2015
####This code is a derivative of the UCI data set. License listed at the end. Reference:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
##---------------------------------------------------------
The run_analysis.R program will output a tidy data frame.  The values are the average of the
values for each of the activities for each subjects for the various measurements.  The
measurements in this case are ONLY those which are the mean (name containing mean)
 or standard deviations (names containing std()) from the original summary data sets.
The columns include:
subject

activity

timebodyaccmean()x

timebodyaccmean()y

timebodyaccmean()z

timebodyaccstd()x

timebodyaccstd()y

timebodyaccstd()z

timegravityaccmean()x

timegravityaccmean()y

timegravityaccmean()z

timegravityaccstd()x

timegravityaccstd()y

timegravityaccstd()z

timebodyaccjerkmean()x

timebodyaccjerkmean()y

timebodyaccjerkmean()z

timebodyaccjerkstd()x

timebodyaccjerkstd()y

timebodyaccjerkstd()z

timebodygyromean()x

timebodygyromean()y

timebodygyromean()z

timebodygyrostd()x

timebodygyrostd()y

timebodygyrostd()z

timebodygyrojerkmean()x

timebodygyrojerkmean()y

timebodygyrojerkmean()z

timebodygyrojerkstd()x

timebodygyrojerkstd()y

timebodygyrojerkstd()z

timebodyaccmagmean()

timebodyaccmagstd()

timegravityaccmagmean()

timegravityaccmagstd()

timebodyaccjerkmagmean()

timebodyaccjerkmagstd()

timebodygyromagmean()

timebodygyromagstd()

timebodygyrojerkmagmean()

timebodygyrojerkmagstd()

freqbodyaccmean()x

freqbodyaccmean()y

freqbodyaccmean()z

freqbodyaccstd()x

freqbodyaccstd()y

freqbodyaccstd()z

freqbodyaccjerkmean()x

freqbodyaccjerkmean()y

freqbodyaccjerkmean()z

freqbodyaccjerkstd()x

freqbodyaccjerkstd()y

freqbodyaccjerkstd()z

freqbodygyromean()x

freqbodygyromean()y

freqbodygyromean()z

freqbodygyrostd()x

freqbodygyrostd()y

freqbodygyrostd()z

freqbodyaccmagmean()

freqbodyaccmagstd()

freqbodybodyaccjerkmagmean()

freqbodybodyaccjerkmagstd()

freqbodybodygyromagmean()

freqbodybodygyromagstd()

freqbodybodygyrojerkmagmean()

freqbodybodygyrojerkmagstd()


##The original feature description is given in the features_info.txt file and relevant info is 
Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

##---------------------------------------
The six activities include

1 WALKING

2 WALKING_UPSTAIRS

3 WALKING_DOWNSTAIRS

4 SITTING

5 STANDING

6 LAYING

##---------------------------------------
License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

