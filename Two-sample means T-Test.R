#Two-sample means T-Test (Independent samples)
?mtcars
t.test(mtcars$mpg~mtcars$am)       ## DV first then IV,am&pm are in the same column, so we need to split them by using ~


## Dependent sample (matched pairs) t.test
## Note that dependent sample implies that the result in the 2nd group is affected by result in first group
install.packages('MASS')
library(MASS)
?immer
immer
boxplot(immer$Y1, immer$Y2)
ttest <- t.test(immer$Y1, immer$Y2, paired=TRUE)   ## this is a paired t-test
### please note I here did not use the ~ sign as the two values I am comparing are in two different columns

ttest    ## mean of Y1 > mean of Y2 by 15.9
names(ttest)   # to get the labels of the variables you want to extract
st <- ttest$statistic
pvalue <- ttest$p.value
st
pvalue      ##p value <0.05, reject the null hypothesis, there is a significant difference between Y1 and Y2
       
mean(immer$Y1)-mean(immer$Y2)  ##if you want to get the difference in means
#the independent t-test there's no seperate mean, but there's seperate mean for dependent t-test.

#Assignment5
#1.independent t-test
View(data1)
t.test(data1$mcr_300c~data1$sex)


#2.dependent t-test
#> mice <- read.csv("~/Desktop/1344/R/mice.csv")
#>   View(mice)
t.test(mice$weight ~ mice$group, paired=TRUE)

