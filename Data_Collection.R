library(tidyverse)

#Filtering the dataset with values containing only from Chennai

Rent.data<- data.frame(read.csv("House_Rent_Dataset.csv"))
View(Rent.data)
Chennai_rent <- Rent.data %>% dplyr::filter(City=="Chennai")
tibble(Chennai_rent)

write.csv(Chennai_rent,"Chennai_rental_data.csv")

