# Tidy Dataset Code Book

## Original dataset:
> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
>
>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
>
>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
>
>These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
>
>Features are normalized and bounded within [-1,1].

## Transformation done:
1. Train dataset retrieved and combined with its subjects and activity datasets.
2. Test dataset retrieved and combined with its subjects and activity datasets.
3. Train and test dataset merged together.
4. Extract variable contains mean() and std() in its name for mean and standard deviation values of each measurement.
5. Replace activity ID with its descriptive names (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
6. Apply column names from "features.txt" file to the extracted dataset.
    Column name cleaned by correcting typo (BodyBody to Body), replace "-" with ".", remove "()", replace "t" with "time", and replace "f" with "freq" to obtain more descriptive variable name.
7. To generate the tidy dataset:
    * Extracted dataset group by activity and subject
    * Apply mean function to each measurement column
    * Append "mean.of_" string to each measurement column name

## Variable names in tidy dataset
* activity.name - The name of the activity performed by the subject
    WALKING
    WALKING_UPSTAIRS
    WALKING_DOWNSTAIRS
    SITTING
    STANDING
    LAYING

* subject - ID of subjects performing the experiments
    1..30

* mean.of_timeBodyAcc.mean.X - Per activity per subject average of mean value of timed signal body accelaration on X axis

* mean.of_timeBodyAcc.mean.Y - Per activity per subject average of mean value of timed signal body accelaration on Y axis

* mean.of_timeBodyAcc.mean.Z - Per activity per subject average of mean value of timed signal body accelaration on Z axis

* mean.of_timeBodyAcc.std.X - Per activity per subject average of standard deviation value of timed signal body accelaration on X axis

* mean.of_timeBodyAcc.std.Y - Per activity per subject average of standard deviation value of timed signal body accelaration on Y axis

* mean.of_timeBodyAcc.std.Z - Per activity per subject average of standard deviation value of timed signal body accelaration on Z axis

* mean.of_timeGravityAcc.mean.X - Per activity per subject average of mean value of timed signal gravity accelaration on X axis

* mean.of_timeGravityAcc.mean.Y - Per activity per subject average of mean value of timed signal gravity accelaration on Y axis

* mean.of_timeGravityAcc.mean.Z - Per activity per subject average of mean value of timed signal gravity accelaration on Z axis

* mean.of_timeGravityAcc.std.X - Per activity per subject average of standard deviation value of timed signal gravity accelaration on X axis

* mean.of_timeGravityAcc.std.Y - Per activity per subject average of standard deviation value of timed signal gravity accelaration on Y axis

* mean.of_timeGravityAcc.std.Z - Per activity per subject average of standard deviation value of timed signal gravity accelaration on Z axis

* mean.of_timeBodyAccJerk.mean.X - Per activity per subject average of mean value of timed signal body jerk (from linear acceleration and angular velocity) on X axis

* mean.of_timeBodyAccJerk.mean.Y - Per activity per subject average of mean value of timed signal body jerk (from linear acceleration and angular velocity) on Y axis

* mean.of_timeBodyAccJerk.mean.Z - Per activity per subject average of mean value of timed signal body jerk (from linear acceleration and angular velocity) on Z axis

* mean.of_timeBodyAccJerk.std.X - Per activity per subject average of standard deviation value of timed signal body jerk (from linear acceleration and angular velocity) on X axis

* mean.of_timeBodyAccJerk.std.Y - Per activity per subject average of standard deviation value of timed signal body jerk (from linear acceleration and angular velocity) on Y axis

* mean.of_timeBodyAccJerk.std.Z - Per activity per subject average of standard deviation value of timed signal body jerk (from linear acceleration and angular velocity) on X axis

* mean.of_timeBodyGyro.mean.X - Per activity per subject average of mean value of timed signal body gyroscope value on X axis

* mean.of_timeBodyGyro.mean.Y - Per activity per subject average of mean value of timed signal body gyroscope value on Y axis

* mean.of_timeBodyGyro.mean.Z - Per activity per subject average of mean value of timed signal body gyroscope value on Z axis

* mean.of_timeBodyGyro.std.X - Per activity per subject average of standard deviation value of timed signal body gyroscope value on X axis

* mean.of_timeBodyGyro.std.Y - Per activity per subject average of standard deviation value of timed signal body gyroscope value on Y axis

* mean.of_timeBodyGyro.std.Z - Per activity per subject average of standard deviation value of timed signal body gyroscope value on Z axis

* mean.of_timeBodyGyroJerk.mean.X - Per activity per subject average of mean value of timed signal body gyroscope jerk (from linear acceleration and angular velocity) value on X axis

* mean.of_timeBodyGyroJerk.mean.Y - Per activity per subject average of mean value of timed signal body gyroscope jerk (from linear acceleration and angular velocity) value on Y axis

* mean.of_timeBodyGyroJerk.mean.Z - Per activity per subject average of mean value of timed signal body gyroscope jerk (from linear acceleration and angular velocity) value on Z axis

* mean.of_timeBodyGyroJerk.std.X - Per activity per subject average of standard deviation value of timed signal body gyroscope jerk (from linear acceleration and angular velocity) value on X axis

* mean.of_timeBodyGyroJerk.std.Y - Per activity per subject average of standard deviation value of timed signal body gyroscope jerk (from linear acceleration and angular velocity) value on Y axis

* mean.of_timeBodyGyroJerk.std.Z - Per activity per subject average of standard deviation value of timed signal body gyroscope jerk (from linear acceleration and angular velocity) value on Z axis

* mean.of_timeBodyAccMag.mean - Per activity per subject average of mean value of timed signal body acceleration magnitute value

* mean.of_timeBodyAccMag.std - Per activity per subject average of standard deviation value of timed signal body acceleration magnitute value

* mean.of_timeGravityAccMag.mean - Per activity per subject average of mean value of timed signal gravity acceleration magnitute value

* mean.of_timeGravityAccMag.std - Per activity per subject average of standard deviation value of timed signal gravity acceleration magnitute value

* mean.of_timeBodyAccJerkMag.mean - Per activity per subject average of mean value of timed signal body jerk (from linear acceleration and angular velocity) magnitute value

* mean.of_timeBodyAccJerkMag.std - Per activity per subject average of standard deviation value of timed signal body jerk (from linear acceleration and angular velocity) magnitute value

* mean.of_timeBodyGyroMag.mean - Per activity per subject average of mean value of timed signal body gyroscope magnitute value

* mean.of_timeBodyGyroMag.std - Per activity per subject average of standard deviation value of timed signal body gyroscope magnitute value

* mean.of_timeBodyGyroJerkMag.mean - Per activity per subject average of mean value of timed signal body gyroscope jerk magnitute value

* mean.of_timeBodyGyroJerkMag.std - Per activity per subject average of standard deviation value of timed signal body gyroscope magnitute value

* mean.of_freqBodyAcc.mean.X - Per activity per subject average of mean value of frequency signal body acceleration value on X axis

* mean.of_freqBodyAcc.mean.Y - Per activity per subject average of mean value of frequency signal body acceleration value on Y axis

* mean.of_freqBodyAcc.mean.Z - Per activity per subject average of mean value of frequency signal body acceleration value on Z axis

*mean.of_freqBodyAcc.std.X - Per activity per subject average of standard deviation value of frequency signal body acceleration value on X axis

* mean.of_freqBodyAcc.std.Y - Per activity per subject average of standard deviation value of frequency signal body acceleration value on Y axis

* mean.of_freqBodyAcc.std.Z - Per activity per subject average of standard deviation value of frequency signal body acceleration value on Z axis

* mean.of_freqBodyAccJerk.mean.X - Per activity per subject average of mean value of frequency signal body acceleration jerk value on X axis

* mean.of_freqBodyAccJerk.mean.Y - Per activity per subject average of mean value of frequency signal body acceleration jerk value on Y axis

* mean.of_freqBodyAccJerk.mean.Z - Per activity per subject average of mean value of frequency signal body acceleration jerk value on Z axis

* mean.of_freqBodyAccJerk.std.X - Per activity per subject average of standard deviation value of frequency signal body acceleration jerk value on X axis

* mean.of_freqBodyAccJerk.std.Y - Per activity per subject average of standard deviation value of frequency signal body acceleration jerk value on Y axis

* mean.of_freqBodyAccJerk.std.Z - Per activity per subject average of standard deviation value of frequency signal body acceleration jerk value on Z axis

* mean.of_freqBodyGyro.mean.X - Per activity per subject average of mean value of frequency signal body gyroscope value on X axis

* mean.of_freqBodyGyro.mean.Y - Per activity per subject average of mean value of frequency signal body gyroscope value on Y axis

* mean.of_freqBodyGyro.mean.Z - Per activity per subject average of mean value of frequency signal body gyroscope value on Z axis

* mean.of_freqBodyGyro.std.X - Per activity per subject average of standard deviation value of frequency signal body gyroscope value on X axis

* mean.of_freqBodyGyro.std.Y - Per activity per subject average of standard deviation value of frequency signal body gyroscope value on Y axis

* mean.of_freqBodyGyro.std.Z - Per activity per subject average of standard deviation value of frequency signal body gyroscope value on Z axis

* mean.of_freqBodyAccMag.mean - Per activity per subject average of mean value of frequency signal body acceleration magnitude value

* mean.of_freqBodyAccMag.std - Per activity per subject average of standard deviation value of frequency signal body acceleration magnitude value

* mean.of_freqBodyAccJerkMag.mean - Per activity per subject average of mean value of frequency signal body acceleration jerk magnitude value

* mean.of_freqBodyAccJerkMag.std - Per activity per subject average of standard deviation value of frequency signal body acceleration jerk magnitude value

* mean.of_freqBodyGyroMag.mean - Per activity per subject average of mean value of frequency signal body gyroscope magnitude value

* mean.of_freqBodyGyroMag.std - Per activity per subject average of standard deviation value of frequency signal body gyroscope magnitude value

* mean.of_freqBodyGyroJerkMag.mean - Per activity per subject average of mean value of frequency signal body gyroscope jerk magnitude value

* mean.of_freqBodyGyroJerkMag.std - Per activity per subject average of standard deviation value of frequency signal body gyroscope jerk magnitude value