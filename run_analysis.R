require(plyr)
require(reshape2)
X_train <- read.table("X_train.txt",nrows=7351)
y_train <- read.table("y_train.txt",nrows=7351)
subject_train <- read.table("subject_train.txt",nrows=7351)
train <-cbind(X_train,y_train,subject_train)
X_test <- read.table("X_test.txt",nrows=2946)
y_test <- read.table("y_test.txt",nrows=2946)
subject_test <- read.table("subject_test.txt",nrows=2946)
test <-cbind(X_test,y_test,subject_test)
##Merges the training and test sets to create one data set##
AllData <- rbind(train,test)
##Import column names into the data set##
features <- read.table("features.txt",nrows=561)
features <- t(as.data.frame(features[,2]))
features <- cbind(features,"activity_code")
activity_labels <- read.table("activity_labels.txt",nrows=6)
##Uses descriptive activity names to name the activities in the data set##
colnames(activity_labels) <- c("activity_code","activity")
##Appropriately labels the data set with descriptive activity names##
names(AllData)[562] <- "activity_code"
AllData <- merge(AllData,activity_labels,by = "activity_code")
##Labels the features with descriptive names##
features <- gsub("tBody",replacement = "time series body ",features)
features <- gsub("tGravity",replacement = "time series gravity ",features)
features <- gsub("fBody",replacement = "frequency domain body ",features)
features <- gsub("Acc",replacement = "acceleration ",features)
features <- gsub("Gyro",replacement = "gyroscope ",features)
features <- gsub("Mag",replacement = "magnitude ",features)
features <- gsub("Jerk",replacement = "jerk ",features)
features <- tolower(features)
features <- cbind("activity_code",features)
features[563] <- "subject"
features[564] <- "activity"
colnames(AllData) <- features
##Extracts the mean and standard deviation from each measurement##
AllData.mean.std <- AllData[,c(2:6,41:46,81:86,121:126,161:166,201,202,214,215,227,228,240,241,253,254,266:271,345:350,424:429,503,504,516,517,529,530,542,543,563,564)]
write.table(AllData.mean.std, "TidyDataSetAll.txt", sep=",")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
##Calculates mean for each subject/activity combination##
AllData.mean.std.melt <- melt(AllData.mean.std,id=c("activity", "subject"))
AllData.mean.std.cast <- dcast(AllData.mean.std.melt,activity + subject ~ variable,mean)
write.table(AllData.mean.std.cast, "TidyDataSetMeans.txt", sep=",")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
##Exports column names##
write.table(names(AllData.mean.std),"ListOfNames.md",sep=",",quote=FALSE,col.names=FALSE,row.names=FALSE)
