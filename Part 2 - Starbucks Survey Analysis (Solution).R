# regression analysis in R
setwd("C:/Users/miche/Desktop")

# read in a sample excel sheet
library("readxl")
starbucks = as.data.frame(read_excel("C:\\Users\\miche\\Desktop\\Starbucks HW2 Data.xlsx",sheet="Starbucks HW2 Data"))
attach(starbucks)
starbucks

#Question 1a: Low resolution scatterplot
plot(Income,profits,type='p')

#Question 1a: Slightly higher resolution plot
plot(Income, profits,frame=F, pch=19, cex=2, font.axis=2, font.lab=2)

#Question 1a: Fit a simple linear regression in R
question1a <- lm(profits ~ Income)
question1a # this prints the regression coefficients

#Question 1a: Show Y intercept
plot(Income, profits,frame=F, pch=19, cex=1, font.axis=2, 
     ylim=c(0, 200), xlim=c(0, 250000),font.lab=2)

#Question 1a: overlay the regression line on the plot
abline(question1a, col="red")

#Question 1b: Creating histogram of 'satis100' 
H_satis100 <- starbucks$satis100/10
hist(H_satis100,
     main="Distribution of Customer Satisfaction",
     xlab="Customer Satisfaction",
     xlim=c(0,10),
     ylim=c(0,1500),
     freq=TRUE)

summary(H_satis100)

#Question 1b: Creating histogram of 'recommend' 
H_recommend <- starbucks$recommend
hist(H_recommend,
     main="Distribution of Customer Recommendation",
     xlab="Customer Recommendation",
     xlim=c(0,10),
     ylim=c(0,1500),
     freq=TRUE)


#Question 2: Regression with profits as dependent variable, and satis100, recommend, and Income as independent variables
question2 <- lm(profits ~ satis100 + recommend + Income)
question2
summary(question2)

#Question 3: Creating dummy variables 'fail' and 'exceed'
fail <- ifelse(starbucks$satis100 < 20, 1, 0) 
exceed <- ifelse(starbucks$satis100 > 80, 1, 0)

question3 <- lm(profits ~ fail + exceed + recommend + Income)
question3

summary(question3)

#Question 3a: Number of customers with satis100<20
count(starbucks$satis100 < 20)

#Question 3b: Number of customers with satis100>80
count(starbucks$satis100 > 80)

