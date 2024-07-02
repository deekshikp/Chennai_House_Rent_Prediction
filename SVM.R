#Splitting into train and test dataset
#Building the model
#Evaluating the metrics

#Dataset
df<-chennai
tibble(df)

library(ggplot2)
library(dplyr)
library(e1071)

#Qplot
qplot(Size, Rent, data=chennai, color=BHK)

df<- subset(chennai, select = c(BHK, Rent, Size))
tibble(df)
mymodel <-svm(BHK~.,data=df, kernel="radial")

summary(mymodel)

#summary
summary(model)

#plot
plot(mymodel,data=df, Rent~Size)

pred=predict(mymodel,df)
pred

#confusion matrix
tab = table(Predicted = pred,
            Actual = df$BHK)
View(tab)
tab


