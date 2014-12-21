#How To

This is short explanation on how to run the script

1. Put run_analysis.R file in your R working directory
2. Run `source(run_analysis.R)`
3. Run `run_analysis()`
4. If you see "RCurl package not installed." or "dplyr package not installed." error message, please install required package first.
5. You can find the result dataset as text file "mean.dataset.txt" in <your_working_directory>/UCI HAR Dataset/
6. To read the dataset, use `read.table("mean.dataset.txt", header = TRUE)`

#Requirement
1. RCurl
2. dplyr

#How it works
1. run_analysis(): main function that will call other functions
2. preparation(): 
    * check package availability
    * check directory and dataset files availability
    * retrieve required datasets
3. merge.data(): merge train and test dataset
4. extract.data(): extract mean and standard deviation variable of each measurement
5. describe.activity(): replace activity ID with its descriptive value
6. describe.variable(): apply descriptive name to each measurement column of extracted data
7. generate.data: 
    * generate tidy dataset of mean of each variable for each activity and each subject
    * store the tidy dataset to "mean.dataset.txt" file in working directory

#Reference
1. David's Project FAQ https://class.coursera.org/getdata-016/forum/thread?thread_id=50
2. Kirsten's codebook examples https://class.coursera.org/getdata-016/forum/thread?thread_id=76
3. Test if a package is installed http://r.789695.n4.nabble.com/test-if-a-package-is-installed-td1750671.html#a1750674
4. Download file from from https site using Curl http://stackoverflow.com/questions/17329288/how-to-download-a-large-binary-file-with-rcurl-after-server-authentication
5. RCurl package docs http://cran.r-project.org/web/packages/RCurl/RCurl.pdf
6. Markdown-Cheatsheet https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet
7. Concatenate string in R http://stackoverflow.com/questions/7201341/how-can-2-strings-be-concatenated-in-r
8. summarise\_each http://www.rdocumentation.org/packages/dplyr/functions/summarise_each
9. Regex look behind in R http://stackoverflow.com/questions/13420391/why-is-this-regex-using-lookbehinds-invalid-in-r
10. Regex build and test http://www.regexr.com/
11. gsub example http://stackoverflow.com/questions/14871249/can-i-use-gsub-on-each-element-of-a-data-frame
