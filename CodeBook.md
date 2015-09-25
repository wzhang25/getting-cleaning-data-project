getting and cleaning data project

The tidy data is a clean summary data for Human Activity Recognition Using Smartphones Dataset
Version 1.0 

The experiments were carried out with a group of 30 volunteers of 19-48 years;
Each of them performed six activities:standing, sitting, lying, walking, walking downstairs and walking upstairs;
3-axial linear acceleration (including body acceleration and gravity) and 3-axial angular velocity at a constant rate of 50Hz were measured by Samsung Galaxy S II, the data set was the merged data from two groups-test and train sets.

The dataset include 180 rows of 68 measure variables and 2 descriptive variables. 
Descriptive variables are subject (voluneteers 1-30) and activity (standing, sitting, lying, walking, walking downstairs and walking upstairs).
Measure variables are obtained by calculating the mean of multiple measurements of the same object in the same activity. They include the mean of mean and standard of the following measurements in three axial-X, Y or Z:
timeBodyAccelerator
timeGravityAccelerator
timeBodyAcceleratorJerk
timeBodyGyroscope
timeBodyGyroscopeJerk
frequencyBodyAccelerator
frequencyBodyAcceleratorJerk
frequencyBodyGyroscope

and the mean of mean and standard of the folloing measurements (in one dimension):
timeBodyAcceleratorMagnitude
timeGravityAcceleratorMagnitude
timeBodyAcceleratorJerkMagnitude
timeBodyGyroscopeMagnitude
timeBodyGyroscoopeJerkMagnitude
frequencyBodyAcceleratorMagnitude
frequencyBodyBodyAcceleratorJerkMagnitude
frequencyBodyBodyGyroscopeMagnitude
frequencyBodyBodyGyroscopeJerkMagnitude


The following work has been performed to clean the original data:
download original data by download.file;
add subject(volunteer) and activity information to the dataset derived from X_test and X_train;
label all variables in X_test and X_train by the names in feature.txt;
combine datasets derived from X_test and X_train by rbind;

then grep the column names with mean() and std() to create a subset;
give activity names;
use descriptive names to label the data set;
change subject names;

use aggregate function in plyr package to get the mean of all measurements;
use write.table function to write the tidy data into local file;
copy to github;

END.



