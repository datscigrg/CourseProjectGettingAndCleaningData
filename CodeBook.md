CodeBook of Getting and Cleaning Data Course Project 
=================================================
This codebook describes the variables, the data, and any transformations  that were done to perform the clean up of the data.  
* The URL of the site providing the data:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones        
*  Using the run_analysis.R script the following steps for cleaning the data are performed:   
 1. The files X_train.txt, y_train.txt and subject_train.txt from the "./data/train" folder are read. Then these are stored in the variables *trainingXData*, *trainingLabel* and *trainingSubjectData*.      
 2. Furthermore the files X_test.txt, y_test.txt and subject_test.txt from the "./data/test" folder are read.  The variables *testXData*, *testLabel* and *testSubjectData* are used to store them.  
 3. The following concatenation are performed: Firstly, *testXData* with *trainingXData* to create a data frame called *unionData*. Secondly, *testLabel* to *trainingLabel* to create  a data frame called *unionLabel*; Thirdly, *testSubject* to *trainingSubject* to create a data frame called *unionSubject*.  
 4. The features.txt file from the "/data" folder is read and stored into a variable called *features*. Only measurements on the mean and standard deviation are extracted resulting in a list having 66 indices. A subset of *unionData* with the 66 columns is used in the following steps.  
 5. Cleaning of the subset's  column names. A removal of the the "()" and "-" symbols of the names is performed, as well as a replacement of "mean" by Mean and "std" is replaced by Standarddeviation.   
 6. The activity_labels.txt file from the "./data"" folder is read and stored into a variable which is called *activityNames*.  
 7. The activity names in the second column of *activityNames* are cleaned by  applyinging the camel notation to all names used e.g. in Java. Potential underscores are removed the following letter is capitalized.  A transform of the values of *unionLabel* according to the *activityNames* data frame i sperformed.  
 8. Combination of *unionSubject*, *unionLabel* and *unionData* by column to obtain a new and clean data frame, *CompleteAndCleanData*. The first column called "subject" contains numbers having a range out of the interval [1;30]. The second column called "activity" has six different kinds of activity names. In the following 66 columns the measurements out of the interval [-1; 1] are contained.  
 9. In order to save the data the data frame *CompleteAndCleanData* is written into the file "merged_data.txt" into the working directory.  
 10. Finally, an additional tidy data set with the average of each measurement of *CompleteAndCleanData* ordered by each subject and each activity is created. This is done using functions (e.g. melt and cast) from the reshape package which helps a lot in reshaping data. Without this package much more code would be required. The resulting ouput *res* is written to a file named "tidy_data.txt"  into the current working directory. 

* The explanation of the raw data can be taken using the URL: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


References:

[1] R-statistics blog: http://www.r-statistics.com/2012/01/aggregation-and-restructuring-data-from-r-in-action/

[2] Hadley Wickham: Reshaping data with the reshape package: http://had.co.nz/reshape/introduction.pdf