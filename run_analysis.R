
# 1) Merges the training and the test sets to create one data set

test_y  <- read.table("test/y_test.txt")
train_y <- read.table("train/y_train.txt")

test_x  <- read.table("test/X_test.txt")
train_x <- read.table("train/X_train.txt")

test_subjects  <- read.table("test/subject_test.txt")
train_subjects <- read.table("train/subject_train.txt")

y_values       <- rbind(train_y, test_y)
x_values       <- rbind(train_x, test_x)
subject_values <- rbind(train_subjects, test_subjects)

# 2) Extracts only the measurements on the mean and standard deviation for each measurement

features <- read.table("features.txt")
measures <- grep("-mean\\(\\)|-std\\(\\)", features[,2])
x_values <- x_values[measures]

names(x_values) <- tolower(gsub("-mean\\(\\)|-std\\(\\)", "", features[measures, 2]))

# 3) Uses descriptive activity names to name the activities in the data set

activities      <- read.table("activity_labels.txt")
activities[,2]  <- gsub("_", "", tolower(activities[,2]))
y_values[,1]    <- activities[y_values[,1], 2]
names(y_values) <- "activity"

# 4) Appropriately labels the data set with descriptive variable names

names(subject_values) <- "subject"
merged <- cbind <- cbind(subject_values, y_values, x_values)
write.table(merged, "tidy_data_set.txt")

# 5) From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject

subjects     <- unique(subject_values)[,]
noSubjects   <- length(subjects)
noActivities <- length(activities[,1])

# noColumns = (subject) + (activity) + (number of measures)
noColumns    <- dim(merged)[2]

# Create data.frame with correct field types (subject, activity, tbodyacc-x, ...) -> (int, chr, num, num...)
# we will overwrite data with means values aggregated across (subject, activity, measure)

tidydataset  <- merged[1:(noSubjects * noActivities), ]

# loop across subject and activities calculating the mean value using colMean function
subject_index = 1
for (s in 1:noSubjects) {
    for (a in 1:noActivities) {
        tidydataset[subject_index, 1] <- subjects[s]
        tidydataset[subject_index, 2] <- activities[a, 2]
        # select out (subject, activity, measures[])
        mean_values <- merged[merged$subject == s & merged$activity == activities[a, 2], ]
        tidydataset[subject_index, 3:noColumns] <- round(colMeans(mean_values[, 3:noColumns]),4)
        subject_index <- subject_index + 1
    }
}

# Write out the new tidy data set
write.table(tidydataset, "tidy_data_set_averages.txt", row.names = FALSE)

