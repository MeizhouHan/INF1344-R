#### R Tutorial 1: Describing variable distributions

## Check your working directory
getwd()
setwd("/Documents/Deena/ischool /Courses/R stats Jia INF 1344/datasets")
## Another way to set your working directory is to navigate to it from the files tab on the right side pane then setting it as your working directory

##Example 1
#a)	Produce a frequency table for the following nominal variable (i.e., do you have a mood disorder, ccc_280) 
#and create a bar chart and a pie chart.

### Read the Data    "CCHS2012_shortened.csv"
CCHS <- read.csv("CCHS2012_shortened.csv", header = TRUE, sep=",") ##IMP: the file must be in your working directory
class(CCHS)
head(CCHS)       ## get the first rows of the data
colnames(CCHS)
str(CCHS)

## FREQUENCY TABLES
#1.a) create frequency table of mood disorder , ccc_280
counts <- table(CCHS$ccc_280)   
counts

#1. b) percentage table of mood disorder  (IMP )
prop.table(counts)

# 1.c) create frequency table of  mood disorder by gender
counts_by_gender <- table(CCHS$ccc_280, CCHS$dhh_sex)  ##first is the rows, 2nd is the columns
counts_by_gender


margin.table(counts_by_gender, 1) # row frequencies (summed over column) = sum(ccc_280) mood disorder 
margin.table(counts_by_gender, 2) # column frequencies (summed over row) = sum(dhh_sex) gender

### 1.d) Percentage table of mood disorder by gender       (IMP: Multiply by 100)
prop.table(counts_by_gender) # cell percentages
prop.table(counts_by_gender, 1) # row percentages 
prop.table(counts_by_gender, 2) # column percentages

#create barchart and pie chart
barplot(counts, main="CCHS2012", xlab = "Number of Persons with Mood Disorder")

lbls <- c("YES", "NO")
pie(counts, labels = lbls, main= "Pie Chart of Mood Disorder")

#optional plotting 3D pie
install.packages("plotrix")
library(plotrix)

pie3D(counts, labels = lbls, main= "Pie Chart of Mood Disorder")
#####
## Example 2:	Produce a frequency table for the following ordinal variable (i.e., past year, frequency of drinking alcohol, alc_2) 
#and create a bar chart and a pie chart.

counts_alc <- table(CCHS$alc_2)   
counts_alc

#create barchart and pie chart
barplot(counts_alc, main="CCHS2012", xlab = "Past year consumption of alcohol")

lbls_alc <- c("<1/month", "1/month", "2-3/month","1/wk", "2-3/wk","4-6/wk","Daily")
pie(counts_alc, labels = lbls_alc, main= "Pie Chart of Alcohol Consumption")

pie3D(counts_alc, labels = lbls_alc, explode=0.1, main= "Pie Chart of Alcohol Consumption")

#Example 3:	Produce a histogram for the following interval-ratio variable (i.e., number of years smoked, smkdycs)
##create a histogram
hist(CCHS$smkdycs)
x <- CCHS$smkdycs[which(CCHS$smkdycs != 996)]
hist(x)
summary(x)

#Add some features
hist(x, 
     main="Histogram for Years of Smoking", 
     xlab="Years", 
     border="blue", 
     col="green",
     xlim=c(0,70)
     )

######
#### MEASURES OF CENTRAL TENDENCY

### Read the Data    "GSS2013_Shortened.csv"
GSS <- read.csv("GSS2013_Shortened.csv", header = TRUE, sep=",")

# a)What is the average number of hours per week spent watching television (mcr_300c)?
Mean_GSS <- mean(GSS$mcr_300c)

#b)What is the median of number of hours per week spent watching television (mcr_300c)?
Median_GSS <- median(GSS$mcr_300c)

#c)What is the mode of number of hours per week spent watching television (mcr_300c)?
###there is no ready made function in R for the mode, create a function 
Mode <- function(x) {
    ux <- unique(x)
    ux[which.max(tabulate(match(x, ux)))]
}
Mode(GSS$mcr_300c)

### d) What is the distribution of number of hours per week spent watching television (mcr_300c)? Hint: normal, skewed left, or skewed right?
Mean_GSS > Median_GSS     ## in other words is it skewed to the right
hist(GSS$mcr_300c)

### MEASURES OF DISPERSION 1 ###
# 1a)	What is the range of number of close friends (scf_100c)?
range(GSS$scf_100c)
min(GSS$scf_100c)
max(GSS$scf_100c)

# 1b)	What is the variance/SD of number of close friends (scf_100c)? How data is spread around the mean?
var_GSS <- var(GSS$scf_100c)
SD_GSS <- sd(GSS$scf_100c)
sqrt(var_GSS)

### MEASURES OF DISPERSION 2 ###
# 2a)What is the 30th percentile of number of close friends (scf_100c)?
#The nth percentile of an observation variable is the value that cuts off the first n percent 
#of the data values when it is sorted in ascending order.
quantile(GSS$scf_100c, 0.30) 

## 2b) Calculate quartiles (i.e., 25th, 50th, and 75th percentile) for number of close friends (scf_100c)
#The first quartile, or lower quartile, is the value that cuts off the first 25% of the data when it is sorted in ascending order. 
#The second quartile, or median, is the value that cuts off the first 50%. 
#The third quartile, or upper quartile, is the value that cuts off the first 75%.

quantile(GSS$scf_100c) 
median(GSS$scf_100c)
# 2c)	Create a boxplot for number of close friends (scf_100c)
boxplot(GSS$scf_100c)
boxplot(GSS$mcr_300c)

## 2d) Interquartile Range for number of close friends (scf_100c)
#The interquartile range of an observation variable is the difference of 
#its upper and lower quartiles. It is a measure of how far apart the middle portion of data spreads in value.
IQR(GSS$scf_100c)





    