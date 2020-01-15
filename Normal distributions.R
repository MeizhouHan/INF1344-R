# Normal distributions
##Practice
#1)	Generate 10000 numbers randomly from a normal distribution 
x <- rnorm(10000)   #default mean=0, sd=1
mean(x)
sd(x)

#2)	Generate 10000 numbers randomly from a normal distribution, mean=5, sd=7
x <- rnorm(10000,5,7)
mean(x)
sd(x)

#3)	Find the height of a normal distribution that corresponds to an x= 1.5
dnorm(1.5)   #default mean=0, sd=1

#4) Draw the normal distribution 
curve(dnorm(x, mean=0, sd=1), from=-3, to=3)

#5) a)	Find the height of the probability distribution curve of the first student in the case that she's arriving in 28.5 minutes. 
dnorm(28.5, mean=30, sd= 3)

#5) b) Plot the distribution period from 15 to 45 minutes for the first student 
curve(dnorm(x, mean=30, sd= 3), from=15, to=45)

#5) c) Create a normally distributed sample set for the first student with a size of 200. Plot a histogram for this dataset.
set.seed(25)
hist(rnorm(200, 27,7), breaks=15)

#5) d)	Find the probability that the second student arrives at the university in 20 minutes or less
pnorm(20, mean=27, sd= 7)
pnorm(10, mean=27, sd= 7)  #Values of probabilities increase as we head towards the mean

#5) e) Find arrival time of the 2nd student corresponding to the 80th percentile i.e (what is the time of arrival corresponding to 80% of times).
qnorm(0.8, mean =27, sd = 7) # 80% of the values in the distribution are LESS than this value


### Exercises
# The Normal Distribution in R

# Question 1
#1.1
A=rnorm(100)
#1.2
mean(A)
sd(A)
#1.3
B <- rnorm(100, 2, 5)
#1.4
mean(B)
sd(B)
#1.5
dnorm(1.96)

# Question 2
#2.1 What is the percentage/probability of students scoring 86 or more in the exam?
## pnorm gives 86 or less
## calculate using pnorm then substract from 1, as pnorm gives us probability of less than and not probability of greater than
1 - pnorm(86, mean=62, sd=14.2)
##another way of doing it
pnorm(86, mean=62, sd=14.2, lower.tail=FALSE) 

#2.2 	What is the percentage scoring between 60 and 70 in the exam?
#subtract prob(70)-prob(60)
pnorm(70, mean=62, sd=14.2) - pnorm(60, mean=62, sd=14.2)

#2.3	What is the score corresponding to the bottom 10% of the exam scores (10th percentile)?
qnorm(0.1, mean =62, sd = 14.2)
### if you want those corresponding to the top 20%, then this is the score corresponding to the 80th percentile
## rationale: If 20% score higher than you, then 80% score lower. So just call qnorm() with 0.80 as the boundary value:
qnorm(0.8, mean =62, sd = 14.2)


#2.4  someone failing would have a score of below 50
pnorm(50, mean=62, sd=14.2)



