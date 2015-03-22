#Task 1 (Merge training and testing)
test_x=read.table("test/X_test.txt")
test_y=read.table("test/y_test.txt")
test_id=read.table("test/subject_test.txt")
test_dat = cbind(test_id,test_y,test_x)

train_x=read.table("train/X_train.txt")
train_y=read.table("train/y_train.txt")
train_id=read.table("train/subject_train.txt")
train_dat = cbind(train_id,train_y,train_x)

dat = rbind(test_dat,train_dat)

#Task 2 (Extracts only the measurements on the mean and standard deviation for each measurement)
feature_names = read.table("features.txt")
feature_names = feature_names[grep(pattern="mean[()]|std[()]",feature_names[,2]),]
feature_names[,1]=feature_names[,1]+2
dat = dat[,c(1,2,feature_names[,1])]

#Task 3 (Uses descriptive activity names to name the activities in the data set)
activity_labels = read.table("activity_labels.txt")
dat[,2]=activity_labels[match(dat[,2],activity_labels[,1]),2]
colnames(dat)<-c("SubjectID","Activity",as.character(feature_names[,2]))

#Task 4 (Appropriately labels the data set with descriptive variable names)
feature_names[,2]<-gsub(pattern="^t",replacement="Time ",feature_names[,2])
feature_names[,2]<-gsub(pattern="^f",replacement="Frequency ",feature_names[,2])

#Task5 From the data set in step 4, creates a second, independent tidy data set 
##with the average of each variable for each activity and each subject
tmp<-melt(daply(dat,.(SubjectID,Activity),.fun=function(x){c(mean(x[,3]))}))
dat_copy=sapply(4:68,function(y){
  tmp<-melt(daply(dat,.(SubjectID,Activity),.fun=function(x){c(mean(x[,y]))}))
  return (tmp[,3])
})
dat_copy = cbind(tmp,dat_copy)
colnames(dat_copy)<-c("SubjectID","Activity",as.character(feature_names[,2]))
write.table(file="tidy_data.txt",x=dat_copy,sep=",",row.names=F,col.names=T)
