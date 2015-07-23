# GettingAndCleaningData_Project
Getting and Cleaning Data Course Project

## Source data

A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## CodeBook.md

See the CodeBook.md for details on the layout of the data, which files from
the data tree are used and where they reside as well as specifics on code
contained in run_analysis.R 

## run_analysis.R

This is the source script which reads the data files and prodces two output
files, tidy_data_set.txt and tidy_data_set_averages.txt

## tidy_data_set.txt (8150KB)

All test and training data has been merged into one data files, it contains
the subject identifiers as well as the activities and raw data points merged
into a data.frame. 

## tidy_data_set_averages.txt (94KB)

This contains the final output of mean values per (subject,activity),
the values have also been rounded to 4 decimal places.

You can see a sample of the data, in the file results.txt

