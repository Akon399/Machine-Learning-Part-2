# Notes & Lecture by Akhona Njeje.
# Date 8 June 2023.
# Topic & Solution : K Nearest Neighbours.
# Mathematical Statisics Documentation (Intro to Statistical Learning C4 by G James).
# Application : Insurance Industry, do clients take the policy? y = Purchase column?



# Theory.

# KNN is a classification Algorithm that operates on a simple principle.
# Prediction Algorithm:

### Calculate the distance from point x to all the points in your data.
### Sort the majority label of the "k" closest points.
### K = 2,4,6 any natural number.
### K = 1 can give you alot of noise, but K = 50 can give you a bias Algorithm.

### Advantages of the KNN Algorithm :

###### Simple Algorithm.
###### Works with any number of classes.
###### Easy to add more data.
###### Few Paramenters (K & Distance Metric).



# Get the data.

install.packages("ISLR")
library(ISLR)
str(Caravan)

summary(Caravan$Purchase) # Yes = 348, No = 5474.

# Data cleaning.

any(is.na(Caravan)) # FALSE = data is clean.

# Data Transformation , Stdization of data.

### Check Variances 1st, just to see the scale of of Var1 vs Var2 vs ... vs Vark.
### 
var1 = var(Caravan[,1])
print(var1)

var2 = var(Caravan[,2])
print(var2)

### Comparing Var1 & Var2 we see that Var1 = 165 & Var2 = 0.16, the scale difference is too big

purchase = Caravan[,86]
standardized.Caravan = scale(Caravan[,-86])


print(var(standardized.Caravan[,1]))
print(var(standardized.Caravan[,2]))


# Train & Test.

test.index = 1:1000
test.data = standardized.Caravan[test.index]
test.purchase = purchase[test.index]


# Train.

train.data = standardized.Caravan[-test.index]
train.purchase = purchase[-test.index]

# KNN Model.
# Our model will predict if the client will take insurance (yes/no) = Purchase column = y.

library(class)
set.seed(101)

predicted.purchase = knn(train.data, test.data, train.purchase, k=1)
print(head(predicted.purchase))

# Choosing the K value.

### K = 1,3,5 ,ETC.

