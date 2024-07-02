
#load libraries
library(tidyverse)
library(ggplot2)


#Basic Statistics
#Mean
mean=mean(chennai$Rent)

#Median
median=median(chennai$Rent)

#Minimum
minimum=min(chennai$Rent)

#Maximum
maximum=max(chennai$Rent)

#Top 5 high rent
head(sort(chennai$Rent, decreasing = TRUE), n=5)
  
#Top 5 low rent
head(sort(chennai$Rent, decreasing = FALSE), n=5)

#Outlier detection and removal
ggplot(data=chennai, aes(x=Rent,y="" )) + geom_point()

#Here we can see there is an outlier whose value is extreme so we remove 2 outliers
chennai=filter(chennai,Rent<300000)


#level 1 EDA

#Pie chart & Bar plot on Furnishing Status
ggplot(chennai, mapping = aes(x=Furnishing.Status)) + geom_bar( fill = "purple", width=0.5)

ggplot(chennai, aes(x="", y=Rent, fill=Furnishing.Status)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=90)

#Pie chart & Bar plot on Types of Tenants preferred
ggplot(chennai, mapping = aes(x=Tenant.Preferred)) + geom_bar( fill = "purple", width=0.5)

ggplot(chennai, aes(x="", y=Rent, fill=Tenant.Preferred)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0)

#Pie chart & Bar plot on Point of contact
ggplot(chennai, mapping = aes(x=Point.of.Contact)) + geom_bar( fill = "purple", width=0.5)

ggplot(chennai, aes(x="", y=Rent, fill=Point.of.Contact)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=90)

#Pie chart & Bar plot on Area Type
ggplot(chennai, mapping = aes(x=Area.Type)) + geom_bar( fill = "purple", width=0.5)

ggplot(chennai, aes(x="", y=Rent, fill=Area.Type)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=90)





#Level 2 EDA

#Scatter plot on House rents Vs House size
ggplot(chennai, aes(x=Size, y= Rent)) + geom_point(alpha=0.5, color = "purple")

#Boxplot on rent prices
ggplot(chennai, aes(x=Size, y= Rent)) + geom_boxplot(outlier.colour="black", outlier.shape=16,
             outlier.size=2, notch=FALSE)

#Histogram of House size
ggplot(chennai, aes(x=Size)) + geom_histogram(binwidth = 1.75, color="purple")

#Distribution of BHK's
ggplot(chennai, aes(x=BHK)) + geom_bar(fill ="purple")

#Distribution on Number of bathrooms available
ggplot(chennai, aes(x=Bathroom)) + geom_histogram(binwidth = 1, fill="purple")



#Level 3 EDA


#Word cloud on Area Locality

# Install the required packages
install.packages("tm")           # for text mining
install.packages("SnowballC")    # for text stemming
install.packages("wordcloud")    # word-cloud generator
install.packages("RColorBrewer") # color palettes

# Load the packages
library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")

# To choose the text file
text = readLines("area.txt")

# VectorSource() function 
# creates a corpus of 
# character vectors
docs = Corpus(VectorSource(text))   

# Text transformation
toSpace = content_transformer(
  function (x, pattern)
    gsub(pattern, " ", x))
docs1 = tm_map(docs, toSpace, "/")
docs1 = tm_map(docs, toSpace, "@")
docs1 = tm_map(docs, toSpace, "#")
strwrap(docs1)

# Cleaning the Text
docs1 = tm_map(docs1, content_transformer(tolower))
docs1 = tm_map(docs1, removeNumbers)
docs1 = tm_map(docs1, stripWhitespace)

# Build a term-document matrix
dtm = TermDocumentMatrix(docs)
m = as.matrix(dtm)
v = sort(rowSums(m), 
         decreasing = TRUE)
d = data.frame(word = names(v),
               freq = v)
head(d, 10)

# Generate the Word cloud
wordcloud(words = d$word, 
          freq = d$freq,
          min.freq = 1, 
          max.words = 200,
          random.order = FALSE, 
          rot.per = 0.35, 
          colors = brewer.pal(8, "Dark2"))


