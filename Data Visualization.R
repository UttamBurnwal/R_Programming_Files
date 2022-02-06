
setwd("D:/Data Science Course/R-Programming/Materials/R Programming Materials/Data Set")

#read the file
customer_churn <- read.csv("D:/Data Science Course/R-Programming/Materials/R Programming Materials/Data Set/customer_churn.csv",stringsAsFactors = T)

#load libraries
#install.packages("ggplot2")
library(ggplot2)
library(dplyr)

# sapply(customer_churn, function(x) length(unique(x)))
# colSums(is.na(customer_churn))

#base
plot(customer_churn$Dependents)
plot(customer_churn$Dependents, col="coral")
plot(customer_churn$Dependents, col="coral",xlab="Dependents",ylab="Frequency",main="Dependents Plot")


dat <- data.frame(table(customer_churn$Dependents))

#a range of y's that'll leave sufficient space above the tallest bar
ylim <- c(0, 1.1*max(dat$Freq))
xx <- barplot(dat$Freq, ylim=ylim,col="steelblue4",
              xlab = "Dependents",
              main = "Distribution of Dependents", 
              ylab = "Frequency")
## Add text at top of bars
text(x = xx, y = dat$Freq, label = dat$Freq,pos=3,cex = 0.8)
axis(1, at=xx, labels=dat$Var1,tick=FALSE)

#------
plot(customer_churn$PhoneService)  
plot(customer_churn$PhoneService,col="aquamarine4")
plot(customer_churn$PhoneService,col="aquamarine4",
     xlab="Phone Service",
     ylab="Frequency",
     main="Distribution of PhoneService")

#--------

plot(customer_churn$Contract)  
plot(customer_churn$Contract,col="palegreen4",xlab="Contract",ylab = "Frequency",main="Distribution of Contract")

#---------------------------

hist(customer_churn$tenure)  
hist(customer_churn$tenure,col="steelblue4",border="white",xlab="Tenure",main="Distribution of Tenure")
hist(customer_churn$tenure,col="olivedrab", breaks=10)

#--------------------------

plot(x = customer_churn$tenure,y= customer_churn$TotalCharges, type="p",pch=20 ,
     xlab = "Tenure", ylab ="Total Charges", main = " Scatter Plot")

# x and y: the coordinates of points to plot
# type : the type of graph to create
# type=“p”: for points (by default)
# type=“l”: for lines
# type=“b”: for both; points are connected by a line
# pch : plotting ‘character’, i.e., symbol to use

#------------------- GGPLOT Visualizations -----------------------------------

#ggplot(data = data_set) + <geom_function>(mapping = aes(<mapping>))
#geoms = Geometric elements

ggplot(data = customer_churn,aes(x=tenure))+geom_histogram()  
ggplot(data = customer_churn, aes(x=tenure))+geom_histogram(bins = 50)

ggplot(data = customer_churn, aes(x=tenure))+geom_histogram(bins=50,fill="palegreen4",col="black")

ggplot(customer_churn,aes(x=tenure)) + geom_histogram(bins=20, fill= "steelblue4",col="white") +
  xlab("Tenure of customers") + ylab("Frequency") + ggtitle("Distribution of Tenure of customers")

ggplot(data = customer_churn, aes(x=tenure, fill=Partner))+geom_histogram(bins=20,col="black")+
  xlab("Tenure")+ylab("Frequency") + ggtitle("Distribution of Tenure")

ggplot(data = customer_churn, aes(x=tenure)) +
  geom_histogram(bins=20,fill="steelblue3",col="black",alpha=0.5) +
  stat_bin(bins=20, geom="text", color="black", aes(label=..count..), vjust = -0.5) +
  labs(title = "Tenure Distribution", x="Tenure",y="Frequency") +
  theme(plot.title = element_text(hjust=0.5,face="bold")) 

ggplot(data = customer_churn, aes(x=MonthlyCharges)) +
  geom_histogram(bins=20,fill="steelblue4",col="black",alpha=0.5) +
  stat_bin(bins=20, geom="text", color="black", aes(label=..count..), vjust = -1.1) +
  labs(title = "Monthly Charges Distribution", x="Monthly Charges",y="Frequency") +
  theme(plot.title = element_text(hjust=0.5,size=22)) 

#---------------------- Bar Plot ---------------------------------

ggplot(data = customer_churn,aes(x=Dependents)) + geom_bar()
ggplot(data = customer_churn,aes(x=Dependents)) + geom_bar(fill="chocolate")

ggplot(data = customer_churn,aes(x=Dependents,fill=DeviceProtection))+geom_bar() + 
  labs(title = "Bar chart", x="Dependents",y="Frequency")

table(customer_churn$Dependents)
table(customer_churn$Dependents,customer_churn$DeviceProtection)

ggplot(data = customer_churn,aes(x=Dependents,fill=DeviceProtection)) +
  geom_bar(position="dodge",col="black")

#-------------------- Scatter Plot -----------------------------------------

ggplot(data = customer_churn,aes(y=TotalCharges,x=tenure)) + geom_point()  
ggplot(data = customer_churn,aes(y=TotalCharges,x=tenure)) + geom_point(col="slateblue3")
ggplot(data = customer_churn,aes(y=TotalCharges,x=tenure, col=Partner)) + geom_point() 

ggplot(data = customer_churn,aes(y=TotalCharges,x=tenure, col=InternetService))+geom_point()

ggplot(data = customer_churn,aes(y=TotalCharges,x=tenure, col=InternetService))+geom_point()+
  scale_color_manual(values = c("steelblue2","red1","yellow2"))

ggplot(data = customer_churn,aes(y=TotalCharges,x=tenure, col=OnlineSecurity))+geom_point()

#------------------------ BOXPLOT ------------------------


ggplot(data = customer_churn,aes(y=MonthlyCharges,x=Dependents))+geom_boxplot()  
ggplot(data = customer_churn,aes(y=MonthlyCharges,x=Dependents))+geom_boxplot(fill="yellowgreen")

ggplot(data = customer_churn,aes(y=MonthlyCharges,x=InternetService))+geom_boxplot()
ggplot(data = customer_churn,aes(y=MonthlyCharges,x=InternetService))+geom_boxplot(fill="violetred4")

ggplot(data = customer_churn,aes(y=MonthlyCharges,x=PaymentMethod))+geom_boxplot()

ggplot(data = customer_churn,aes(y=MonthlyCharges,x=PaymentMethod,fill=PaperlessBilling))+geom_boxplot()

#---------------------------

ggplot(data = customer_churn,aes(x=tenure,fill=InternetService))+geom_histogram(bins = 40) +
  facet_grid(~InternetService) + ggtitle("Tenure Histogram- Internet Service Wise") +
  xlab("Tenure") + ylab("Count") + theme_minimal()

ggplot(data = customer_churn,aes(y=TotalCharges,x=tenure, col=Contract)) + geom_point() + 
  facet_grid(~Contract) + xlab("Tenure") + ylab("Total Charges") +
  ggtitle("Total Charges vs. Tenure") + theme_bw()

#----------------------------

ggplot(data = customer_churn,aes(x=tenure))+geom_histogram(fill="tomato3", col="mediumaquamarine")->g1
g1+labs(title = "Distribution of tenure")->g2
g2+theme(panel.background = element_rect(fill = "olivedrab3"))->g3
g3+theme(plot.background = element_rect(fill = "palegreen4"))->g4
g4+theme(plot.title = element_text(hjust = 0.5, face="bold", colour = "peachpuff"))

#-------------------------
  