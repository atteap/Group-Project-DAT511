# GroupWork.R
# This script performs the data preparation and cleaning for the wearable computing dataset.

library(dplyr)

# ------------------------------------------------------------------------------
# Step 1: Merge Training and Test Data
# ------------------------------------------------------------------------------
# Read features and activity labels (these are in the main folder)
features <- read.table("features.txt", col.names = c("n","functions"))
activities <- read.table("activity_labels.txt", col.names = c("code", "activity"))

# Read test data (telling R to look inside the "test" folder)
subject_test <- read.table("test/subject_test.txt", col.names = "subject")
x_test <- read.table("test/X_test.txt", col.names = features$functions)
y_test <- read.table("test/y_test.txt", col.names = "code")

# Read training data (telling R to look inside the "train" folder)
subject_train <- read.table("train/subject_train.txt", col.names = "subject")
x_train <- read.table("train/X_train.txt", col.names = features$functions)
y_train <- read.table("train/y_train.txt", col.names = "code")

# Combine the datasets
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
merged_data <- cbind(Subject, Y, X)

# ------------------------------------------------------------------------------
# Step 2: Extract Relevant Measurements
# ------------------------------------------------------------------------------
# Extract only the measurements for the mean and standard deviation
tidy_data <- merged_data %>% select(subject, code, contains("mean"), contains("std"))

# ------------------------------------------------------------------------------
# Step 3: Descriptive Activity Names
# ------------------------------------------------------------------------------
# Replace activity codes with descriptive activity names
tidy_data$code <- activities[tidy_data$code, 2]

# ------------------------------------------------------------------------------
# Step 4: Label Data with Descriptive Names
# ------------------------------------------------------------------------------
names(tidy_data)[2] = "activity"
names(tidy_data) <- gsub("Acc", "Accelerometer", names(tidy_data))
names(tidy_data) <- gsub("Gyro", "Gyroscope", names(tidy_data))
names(tidy_data) <- gsub("BodyBody", "Body", names(tidy_data))
names(tidy_data) <- gsub("Mag", "Magnitude", names(tidy_data))
names(tidy_data) <- gsub("^t", "Time", names(tidy_data))
names(tidy_data) <- gsub("^f", "Frequency", names(tidy_data))
names(tidy_data) <- gsub("tBody", "TimeBody", names(tidy_data))
names(tidy_data) <- gsub("-mean()", "Mean", names(tidy_data), ignore.case = TRUE)
names(tidy_data) <- gsub("-std()", "STD", names(tidy_data), ignore.case = TRUE)
names(tidy_data) <- gsub("-freq()", "Frequency", names(tidy_data), ignore.case = TRUE)
names(tidy_data) <- gsub("angle", "Angle", names(tidy_data))
names(tidy_data) <- gsub("gravity", "Gravity", names(tidy_data))
names(tidy_data) <- gsub("\\.", "", names(tidy_data))

# ------------------------------------------------------------------------------
# Step 5: Create Independent Tidy Data Set
# ------------------------------------------------------------------------------
final_tidy_data <- tidy_data %>%
  group_by(subject, activity) %>%
  summarise_all(list(mean = mean))

# Write the final tidy dataset to a text file
write.table(final_tidy_data, "FinalTidyData.txt", row.names = FALSE)