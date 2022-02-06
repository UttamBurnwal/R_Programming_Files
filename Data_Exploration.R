#set working directory
setwd("D:/Data Science Course/R-Programming/Materials/R Programming Materials/Data Set/customer_churn.csv")

#install package
#install.packages("name of the package")

library(readxl)
#df <- read_excel("name and extension of your file")

#read csv files
customer_churn <- read.csv("/Users/abhishekdas/Desktop/Intellipat/Data_Science_Course_Documents/customer_churn.csv")

#Read TXT files with read.table()
#If you have a .txt or a tab-delimited text file, you can import it with the R function read.table()

#df <- read.table("file_name.txt")

#-----------------Vectors------------------------------

num1 <- c(1,2,3,4,5)
num2 <- c(10:20)
char1 <- c("a","b","c")
char2 <- c("this","is","sparta")
my_log1 <- c(TRUE,FALSE,TRUE,FALSE)
my_log2 <- c(T,F,T,F)

#to know what variables and functions are defined in your workspace
ls()
ls.str()

#deleting variables
rm(num1)
rm(list = ls())

#length of a vector
length(num1)
length(char1)

#data type 
class(char1)
class(num1)

#access elements of vectors
char2[1]
my_log2[c(1,3)]

# Ignore first element
num1[-1]

#select 1st to 3rd elements
num1[1:3]
# Invert sign of index to exclude instead of select
num1[-(1:3)]

#---------Missing values----------------------------------

a <- c(NA,6,7,8,NA,NA)
is.na(a) #whether any missing values are there in "a" or not

#total number of missing values
sum(is.na(a))
#position of missing values
which(is.na(a))

mean(a)
mean(a,na.rm = T)

a <- ifelse(is.na(a),0,a)

#churn$new <- ifelse(churn$SeniorCitizen == 1, "yes","No")

#-----------LIST----------------------------------

my_list1<-list(1,"a",TRUE)
my_list2<-list(c(1,2),c("a","b"),c(TRUE,FALSE))

my_list1[[2]]
my_list2[[3]][2]

Fruit_list <- list(Apple = 85, Banana = 45, Guava = 100)
Fruit_list$Apple
#-----------------------------------------------

#Matrix

mat1<-matrix(c(1,2,3,4),nrow=2,byrow = T)
mat2<-matrix(c("a","b","c","d"),nrow=2,byrow = T)
mat3<-matrix(c(T,F,T,F),nrow=2,byrow = T)

mat1[1,]
mat1[,1]
mat1[2,1]

#transpose mat1
t(mat1)

mean(mat1[,2])
mean(mat1[2,])
#--------------------

# ARRAY

a1 <- array(1:24,dim = c(2,4,3))
a1[1,2,3]
a1[2,,1]
#-------------------------------------------------

#FACTOR  
my_data<-c("Male","Female","Female","Male")
my_data <- as.factor(my_data)

#-------------------------------------------------
# DATAFRAME

df <- data.frame(Name=c("Sam","Bob"),Age=c(32,48),stringsAsFactors=F)
#strings as factors
customer_churn <- read.csv("/Users/abhishekdas/Desktop/Intellipat/Data_Science_Course_Documents/customer_churn.csv",stringsAsFactors = T)
#without strings as factors
customer_churn <- read.csv("/Users/abhishekdas/Desktop/Intellipat/Data_Science_Course_Documents/customer_churn.csv")

customer_churn <- read.csv("customer_churn.csv")

#selecting a column
customer_churn$gender

#column names
names(customer_churn)

#df <- data.frame(customer_churn[1:20,c(1,2,3,4)])

a <- customer_churn[,c(1,3,6)]
b <- customer_churn[,2:5]

d <- customer_churn[3,]
e <- customer_churn[c(3,5,7),]
f <- customer_churn[5:10,]

df1 <- customer_churn[4:8,2:5]
df2 <- customer_churn[50:60,c(2,3)]
df3 <- customer_churn[c(100:200,1000:2000),5:8]
df4 <- customer_churn[,c("gender","Partner")]

#----------------------------------------
#Decision Making

    if(10>20){
    print("10 is less than 20")
  }
#------------
  if(10<20){
    print("10 is less than 20")
  }
#-----------
  if(10>20){
    print("10 is less than 20")
  }else{
    print("10 is greater than 20")
  }
#----------------------------------------------------

sum(is.na(customer_churn))

colSums(is.na(customer_churn))

# ways of imputing missing value
customer_churn$TotalCharges <- ifelse(is.na(customer_churn$TotalCharges),0,customer_churn$TotalCharges)
customer_churn$TotalCharges <- ifelse(is.na(customer_churn$TotalCharges),mean(customer_churn$TotalCharges,na.rm = T),customer_churn$TotalCharges)

customer_churn$TotalCharges[is.na(customer_churn$TotalCharges)] <- mean(customer_churn$TotalCharges, na.rm = TRUE)

df <- na.omit(customer_churn)

#-----------------------------------------------

#Looping

  a<-1:9

for (i in a) {
  print(i*2)
}

#-------------------------------------------------------
  i=1

while (i<=10) {
  print(i+2)
  i<-i+1
}

# for(value in that) {
#   do this
# }

#----------------------------------------------------------
 
str(customer_churn)

head(customer_churn)
head(customer_churn,10)
head(customer_churn,2)

tail(customer_churn)
tail(customer_churn,3)
tail(customer_churn,10)

nrow(customer_churn)
ncol(customer_churn)

dim(customer_churn)

max(c(1,2,3,4,5))
max(customer_churn$MonthlyCharges)

min(c(1,2,3,4,5))
min(customer_churn$MonthlyCharges)

mean(c(1,2,3,4,5))
mean(customer_churn$MonthlyCharges)

#--------------------------------------------------------------

data.frame(Name=c("Sam","Bob"),Marks=c(97,25)) -> student  
as.character(student$Name) -> student$Name
student <- rbind(student,c("Anne",75))

#-------------------------------------------------------------

data.frame(Name=c("Sam","Bob"),Marks=c(97,25)) -> student  
as.character(student$Name) -> student$Name
student <- cbind(student,Grade=c("A","C"))

#-------------------------------------------------------------

#Merging Dataframes

data.frame(Department=c("Tech","Analytics","Support"),Location=c("Chicago","New York","Boston")) -> Employee  

data.frame(Name=c("Sam","Bob","Anne"),Salary=c(75000,105000,120000),Department=c("Tech","Sales","Analytics")) -> Department2

merge(Employee,Department2,by="Department")
merge(Employee,Department2,by="Department",all = T)
merge(Employee,Department2,by="Department",all.x  = T)
merge(Employee,Department2,by="Department",all.y  = T)

#---------------------------------------------------

#Own defined functions

Add_five <- function(x){
    x+5
  }

Add_five(3)
Add_five(c(10,15,20))

#############################
