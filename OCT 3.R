#Tutorial 4
install.packages("BSDA")
library(BSDA)
#Question 1
##two-sided t-test (equality)
set.seed(0)
treeVolume <- c(rnorm(75, mean = 36500, sd = 2000))#c vector
TEST <- z.test(treeVolume, mu = 39000, sigma.x=2000) # Ho: mu = 39000, put mu and sigma of the population, default is two-sided
TEST#we get the result of the question, but we still can run them seperately in the following:
attributes(TEST)
TEST$statistic
TEST$p.value    ## p<0.05  null hypothesis is rejected (pvalue should be less than the 1-confidence interval)
TEST$conf.int

#Question 2
## One sided t-test less than
## put the bottles first in a vector
bottles <- c(518.86,495.13,488.65,468.95, 455.92, 471.80, 522.66, 510.71, 486.12, 
            481.03, 481.18, 516.28, 484.73, 522.71, 507.60, 523.78, 469.91, 491.77, 
            469.72, 506.35, 494.53, 484.57, 527.66, 497.24, 516.27, 510.95, 472.31, 
            476.29, 492.72, 463.54, 505.86, 459.81, 531.87, 479.15, 533.18, 481.34, 
            467.46, 492.19, 492.25, 449.91)

z.test(bottles, mu=500, sigma.x = 25, alternative="less", conf.level=0.99)  ## We put the mean and SD of the population, default conf level=0.95
# p>0.01 hence null hypothesis cannot be rejected (0.99 Confidence interval)
# Bottles are not consistently underfilled
#defalt is two-tailed, if not put alternative "less" or "greater"

#Exercises
#Question 1
#H0: mu=75   Ha:mu not equal 75
results <-  c(65, 78, 88, 55, 48, 95, 66, 57, 79, 81, 66, 79, 89, 56, 49, 96, 67, 58, 80, 82, 64, 77, 87, 54, 47, 94, 63, 56, 78, 80)
mean(results)
sd(results)
z.test (results, mu=75, sigma.x = sd(results))
#p> 0.05 null hypothesis is rejected, mu is not equal to 75, the average result of the population which received the same test is not equal to 75

#Question 2
x <- c(0.64, 0.39, 0.68, 0.43, 0.30, 0.88, 0.31, 0.44, 0.38, 0.31, 0.62, 0.20, 0.46, 0.39, 0.22, 0.49, 0.41, 
       0.38, 0.70, 0.61, 0.48, 0.53, 0.35, 0.46, 0.72, 0.50, 0.53, 0.90, 0.36, 0.69, 0.86, 0.29, 0.50, 0.42, 
       0.40, 0.29, 0.32, 0.75, 0.62, 0.66, 0.81, 0.43, 0.66, 0.49, 0.40, 0.69, 0.51, 0.29, 0.45, 0.80) 


z.test(x, mu=0.3, sigma.x=0.2, alternative = "greater")
## p<0.05  null hypothesis is rejected, the mean level of Salmonella in the ice cream is significantly greater than 0.3 MPN/g







