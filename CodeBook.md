# CodeBook: Wearable Computing Dataset

## Data Overview
This project uses data from the "Human Activity Recognition Using Smartphones Dataset Version 1.0". The experiments were carried out with a group of 30 volunteers. Each person performed six activities wearing a Samsung Galaxy S II smartphone on the waist. 

The purpose of this project is to collect, clean, and manipulate the raw data to prepare a tidy data output that can be used for further analysis.

## Data Processing
The `GroupWork.R` script performs the following steps:
1. **Merges** the training and the test sets to create one dataset.
2. **Extracts** only the measurements on the mean and standard deviation for each measurement.
3. **Uses descriptive activity names** to name the activities in the data set.
4. **Appropriately labels the data set** with descriptive variable names (e.g., expanding abbreviations like `Acc` to `Accelerometer`, `t` to `Time`, removing special characters).
5. **Creates a second, independent tidy data set** (`FinalTidyData.txt`) with the average of each variable for each activity and each subject.

## Missing Data Handling
There were no missing values (NAs) in the initial dataset. The data was complete and required no imputation.

## Variable Descriptions

### Identifiers
* `subject`: Integer identifier for the volunteer subject who performed the activity (Ranges from 1 to 30). Data Type: `Integer`.
* `activity`: Descriptive physical activity performed (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). Data Type: `Character/Factor`.

### Measurements
The remaining 86 variables are numeric vectors. They represent the averaged mean and standard deviation features for the 3-axial linear acceleration and angular velocity signals. 

**Units:**
* Measurements containing `Accelerometer` (linear acceleration) are in standard gravity units **'g'**.
* Measurements containing `Gyroscope` (angular velocity) are in **radians/second**.
* *Note: In the original raw dataset, these features were normalized and bounded within [-1, 1].*

**Naming Conventions:**
* Prefix `Time` denotes time-domain signals (captured at a constant rate of 50 Hz).
* Prefix `Frequency` denotes frequency-domain signals (resulting from a Fast Fourier Transform).
* `Mean` indicates the mean value of the signal.
* `STD` indicates the standard deviation of the signal.
* Directions `X`, `Y`, and `Z` denote the 3-axial signals.
* The suffix `_mean` appended to the end of the variable names indicates that this is the averaged value grouped by subject and activity.

## Code Instructions
1. Download and extract the raw dataset.
2. Place `GroupWork.R` in the main folder alongside `features.txt` and the `train/` and `test/` subdirectories.
3. Run `source("GroupWork.R")` in your R environment.
4. The script generates `FinalTidyData.txt` in the working directory.