---
title: "Getting and Cleaning Data Course Project"
author: "Bhushan"
date: "Thursday, February 19, 2015"
output: html_document
---

The script file run_analysis.R contains all the code for the course project.

The first step is to read all the data from the text files using read.table.

Then the columns in each data frame are named from the features.txt file as well as "Activity" and "Subject" for the columns in the y_ and Subject files. This uses the colnames function.

cbind is used to merge the subject, y, and x files for each of the sets, and then rbind is used to merge the test and train sets.

Mean and standard deviations are calculated using the apply function to the merged data set.

The Activity column is converted to a factor column using the factor function to name the activities.

Finally, for the independent tidy data set of means, the column names except Activity and Subject are extracted into a character vector, and used in the summarize function to calculate the means using colMeans.

As required, write.table is used to write the text file. Also, for convenience a csv file has been created so the assignment can be verified in excel!

