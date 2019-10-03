

# Load these 4 packages
library(glmnet)
library(randomForest)
library(data.table)
library(RCurl)

#Read in sample data
url<-RCurl::getURLContent("https://raw.githubusercontent.com/MA-QUT/RF-LR/master/sample_data.csv")
samp<-data.table::fread(url) 

#Load the Logistic Regression model
load(url("https://github.com/MA-QUT/RF-LR/raw/master/LogisticRegression.RData"))

#Load the Random Forest model
load(url("https://github.com/MA-QUT/RF-LR/raw/master/RandomForest.RData"))

#Make predictions with the models on the sample data
LR_activity<-predict(LRhip, newx=as.matrix(samp[,2:23]),type="class",s=LRhip$lambdaOpt)
RF_activity<-predict(RFhip,samp,type="class")

#'Predictions will be numbered 1-5 and correspond to:
#'1: Sedentary
#'2: Light household activities and games
#'3: Moderate-to-vigorous games and sports
#'4: Walk
#'5: Run





 


