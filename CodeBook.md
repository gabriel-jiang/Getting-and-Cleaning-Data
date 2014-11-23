Raw data:

activity_labels.txt: Links the class labels with their activity name.

features.txt: List of all features.

subject_test.txt: Each row identifies the subject who performed the activity for each window sample in the test set. Its range is from 1 to 30.

X_test.txt: Test set.

y_test.txt: Test labels.

subject_train.txt: Each row identifies the subject who performed the activity for each window sample in the training set. Its range is from 1 to 30.

X_train.txt: Training set.

y_train.txt: Training labels.

Description of variables in tidy data set:

subject has a numeric class with 30 levels, namely 1 to 30. These are the 30 volunteers who participated in the experiment.

activity has a factor class with 6 levels indicating the 6 activities in this experiment namely walking, walking upstairs, walking downstairs, sitting, standing and laying.

feature has a factor class. The transformation done is as tasked in the course project where only the measurements on the mean, mean(), and standard deviation, std(), for each measurement are extracted. Strictly speaking, this column can be split into four variables; domain (time domain signals prefixed by 't' to denote time or Fast Fourier Transform (FFT) prefixed by 'f' to indicate frequency domain signals), signal (all signals with a mean or standard deviation reading), statistic (mean or std) and axis (X, Y or Z). However, in doing so, NAs would be introduced where a feature does not have these four categories. An example is fBodyAccMag-mean() which does not have the axis category. Introducing NAs does not lead to a tidier data set and as such, I have left feature as it is without splitting into multiple variables.

value has a numeric class. The transformation calculates the average of each variable for each activity and each subject.

set is a newly created variable which has a factor class with 2 levels showing if the volunteer belongs to the training or test set.