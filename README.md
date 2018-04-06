Peer graded assignment week 4 - Getting and Cleaning Data

The dataset contains a training dataset and test dataset, and extracted partial variables to create another dataset with the averages of each variable for each activity. The variables in the data X are sensor signals measured with waist-mounted smartphone from 30 people. The variable Y indicates the activity type of the people.

The large dataset is then reduced with my code to only the mean and standard deviation. Each row of the dataset is an average of each activity type for all subjects. Then, the code reads the training and test dataset into R. Read variable names into R envrionment.

Consequently, it merges the training and the test sets to one data set. Rbind is used to combine these sets. It filters only the mean and std dev. Grep is used to command and get column indexes for variable name contains "mean()" or "std()" Then the code uses descriptive activity names to name the activities in the data set. Next, it labels the dataset with descriptive variable names. From the data set it creates a second, independent tidy data set with the average of each variable for each activity and each subject. Use melt and dcast to create the tidy.txt file in the reshape and reshape2 package.
