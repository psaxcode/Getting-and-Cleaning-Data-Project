#Download the data file
# if(!file.exists("Project")) dir.create("./Project")
# url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# download.file(url,destfile="./Project/Date.zip")
# unzip("./Project//Date.zip")

#Read in the feature names. Clean special characters in the original names
features<-read.table("UCI HAR Dataset/features.txt",
                     sep=" ",stringsAsFactors=F)
features<-features[,2]
features<-gsub(",|-","_",features)
features<-gsub("\\(\\)","",features)
features<-gsub("\\(|\\)",".",features)

#Read in the test data and the train data. Combine the two measurement datasets 
test<-read.table("UCI HAR Dataset/test/X_test.txt",sep="")
train<-read.table("UCI HAR Dataset/train/X_train.txt")
sensorData<-rbind(test,train)
#Combine the subject data
subtest<-read.table("UCI HAR Dataset/test/subject_test.txt")
subtrain<-read.table("UCI HAR Dataset/train/subject_train.txt")
subj<- rbind(subtest,subtrain)
#Combine the activity data. Repalce the id of each activity with a proper name 
activitytest<-read.table("UCI HAR Dataset/test/y_test.txt")
activitytrain<-read.table("UCI HAR Dataset/train/y_train.txt")
act<-rbind(activitytest,activitytrain)
activities<-read.table("UCI HAR Dataset/activity_labels.txt")
act<-activities$V2[act$V1]

#The whole dataset
sensorData$Subject<-subj$V1
sensorData$Activity<-act

#Extract only the measurements on the mean and standard deviation 
mean_std_features<-features[grep("mean|std", features,ignore.case=T)]
mean_std_data<-sensorData[,c(mean_std_features,"Subject","Activity")]

#Generate a tidy data set with the average of each variable for each activity
#and each subject
library(reshape2)
melted<-melt(mean_std_data,id=c("Activity","Subject"),
             measure.vars=mean_std_features)
newdata<-dcast(melted,Activity+Subject~variable,mean)






