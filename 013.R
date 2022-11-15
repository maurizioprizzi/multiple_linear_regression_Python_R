# Multiple Linear Regression

# Import the dataset
dataset = read.csv("50_Startups.csv")

# Encoding categorical data
dataset$State = factor(dataset$State, 
                       levels = c("New York", "California", "Florida"), 
                       labels = c(1, 2, 3))

# Splitting the dataset
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting Multiple Linear Regression
regressor = lm(formula = Profit ~ ., 
               data = training_set)