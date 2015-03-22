# Analysis Description 

## Task 1
Read the X,y and subject_label files for training and testing datasets, and combine them. 

## Task 2
<ol>
<li>Read the feature names from the file features.txt</li>
<li>Find the measurments on the mean and standard deviation by doing a string search on "mean()" and "std()"</li>
<li>Add 2 to the feature indexes since the first 2 features in the combined data are the subject id and activity</li>
<li>Filter the data using the features found in step 2</li>
</ol>

## Task 3
Replace the ID of the acitivties using the labels in file activity_labels.txt

## Task 4
Replace t with Time and f with Frequency to make feature names more descriptive

##Task 5
<ol>
<li>Use daply to find the average of the first measurment (this is done in order to get the combinations of SubjectID and Acitivity)</li>
<li>For the reminader measurments, find the average per subject per activity, and use melt to make it tidy</li>
<li>Combine the data into one tidy dataset and update its feature names</li>
<li>Write the tidy dataset to "tidy_data.txt"</li>
</ol>
