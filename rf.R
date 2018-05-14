# readxl package is used for reading the excel file
library(readxl)
# Shiny is used for creating the application
library(shiny)
#randomForest is used for creating the decision tree
library(randomForest)
# Used for creating graphs
library(ggplot2)

# Read the data from excel file
data <- read_excel("./data.xlsx")

# convert gender column to read as factor instead of character
data$Gender <- as.factor(data$Gender)

# display summary table for the count of every specialization
summary(as.factor(data$Specialization))

# create a histogram plot for GAT scores distribution
hist(data$GAT,col="grey", main = "Histogram Distribution of General Aptitude Test Score", xlab = "GAT Score", breaks = 10)

# create the decision tree based on random forest algorithm using Gender, GAT, ScholasticAchievement and Grade
rf_model <- randomForest(factor(Specialization) ~ Gender + GAT + ScholasticAchievement + Grade,
                         data = data)

# display the importance of every variable for the created random forest model
varImpPlot(rf_model)

# create function that can be used for predicting new data
calculateNew <- function(Gender, GAT, ScholasticAchievement, Grade){
  new.data <- data.frame(Gender, GAT, ScholasticAchievement, Grade)
  levels(new.data$Gender) <- c('Female','Male')
  Prediction <- predict(rf_model, newdata = new.data)
  paste0(Prediction)
}

