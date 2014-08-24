library(reshape2)
library(plyr)
#install.packages("reshape")
#install.packages("plyr")


# step1 read the different files for test and traing data, subjects and labels 
testXdata<-read.table("./testData/X_test.txt")
trainingXdata<-read.table("./trainingData/X_train.txt")
testLabel<-read.table("./testData/y_test.txt")
trainingLabel<-read.table("./trainingData/y_train.txt")
#testYdata<-read.table("./testData/y_test.txt")
trainingSubjectData<-read.table("./trainingData/subject_train.txt")
testSubjectData<-read.table("./testData/subject_test.txt")
# build unions of the  required data
unionData = rbind(trainingXdata, testXdata)
unionLabel = rbind(testLabel, trainingLabel)
unionSubject = rbind(trainingSubjectData, testSubjectData)

# step 2 read features and find features having mean or std as part of the name
features<-read.table("features.txt")
stdAndMeanPos<-grepl("mean\\(\\)|std\\(\\)",features[,2])
nrow(features[stdAndMeanPos,]) # contains 66 rows having the features mentioned above
# put data having required properties of having mean or std in the name into selectedData variable
selectedData <- unionData[, stdMeanPos]

# change names a bit really colNames?
colnames(selectedData)<-sub("-mean()", "_Mean", features[stdAndMeanPos,2], fixed = TRUE)
colnames(selectedData)<-sub("-std()", "_Standarddeviation", colnames(selectedData), fixed = TRUE)

# step 3 read activity names and make them more descriptive
activityNames<-read.table("activity_labels.txt")


# step 4 make activity names more readable small capitals use camel notation
activityNames[, 2]<-activityNames[, 2] <- sub("_u", "U",tolower(activityNames[, 2]), fixed = TRUE)
activityNames[, 2]<-activityNames[, 2] <- sub("_d", "D",activityNames[, 2], fixed = TRUE)


activityLabel <- activityNames[unionLabel[, 1], 2]
unionLabel[, 1] <- activityLabel
names(unionLabel) <- c("activity")
colnames(unionSubject) <- "subject"
CompleteAndCleanData <- cbind(unionSubject, unionLabel, selectedData)

write.table(CompleteAndCleanData, "merged_data.txt")


# step 5 create tidy data set using functions of the reshape package
res <- melt(CompleteAndCleanData,id.vars= c("subject","activity"))
#tidy <- ddply(res, c("activity", "subject"), summarise, mean = mean(value))
cast <- dcast(res, CompleteAndCleanData$subject+activity ~ variable, fun.aggregate=mean)
write.table( cast, file="tidy-data.csv",row.name=FALSE)
