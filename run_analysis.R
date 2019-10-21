setwd("C:/Users/andra/Documents/R/Coursera_Data_Science_Specialization/GettingAndCleaningData/week4/Har_Dataset")


#merging the test files together

subject_test<-read.table("./test/subject_test.txt")
X_test<-read.table("./test/X_test.txt")
y_test<-read.table("./test/y_test.txt")

testBind<-cbind(subject_test, y_test, X_test)

#merging the train files together 

subject_train<-read.table("./train/subject_train.txt")
X_train<-read.table("./train/X_train.txt")
y_train<-read.table("./train/y_train.txt")

trainBind<-cbind(subject_train, y_train, X_train)

# merge the test and training data together 

allBind<-rbind(testBind, trainBind)

#name the columns

thenames<-read.table("./features.txt")
colnames(allBind)[3:563]=as.character(thenames[,2])
colnames(allBind)[1:2]=as.character(c("subject_number", "activity_labels"))
 
#subset data on the columns that have the mean or std

subsetData<-allBind[,grep("mean()|std()|subject_number|activity_labels", names(allBind))]

#create a new column that labels the data set with descriptive activity names

subsetData$activity_name<- ifelse(subsetData$activity_labels== 1, 'walking',
                                  ifelse(subsetData$activity_labels==2, 'walking_upstairs',
                                         ifelse(subsetData$activity_labels==3, 'walking_downstairs',
                                                ifelse(subsetData$activity_labels==4, 'sitting',
                                                       ifelse(subsetData$activity_labels==5, 'standing',
                                                              ifelse(subsetData$activity_labels==6, 'laying', 'something_else'))))))


#label the dataset with descriptive variable names

names(subsetData)<-gsub("^t", "time", names(subsetData))
names(subsetData)<-gsub("Acc", "accelerometer", names(subsetData))
names(subsetData)<-gsub("mean()", "mean", names(subsetData))
names(subsetData)<-gsub("std()", "std", names(subsetData))
names(subsetData)<-gsub("^f", "frequency", names(subsetData))
names(subsetData)<-gsub("Gyro", "Gyroscope", names(subsetData))
names(subsetData)<-gsub("Mag", "magnitude", names(subsetData))
names(subsetData)<-gsub("BodyBody", "body", names(subsetData))

#create a second data set 

write.table(subsetData, "TidyData.txt", row.names=FALSE)
