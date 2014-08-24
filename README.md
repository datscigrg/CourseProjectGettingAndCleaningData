getting-and-cleaning-data-course-project
========================================

This repository contains the course project for the Coursera course [Getting and Cleaning Data](https://www.coursera.org/course/getdata) of the Coursera data science specialisation.

## Installation

* Download the script `run_analysis.R` 
* Download the raw data using URL https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip to your home directory and unzip it. The zip file can be deleted after this step.
  Your directory structure should include the files README.txt, activity_labels.text, features.txt and features_info.txt. Moreover two subdirectories should be provided containing training and test data. I have adapted the path names sligthly to make my work easier. 
 
 
 


## Dependencies
There are dependencies of the script `run_analysis.R` on the library `reshape`. Please install this package if you want to run the analysis on your own.
    
## Running the analysis     
  
* Execute the following command`source("run_analysis.R")`
* There will be 2 datasets written into your working directory: `merged-data.csv` and `tidy-data.csv` which are both objects of the type data frame.

## Codebook
`CodeBook.md` contains information about the datasets and the transformation procress executed in the run_analysis.R .     

## Code 
Detailed commments which explain the steps in which the original data is transformed to the files `tidy1.csv` and `tidy2.csv` are contained in the source code. 

