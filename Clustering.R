rm(list=ls())

#Consider mtacrs data of R-datasets
data(mtcars)
mydata <- data.frame(mtcars)
mydata <- na.omit(mydata) # listwise deletion of missing
summary(mydata)
str(mydata)

mydata <- scale(mydata) # standardize variables 
summary(mydata)

###-------------------------    Hierarchical Clustering     ------------------------###

# Ward's method 
d <- dist(mydata, 
          method = "euclidean") # distance matrix
#d
fit <- hclust(d, method="ward.D2")
plot(fit) # display dendogram
groups <- cutree(fit, k=2) # cut tree into 2 clusters
groups

# draw dendogram with red borders around the 2 clusters
rect.hclust(fit, k=2, border="red") 

mtcars$cluster <- groups

###-------------------------    K- means Clustering     ------------------------###

# K-Means Cluster Analysis with k = 5
fit <- kmeans(mydata, 5) # 5 cluster solution

str(fit)
#study the model and metrics

#With-in sum of squares in each cluster 
fit$withinss 
sum(fit$withinss) 
fit$tot.withinss

#To check cluster number of each row in data
fit$cluster

#Cluster Centers 
fit$centers 

# get cluster means
aggregate(mydata,by=list(fit$cluster),FUN=mean)

# append cluster label to the actual data frame
mydata <- data.frame(mydata,fit$cluster) 

#mtcars_new <- cbind(mtcars,fit$cluster)

head(mydata)

# Determine number of clusters by considering the withinness measure
wss <- 0
for (i in 1:15) {
  wss[i] <- sum(kmeans(mydata,centers=i)$withinss)
}


#Scree Plot
plot(1:15, wss, 
     type="b", 
     xlab="Number of Clusters",
     ylab="Within groups sum of squares",
     main = "Scree plot") 



