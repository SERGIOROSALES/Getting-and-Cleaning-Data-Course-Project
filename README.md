# Getting-and-Cleaning-Data-Course-Project
Peer Graded Assignment
This repo contains the script developed to read gross data and convert it into a tidy data set.
The script process can be described by following steps:
* Step 0: Download the dataset
* Step 1: Merges the training and the test sets to create one data set.
* Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
* Step 3: Uses descriptive activity names to name the activities in the data set
* Step 3.2: all lower case
* Step 3.2: remove any parenthesis
* Step 3.3.: since activity names are read as factors, fllow set names lower case and convert them to charecter
* Step 3.4: remove underscores
* Step 3.5: change current activity codes by the corresponding descriptive activity names
* Step 4: Appropriately labels the data set with descriptive activity names.
* Step 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
* Step 5.1: Average each var by each possible couple of Subject and Activity
* Step 5.2: Remove unnecessary colums
* Step 5.3: write tidy data set #2 in .txt
