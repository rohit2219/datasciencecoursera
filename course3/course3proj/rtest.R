
init<-function()
{
    #Initialize function called by all my programs to initialize the folder and other
    #system variables which would be easier for my work
    
    # 1) My working' directory which is my git directory too
    assign("rohwork",paste("C:/Users/Rph/Desktop/HigherStudies/homework/",
                           "course3/course3proj/data/",sep = ""),envir = .GlobalEnv)
}

run_analysis<-function()
{
    init()
    # Obj1 - Merges the training and the test sets to create one data set.
    print("started")
    setwd(dir = rohwork)
    act_type=read.table( "activity_labels.txt",header =  FALSE,col.names = c("act_id","act_type"))
    feat=read.table( "features.txt",header =  FALSE)
    
    print(getwd())
    
    train_x    = read.table('./train/x_train.txt',header =  FALSE,col.names = feat[,2])
    
    train_subj = read.table("./train/subject_train.txt", header =  FALSE,col.names = "subj_id")
    train_y    = read.table(  "./train/y_train.txt",header =  FALSE,col.names = "act_id")
    
    train_join = cbind(train_subj,train_y,train_x)
    
    test_x=read.table(  "./test/x_test.txt",header =  FALSE,col.names = feat[,2])
    test_subj=read.table(  "./test/subject_test.txt", header =  FALSE,col.names = "subj_id")
    test_y=read.table(  "./test/y_test.txt",header =  FALSE,col.names = "act_id")

    test_join=cbind(test_subj,test_y,test_x)

    test_train_df=rbind(test_join,train_join)
    print("debugging: task1 done")
    #2 Extracts only the measurements on the mean and standard deviation for each measurement.
    col_name=colnames(test_train_df) 
    mean_sd_colname=grepl("act_type",col_name)|grepl("subj_id",col_name)|grepl("*mean*",col_name)|grepl("*std*",col_name)
    
    mean_sd_df=test_train_df[mean_sd_colname==TRUE]
    print("debugging: task2 done")
    
    #3 Use descriptive activity names to name the activities in the data set
    
    mean_sd_df=merge(mean_sd_df,act_type,all.x=TRUE )
    print("debugging: task3 done")
    #(temporarily writing to a file so that I can verify intermediate result)
    write.csv(mean_sd_df,file="aftertask3.csv")
    #4 clean up columnnames
    mean_sd_colname=colnames(mean_sd_df)
    mean_sd_colname=mapply(gsub,"std","standdev",mean_sd_colname)
    mean_sd_colname=mapply(gsub,"^t","time",mean_sd_colname)
    mean_sd_colname=mapply(gsub,"AccMag","AccMagnitude",mean_sd_colname)
    mean_sd_colname=mapply(gsub,"JerkMag","JerkMagnitude",mean_sd_colname)
    colnames(mean_sd_df)=mean_sd_colname
    print("debugging: task4 done")
    #5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
    
    tidy_avg_mean_sd_df=ddply(mean_sd_df,c("subj_id","act_id"),numcolwise(mean))
    #(temporarily writing to a file so that I can verify intermediate result)
    write.csv(tidy_avg_mean_sd_df,file="aftertask5final.csv")
    print("debugging: completed the project")
}