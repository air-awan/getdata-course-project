run_analysis <- function() {
    
    data <- preparation()
    total.data <- merge.data(data$train, data$test)
    total.mean.std <- extract.data(data$name, total.data)
    descriptive.activity <- describe.activity(total.mean.std, data$activity.labels)
    descriptive.dataset <- describe.variable(descriptive.activity, data$name)
    generate.data(descriptive.dataset)
}
# 0. Preparation
preparation <- function() {
    # Check dependency
    if (!is.element("RCurl", installed.packages()[,1])) {
        stop("RCurl package not installed")
    }
    if (!is.element("dplyr", installed.packages()[,1])) {
        stop("dplyr package not installed")
    }
    # Set dataset and working directory
    folder.name <- "./UCI\ HAR\ Dataset"
    file.name <- "getdata-projectfiles-UCI\ HAR\ Dataset.zip"
    library(RCurl)
    if (!file.exists(folder.name)) {
        if(!file.exists(file.name)) {
            get.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
            if(url.exists(url = get.url, ssl.verifypeer = F)) {
                file.data = CFILE(file.name, "wb")
                curlPerform(url = get.url, writedata=file.data@ref, ssl.verifypeer = F)
                close(file.data)
            } 
            else {
                stop("Source dataset cannot be downloaded.")
            }
        }
        unzip(file.name)
    }
    setwd(folder.name)
    
    if (grepl("/UCI\ HAR\ Dataset", getwd())) {
        # Retrieve variable and activity
        name <- read.table('features.txt', stringsAsFactors = FALSE)
        activity.labels <- read.table('activity_labels.txt', col.names = c("activity", "activity.name"))
        
        # Retrieve train data
        train.data <- read.table('train/x_train.txt')
        train.subject <- read.table('train/subject_train.txt', col.names = "subject")
        train.activity <- read.table('train/y_train.txt', col.names = "activity")
        train <- cbind(train.subject, train.activity, train.data)
        rm(train.data, train.subject, train.activity)
        
        # Retrieve test data
        test <- read.table('test/x_test.txt')
        test.data <- read.table('test/x_test.txt')
        test.subject <- read.table('test/subject_test.txt', col.names = "subject")
        test.activity <- read.table('test/y_test.txt', col.names = "activity")
        test <- cbind(test.subject, test.activity, test.data)
        rm(test.data, test.subject, test.activity)
        return(list("name" = name, "activity.labels" = activity.labels, "train" = train, "test" = test))
    }
    else {
        stop("Working data directory not found.")
    }
}

# 1. Merge train and test data
merge.data <- function (train, test) {
    rbind(train, test)
}

# 2. Extracts mean and std of each measurement
extract.data <- function(name, total) {
    col.name <- c("subject", "activity", name[[2]])
    total[,grepl("(mean\\W)|std|subject|activity",col.name)]
}

# 3. Uses descriptive activity names
describe.activity <- function(total.mean.std, activity.labels) {
    library(dplyr)
    descriptive.dataset <- merge(activity.labels, total.mean.std, sort = F)
    select(descriptive.dataset, -1)
}

# 4. Uses descriptive variable names
describe.variable <- function(descriptive.dataset, var.name) {
    col.name <- c("activity.name", "subject", var.name[grepl("(mean\\W)|std",var.name[,2]),2])
    col.name <- lapply(col.name, FUN = function(x) gsub("BodyBody", "Body", x))
    col.name <- lapply(col.name, FUN = function(x) gsub("-", ".", x))
    col.name <- lapply(col.name, FUN = function(x) gsub("\\(\\)", "", x))
    col.name <- lapply(col.name, FUN = function(x) gsub("f(?=[A-Z])", "freq", x, perl = T))
    col.name <- lapply(col.name, FUN = function(x) gsub("t(?=[A-Z])", "time", x, perl = T))
    colnames(descriptive.dataset) <- col.name
    descriptive.dataset
}

# 5. Generate average data set
generate.data <- function(descriptive.dataset) {
    mean.dataset <- descriptive.dataset %>%
        group_by(activity.name, subject) %>%
        summarise_each(funs(mean))
    col.name <- names(mean.dataset)
    mean.col.name <- c(col.name[1:2],paste("mean.of", col.name[3:68], sep="_"))
    colnames(mean.dataset) <- mean.col.name
    write.table(mean.dataset, file = "mean.dataset.txt", row.names = FALSE)
}