#### Tutorial 10 

mydata <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
## view the first few rows of the data
head(mydata)


summary(mydata)
str(mydata)   ##to get class of all variables

#convert rank to a factor as it should be treated as a categorical variable.
mydata$rank <- as.factor(mydata$rank)
mydata$admit <- as.factor(mydata$admit)   ##this step can be skipped if you have 1,0 data but preferably do it
logit_model <- glm(admit ~ gre + gpa + rank, data = mydata, family = "binomial")
summary(logit_model)
#always compared to the reference group
#all variables are significant since have*, and p values are all smaller than 0.05

#Calculate percent change in odds of DV
(exp(0.002) - 1)*100    ## for gre
(exp(0.804) - 1)*100    ## for GPA
(exp(-.675) - 1)*100    ## for rank2
#Assignment 8
head(adult)
str(adult)
adult$income <- as.factor(adult$income)
logit_model <- glm(income ~ education + gender + hoursperweek, data = adult, family = "binomial")
summary(logit_model)
(exp(0.263) - 1)*100
(exp(0.041) - 1)*100
(exp(1.054) - 1)*100
