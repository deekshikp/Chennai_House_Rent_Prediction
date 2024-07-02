#Splitting into train and test dataset
#Building the model
#Evaluating the metrics

View(chennai)


#Slice the dataset
size=chennai[,3]
rent=chennai[,2]

#Converting into dataframe
data=data.frame(size,rent)
View(data)

#Install packages
install.packages("caTools") #Data Splitting
library(caTools)

#Generating random numbers
set.seed(42)

#data splitting
split = sample.split(data$rent,SplitRatio = 0.8)
View(split)
print(split)

#Training data
training_set = subset(data,split==TRUE)
View(training_set)

#testing data
testing_set = subset(data,split==FALSE)
View(testing_set)

#apply regression
regressor = lm(formula = rent~size, data = training_set)
View(regressor)

#Prediction
y_pred=predict(regressor,newdata = testing_set)
View(y_pred)

data1=data.frame(testing_set$rent, y_pred)
View(data1)

library(ggplot2)
plot(testing_set$size,testing_set$rent, type='p', col='blue', xlab='GRE',ylab='COA')

lines(testing_set$size,y_pred,type = 'o', col='red')

#visualization
ggplot(testing_set, aes(x = size))+
  geom_point(aes(y = rent, color = 'Actual')) + 
  geom_line(aes(y = y_pred, color = 'Predicted'))

# Evaluating metrics
#Assessing Fit Of A Linear Regression Model: RSE
sigma(regressor)
summary(regressor)

#R squared value close to 1 data fits well