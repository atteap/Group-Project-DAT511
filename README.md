# Data Cleaning and Tidy Data Preparation

## Overview
This repository contains the deliverables for the Data Cleaning group project. The goal is to prepare tidy data that can be used for further analysis, utilizing the **Human Activity Recognition Using Smartphones Dataset Version 1.0** (originally created by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto).

## Repository Contents
* `GroupWork.R`: The R script that processes and cleans the raw dataset.
* `CodeBook.md`: Documentation describing the variables, data overview, and the transformations performed by the script.
* `README.md`: This file, explaining how the project works.
* `FinalTidyData.txt`: (Generated upon running the script) The final, cleaned, and aggregated dataset.

## How the Script Works
The `GroupWork.R` script relies on the `dplyr` library. To run the analysis:
1. Ensure the raw dataset files (`features.txt`, `activity_labels.txt`, `subject_test.txt`, `X_test.txt`, `y_test.txt`, `subject_train.txt`, `X_train.txt`, `y_train.txt`) are in your working directory.
2. Execute the `GroupWork.R` script.
3. The script first merges the test and training sets to create a combined dataset.
4. It filters the dataset to keep only the features measuring mean and standard deviation.
5. It replaces numeric activity codes with descriptive names (e.g., WALKING).
6. Variable column names are cleaned and expanded for readability.
7. Finally, it calculates the average of each variable grouped by subject and activity, outputting the result into `FinalTidyData.txt`.
