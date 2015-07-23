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

## > tidy <- read.table("tidy_data_set_averages.txt")
## > tidy[1:26,1:6]
###        V1                V2         V3         V4         V5         V6
### 1  subject          activity tbodyacc-x tbodyacc-y tbodyacc-z tbodyacc-x
### 2        1           walking     0.2773    -0.0174    -0.1111    -0.2837
### 3        1   walkingupstairs     0.2555     -0.024    -0.0973    -0.3547
### 4        1 walkingdownstairs     0.2892    -0.0099    -0.1076       0.03
### 5        1           sitting     0.2612    -0.0013    -0.1045    -0.9772
### 6        1          standing     0.2789    -0.0161    -0.1106    -0.9958
### 7        1            laying     0.2216    -0.0405    -0.1132    -0.9281
### 8        3           walking     0.2764    -0.0186    -0.1055    -0.4236
### 9        3   walkingupstairs     0.2472    -0.0214    -0.1525    -0.3044
### 10       3 walkingdownstairs     0.2776    -0.0227    -0.1168     0.0464
### 11       3           sitting     0.2771    -0.0157    -0.1092    -0.9868
### 12       3          standing     0.2779    -0.0184    -0.1059    -0.9873
### 13       3            laying     0.2814    -0.0182    -0.1072    -0.9741

