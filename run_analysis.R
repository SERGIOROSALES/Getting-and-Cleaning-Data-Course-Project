# Step 0: Download the dataset
if(!file.exists("./Getting-and-Cleaning-Data-Course-Project")){dir.create("./Getting-and-Cleaning-Data-Course-Project")}
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destFile <- "./Getting-and-Cleaning-Data-Course-Project/UCI HAR Dataset.zip"
download.file(url, destFile)
unzip(destFile)

# Step 1: Merges the training and the test sets to create one data set. 
subjTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt") 
subjTest <- read.table("./UCI HAR Dataset/test/subject_test.txt") 
subj <- rbind(subjTrain, subjTest) 

xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt") 
xTest <- read.table("./UCI HAR Dataset/test/X_test.txt") 
x <- rbind(xTrain, xTest) 

yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt") 
yTest <- read.table("./UCI HAR Dataset/test/y_test.txt") 
y <- rbind(yTrain, yTest) 

# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.  
features <- read.table("./UCI HAR Dataset/features.txt") 
meanSd <- grep("-mean\\()|-std\\()", features$V2) 
xMeanSd <- x[, meanSd] 

# Step 3: Uses descriptive activity names to name the activities in the data set 
names(xMeanSd) <- features[meanSd, 2]
# all lower case
names(xMeanSd) <- tolower(names(xMeanSd))
# remove any parenthesis 
names(xMeanSd) <- gsub("\\()", "", names(xMeanSd))

activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
# activity names are read as factors, fllow set names lower case and convert them to charecter 
activities[, 2] <- tolower(as.character(activities[, 2])) 
# to remove underscores
activities[, 2] <- gsub("_", "", activities[, 2]) 
# change activity codes by the corresponding descriptive activity names
y[, 1] = activities[y[, 1], 2] 
names(y) <- "activity" 
names(subj) <- "subject" 

# Step 4: Appropriately labels the data set with descriptive activity names. 
data <- cbind(subj, xMeanSd, y) 
write.table(data, './Getting-and-Cleaning-Data-Course-Project/tidy-data-set.txt', row.names = FALSE)

# Step 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject.  
averageDs <- aggregate(x=data, by=list(activities=data$activity, subj=data$subject), FUN=mean) 
averageDs <- averageDs[, !(colnames(averageDs) %in% c("subj", "activity"))] 
write.table(averageDs, './Getting-and-Cleaning-Data-Course-Project/average-tds.txt', row.names = FALSE) 
