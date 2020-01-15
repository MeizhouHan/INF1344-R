##chi-square test

?mtcars
#vs Engine (0=V-shaped, 1= straight)
#am Transmission (0=automatic, 1=manual)
head(mtcars)
#Create a cross tabulation with the dependent variable as the row variable
table <- table(mtcars$vs, mtcars$am)  ##vs will be the rows and am will be the columns
table
## Get percentages out of all cars
prop.table(table)*100
### Out of all cars, about 22% of the cars have straight engine (1) and an automatic transmission (0)

## Get column percentages 
##Sometimes, we are interested in the distribution of one variable within groups created by another. 
# Here, distribution of engine types among automatic and (separately) manual cars seems interesting (ie: column percentages). 
# To get this, we use the margin argument to prop.table function. 
# It tells where in rows (margin=1) or in columns (margin=2) grouping variable is.

prop.table(table, margin=2)*100    #percentages of columns
## Out of all automatic cars, 36.8% have straight engine, 36.8= 7/19

prop.table(table, margin=1)*100    #percentages of rows
## 50% of all straight cars are automatic, 33.3% of all V-shaped are manual

##OPTIONAL (to make your solution readable)
# To get the labels, transform levels of vs into character 
mtcars$catvs <- ifelse(mtcars$vs ==0, "V-shaped", "straight") 
class(mtcars$catvs)

#Create a cross tabulation with the dependent variable as the row variable
mtcars$catam <- ifelse(mtcars$am ==0, "automatic", "manual") 
table1 <- table(mtcars$catvs, mtcars$catam)
table1
### why do we have the order of the rows of the table different? 
### because they are ordered in alphabetical order now ( s goes before V)



## Get percentages out of all cars
prop.table(table1)*100
### Out of all cars, about 22% of the cars have straight engine and an automatic transmission

## Get column percentages 
##Sometimes, we are interested in the distribution of one variable within groups created by another. 
# Here, distribution of engine types among automatic and (separately) manual cars seems interesting (ie: column percentages). 
# To get this, we use the margin argument to prop.table function. 
# It tells where in rows (margin=1) or in columns (margin=2) grouping variable is.

prop.table(table1, margin=2)*100    #percentages of columns
## Out of all automatic cars, 36.8% have straight engine, 36.8= 7/19

prop.table(table1, margin=1)*100    #percentages of rows
## 50% of all straight cars are automatic, 33.3% of all V-shaped are manual

##Chi-squared test
chisq.test(mtcars$vs, mtcars$am)
##chisq.test(mtcars$catvs, mtcars$catam)  (if you decide to use the option of adding labels)
#dependent v as row, independent as column

#Assignment 4
setwd("~/Desktop/1344/R")
data1<-read.csv(file.choose(),header=T)
#GSS<-read.csv("GSS2013_Shortened.csv", header=TRUE,sep=",")
getwd()
head(data1)
table <- table(data1$discrim, data1$sex)
table
prop.table(table, margin=2)*100
chisq.test(data1$discrim, data1$sex)


table1 <- table(data1$iuy_01, data1$sex)
table1
prop.table(table1, margin=2)*100
chisq.test(data1$iuy_01, data1$sex)
