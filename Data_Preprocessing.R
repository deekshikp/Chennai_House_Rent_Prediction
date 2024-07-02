#Data Pre-processing
library(tidyverse)

#Loading the dataset
tibble(Chennai_rent)

#Checking the shape of dataset
dim(Chennai_rent)

#Checking the structure of dataset
str(Chennai_rent)

#Here area, BHK, point of contact, Tenants preferred, furniture can be represented as factors
Chennai_rent$BHK=as.factor(Chennai_rent$BHK)
Chennai_rent$Area.Type=as.factor(Chennai_rent$Area.Type)
Chennai_rent$Tenant.Preferred = as.factor(Chennai_rent$Tenant.Preferred)
Chennai_rent$Furnishing.Status=as.factor(Chennai_rent$Furnishing.Status)
Chennai_rent$Point.of.Contact=as.factor(Chennai_rent$Point.of.Contact)
Chennai_rent$Area.Locality=as.character(Chennai_rent$Area.Locality)

#Checking for null values
is.na(Chennai_rent)

#Dropping unnecessary columns [Posted On, Floor, City]
chennai=subset(Chennai_rent, select = -c(Posted.On , Floor , City))
tibble(chennai)

#We now have a dataset pre processed to use for further analysis
write.csv(chennai, "chennai.csv")

#Creating data for word cloud
area=as.character(Chennai_rent$Area.Locality)
print(area)

writeLines(area, "area.txt")
