---
title: "README.md"
author: "Getting and Cleaning Data"
date: "July 25, 2015"
output: html_document
---

***


This document discusses the processing of raw data files into a tidy data set as described in the requirements for the *Getting and Cleaning Data* class project.  A description of the source data and where to download it can be found in the CodeBook.md markdown file.  
<br>
All of the scripts for processing the data can be found in the __run_analysis.R file__.  There is one main function called run_analysis() that calls the functions listed and described below.  All processing of the raw files into tidy data is handled by the scrips.  There is __no__ manual processing.  

* run_analysis  
Define constants for all file and path names  
Download and unzip all data  
Merge the X, Y and  subject files for Test data into a data frame  
Merge the X, Y and  subject files for Training data into a data frame  
Identify the standard deviation and mean variables  
Identify the factor columns, subject and activity  
Merge the Test and Training data frames into a single data frame with only the variables we want  
Buld a tidy data set from the merged data set using the __melt__ and __dcast__ functions from the __reshape2__ library  
Scrub the variable names to something more readable  
Write the tidy data set to a file named __tidyData.txt__ in the working directory

* downloadZipFile  
Creates the __data__ folder if it does not already exist  
Downloads the zip file to the data folder if it does not already exist  
  
* unzipDataFile  
Unzips the zip file of data if the zip file's data folder, __UCI HAR Dataset__, does not already exist  
  
* buildActivityDataSet  
Merges the measurement, activities and subject data into a single data frame.  
This function is called once to merge the Test data and again to mrege the Training data  
  
* getStdAndMeanColumns  
Identifies the standard deviation and mean variables that we want in the tidy data set  
  
* getFactorColumns  
Identifies the factor columns, subject and activity, that we want in the tidy data  
  
* scrubColumnNames  
Scrubs the column names of the tidy data set by removing dashes and parens  
   