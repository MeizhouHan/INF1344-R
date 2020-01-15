#Tutorial 8
#Question 1
###Import the data
drugs_data=read.table("http://personality-project.org/R/datasets/R.appendix1.data",header=T)   #read online data into a table 
drugs_data
class(drugs_data)

##Run statistics on the data, use tapply
tapply(drugs_data$Alertness, drugs_data$Dosage, mean)   ## get means of the groups
tapply(drugs_data$Alertness, drugs_data$Dosage, var)   ## get variances of the groups
tapply(drugs_data$Alertness, drugs_data$Dosage, length)  ## sample sizes of each group
boxplot(drugs_data$Alertness~drugs_data$Dosage)  ## draw  boxplots      note the tilda
#showing variance, the var of a is very big

aov.drugs = aov(Alertness~Dosage,data=drugs_data)  #do the analysis of variance
#dependent first, and independent 2nd, in the same column so use～
summary(aov.drugs)                                    #show the summary table

print(model.tables(aov.drugs,"means"),digits=3)   ##also reports means and counts in each group


#Question 2
##Import the data
days <- read.csv("days.csv", header=T) 
class(days)


tapply(days$Transactions, days$Day, mean)   ## get means of transactions for each day
mean(days$Transactions)    ##grand mean of all transactions
tapply(days$Transactions, days$Day, var)   ## get variances of the groups
tapply(days$Transactions, days$Day, length)  ## sample sizes of each group
boxplot(days$Transactions~days$Day)  ## draw  boxplots      note the tilda

aov.days = aov(Transactions~Day,data=days)  #do the analysis of variance
summary(aov.days)                                    #show the summary table

#Exercise 1  ASSIGNMENT QUESTION 1
GSS <- read.csv("GSS2013_Shortened.csv")
class(GSS$hsdsizec)
class(GSS$prcode)
boxplot(hsdsizec ~ prcode, data=GSS)
head(GSS$prcode)
provinces <- as.factor(GSS$prcode)  ##Independent variable has to be categorical in order to have correct degrees of freedom
levels(provinces)
results = aov(hsdsizec ~ provinces, data=GSS)
#The first argument is always the dependent variable (hsdsizec ). It is followed by the tilde symbol (~) and the independent variable(provinces) 
# that has to be categorical
summary(results)    ## F=2.4
names(results)
results$df.residual   ## 9 df for provinces and 1490 for the residual

##p <0.05  hence reject the null hypothesis, household size is significantly different by province size


#Q2
#3.	Does total work hours (lbsghpw) differ for people who have mood disorder and who do not have mood disorder (ccc_280)? t.test

##run this to clean the data and remove missing value of 996
CCHS2012 <- read.csv("CCHS2012_Shortened.csv")
head(CCHS2012$lbsghpw)  #this column has values of 996 which are code for missing values
CCHS <- CCHS2012
missed <- which(CCHS$lbsghpw==996)
CCHS <- CCHS[-missed,]     
head(CCHS$lbsghpw)
t.test(CCHS$lbsghpw ~ CCHS$ccc_280)

#Assignment 6
#1.
GSS <- read.csv("GSS2013_Shortened.csv")
class(GSS$hsdsizec)
class(GSS$prcode)
tapply(GSS$hsdsizec, GSS$prcode, mean)
tapply(GSS$hsdsizec, GSS$prcode, var)
tapply(GSS$hsdsizec, GSS$prcode, length) 
boxplot(hsdsizec ~ prcode, data=GSS)
head(GSS$prcode)
provinces <- as.factor(GSS$prcode)  ##Independent variable has to be categorical in order to have correct degrees of freedom
levels(provinces)
results = aov(hsdsizec ~ provinces, data=GSS)
#The first argument is always the dependent variable (hsdsizec ). It is followed by the tilde symbol (~) and the independent variable(provinces) 
# that has to be categorical
summary(results)    ## F=2.4
#2.1)
CCHS2012 <- read.csv("CCHS2012_Shortened.csv")
t.test(CCHS2012$fvcdfru~CCHS2012$dhh_sex)
#2)
t.test(CCHS2012$hwtgbm~CCHS2012$ccc_290)
#3)
head(CCHS2012$lbsghpw)  #this column has values of 996 which are code for missing values
CCHS <- CCHS2012
missed <- which(CCHS$lbsghpw==996)
CCHS <- CCHS[-missed,]     
head(CCHS$lbsghpw)
t.test(CCHS$lbsghpw ~ CCHS$ccc_280)
#4)
class(CCHS2012$hwtgwtk)
class(CCHS2012$dhhgms)
marriage <- as.factor(CCHS2012$dhhgms)  
levels(marriage)
results = aov(hwtgwtk ~ marriage, data=CCHS2012)
summary(results)
#5)
class(CCHS2012$pacdfm)
class(CCHS2012$edudr04)
education <- as.factor(CCHS2012$edudr04)  
levels(education)
results = aov(pacdfm ~ education, data=CCHS2012)
summary(results)
