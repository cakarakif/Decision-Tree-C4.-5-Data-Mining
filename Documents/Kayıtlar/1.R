library(caTools)
library(RWeka)

setwd('C:\\Users\\akifc\\Desktop')
options(max.print=999999)

data <- read.csv("bank-full.csv")
spl = sample.split(data$y, SplitRatio = 0.9)

dataTrain = subset(data, spl==TRUE)
dataTest = subset(data, spl==FALSE)

resultJ48 <- J48(as.factor(y)~., dataTrain) 
dataTest.pred <- predict(resultJ48, newdata = dataTest)
table(dataTest$y, dataTest.pred)


summary(resultJ48) # calls evaluate_Weka_classifier()

## visualization
if(require("partykit", quietly = TRUE)) plot(resultJ48)