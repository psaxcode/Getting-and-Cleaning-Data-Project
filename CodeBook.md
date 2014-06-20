# Code Book -- Human Activity Recognition Using Smartphones Data Set
## Data Collection
This data set is based on [a data set] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) retrived from the UC Irvine Machine    
Learning Repository  
   
The original data is collected from an experiments that have been carried out  
with a group of 30 volunteers. Each person performed six activities ("WALKING",  
"WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")  
wearing a smartphone on the waist. Using its embedded accelerometer and  
gyroscope, 3-axial linear acceleration and 3-axial angular velocity were  
recorded at a constant rate of 50Hz. The activities corresponding to the  
measurements were labelled manually.   

The sensor signals (accelerometer and gyroscope) were pre-processed by applying  
noise filters and then sampled in fixed-width sliding windows of 2.56 sec and  
50% overlap (128 readings/window). The sensor acceleration signal, which has  
gravitational and body motion components, was separated into body acceleration  
and gravity.  

## Assembly of a Single Data Set

### Decription 
The original data set was randomly split into a training set and a test set.  
For this assignment, the training and the test data sets are combined to form a  
single data set. The combined data set has a column indicating the id numbers  
of the subjects, a column indicating the activities, and 561 columns for the  
recorded features. The "," and "-" characters in the original feature names are  
replaced by "_", empty parentheses are removed, and non-empty parentheses are  
replaced by a pair of ".".    

There are total 10299 rows, each of which represents an observation.

### Variables
* Activity: one of the 6 activities- "WALKING", "WALKING_UPSTAIRS",  
"WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"
* Subject: the id number of the 30 subjects

Features are normalized and bounded within [-1,1].The naming of the 561  
measurements follows the rules below.  
### Feature Naming Conventions
* t: time domain signals
* f: frequancy domain signals.
* Acc: signal collected from  the accelerometer   
* Gyro: signal collected from  the gyroscope
* Body: the body component of the original signal.  
* Gravity: the gravity component of the original signal.
* Jerk: the computed jerk signal
* Mag: the magnitude of these three-dimensional signals
* XYZ: 3-axial signals in the X, Y and Z directions.

These signals were used to estimate variables of the feature vector for each  
pattern:  

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


The set of variables that were estimated from these signals are: 
* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean  
frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT  
of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample.  
These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

  

## Creating a Tidy Data Set
Only the means and standard deviations of these measurements are extracted from  
the original data set, restulting in a new data set containing 86 of the  
original features.   

Then the new data set is summarized and reorganized by computing the average of  
each feature for each Subject/Activity combination. This is contained in the  
*NewData.txt* file, which is in csv format.









