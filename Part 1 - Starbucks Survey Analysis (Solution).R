setwd("C:/Users/miche/Desktop")
data1 = read.table("starbucks final data.txt", header=T, sep="\t")

data1
nrow(data1)

is.na(data1) # TRUE means missing, FALSE means not missing
is.na(data1)*1 # this converts TRUE to 1 and FALSE to 0
is.missing <- is.na(data1)*1

#Question 1a: to calculate the total number of missing values for each variable, use colSums
colSums(is.missing)

#Question 1b: to calculate the total number of missing values for ALL variables
sum(colSums(is.missing))

#Question 2: 
complete.data <- na.omit(data1)
complete.data
#Question 2a: Total number of non-missing rows
nrow(complete.data)

#Question 3a: Sum of impossible variables for EACH variable
twentytwo_var <- complete.data[1:22]
colSums(twentytwo_var < 1|twentytwo_var > 5)

#Question 3b: Sum of ALL impossible variables across the 22 variables
all_impossible <- colSums(twentytwo_var < 1|twentytwo_var > 5)
sum(all_impossible)

twentytwo_var

#Question 4a: Replace values < 1 with '1'
twentytwo_var[twentytwo_var < 1] <- 1 # this replaces all of the values smaller than 1 with 1

#Question 4b: Replace values > 5 with '5'
twentytwo_var[twentytwo_var > 5] <- 5 # this replaces all of the values greater than 5 with 5

#Question 4c: Frequency count for each value/category
twentytwo_var

install.packages('plyr')
library(plyr)
count(twentytwo_var,'X1')
count(twentytwo_var,'X2')
count(twentytwo_var,'X3')
count(twentytwo_var,'X4')
count(twentytwo_var,'X5')
count(twentytwo_var,'X6')
count(twentytwo_var,'X7')      
count(twentytwo_var,'X8')
count(twentytwo_var,'X9')
count(twentytwo_var,'X10')
count(twentytwo_var,'X11')
count(twentytwo_var,'X12')
count(twentytwo_var,'X13')
count(twentytwo_var,'X14')
count(twentytwo_var,'X15')
count(twentytwo_var,'X16')
count(twentytwo_var,'X17')
count(twentytwo_var,'X18')
count(twentytwo_var,'X19')
count(twentytwo_var,'X20')
count(twentytwo_var,'X21')
count(twentytwo_var,'X22')

#Question 5a: Replace values < 0 with '0' - satis100
satis100_var <- complete.data[23]
satis100_var[satis100_var < 0] <- 0 # this replaces all of the values smaller than 0 with 0

#Question 5a: Replace values > 100 with '100' - satis100
satis100_var[satis100_var > 100] <- 100 # this replaces all of the values greater than 100 with 100

#Question 5b: Replace values < 0 with '0' - recommend
recommend_var <- complete.data[24]
recommend_var[recommend_var < 0] <- 0 # this replaces all of the values smaller than 0 with 0

#Question 5b: Replace values > 10 with '10' - recommend
recommend_var[recommend_var > 10] <- 10 # this replaces all of the values greater than 10 with 10
table(recommend_var)

#Question 5c: Average values for all the variables
avg.values <- apply(data1, 2, mean, na.rm=T)

complete.data #to check 

#Combining the cleaned variables X1-X22, satis100, recommend, with the uncleaned variables profits, zipcode & income:
final.complete.data <- data.frame(twentytwo_var,satis100_var,recommend_var,complete.data[25:27])
final.complete.data #to check 

avg.values <- apply(final.complete.data, 2, mean)
avg.values #Average values for each variable

write.table(avg.values) #to export to Excel and split into table for Word doc
