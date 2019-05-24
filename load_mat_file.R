install.packages("R.matlab")
library("R.matlab")


# Create function to read the Mat. files

loadMat = function(fileName)
{
  library(R.matlab)
  rawData = readMat(fileName)
  data = rawData[[1]]
  #matrix = do.call(rbind, data['feat_label',,])
  #totalSec = unlist(data['data.length.sec',,])
  #sequence = unlist(data['sequence',,])
  measures = as.data.frame(data)
  measures
}

# Set the working directory where all the mat files are located

setwd("C:/Users/jiang/Documents/course/statistic machine learning/project/Dog_1_new")

# Create an emty list and the list of all the mat files in the director

dog <- list() 
nummat <- dir(pattern = "*.mat") 

# Load all 1006 Mat files 

for (i in 1:length(nummat)){
  dog[[i]] <- loadMat(nummat[i])
}

# Combine all the dataframes to a single dataframe

df <- data.frame()
for(i in 1:length(nummat)){
  df <- rbind(df,dog[[i]])
}
str(df)
