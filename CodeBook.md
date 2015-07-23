
# CodeBook.md

## Source data

A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Fron your current working directory, the test/ and training/ directories along
with the two files features.txt and activity_labels.txt have been copied to the
current working directory.

## run_analysis.R

This is the source script which reads the data files and prodces two output
files, tidy_data_set.txt and tidy_data_set_averages.txt

1. Merge "training" and "test" data sets
   * Reads "X' and "y" data along with a list of "subjects
   * Merge two sets of data for the three objects

2. Extracts "mean" and "stand deviation" measurements
   * Reads the features table from the "features.txt" file
   * Extract the "-mean()" and "-std()" columns, there are 66 out of the 561 variables
   * Reduce the "X" values to this selected list of 66 measurements

3. Descriptive activity names
   * Reads the activities file the "activity_labels.txt" file, the activities are: (walking, walkingupstairs, walkingdownstairs, sitting, standing, laying)
   * Strip out underscores, make lower case and update the "y" values to reflect the clean list of activities

4. Label data set properly
   * Merge the selected data along with the newly cleaned up header values
   * Write out the tidy dada set for the selected measures to "tidy_data_set.txt"

5. Create tidy data and data set of averages for (subject, activity, measurements
   * Create a new tidydataset data.frame which will contain the (30 subjects) * (6 activities) * (66 measurements)
   * The approach will be to loop over "subjects" and activities" and produce mean values over the observed measurements.
   * Write out the mean values for the selected measures to "tidy_data_set_averages.txt"

## tidy_data_set.txt (8150KB)

All test and training data has been merged into one data files, it contains
the subject identifiers as well as the activities and raw data points merged
into a data.frame. 

## tidy_data_set_averages.txt (94KB)

This contains the final output of mean values per (subject,activity),
the values have also been rounded to 4 decimal places.

You can see a sample of the data, in the file results.txt
