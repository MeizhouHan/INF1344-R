### Tutorial 9

##Linear regression 
CCHS <- read.csv("CCHS2012_Shortened.csv")

#(1)	Conduct an OLS regression model using weight (hwtgwtk) as dependent variable and frequency of exercise (pacdfm) as independent variable
class(CCHS$hwtgwtk)
class(CCHS$pacdfm)
summary(CCHS$hwtgwtk)  ## check for missing or extreme outliers, there's missing value in this assignment
summary(CCHS$pacdfm)   ## check for missing or extreme outliers
model_weight <- lm(hwtgwtk ~ pacdfm, data= CCHS)
summary(model_weight)

## Rsquared increases as you increase predictors even if by chance
## Adjusted R squared is a modified version of R-squared that has been adjusted for the number of predictors in the model. The adjusted R-squared increases only if the new term improves the model more than would be expected by chance. 
#It decreases when a predictor improves the model by less than expected by chance.

# (2)	Conduct an OLS regression model using weight (hwtgwtk) as dependent variable and sex (dhh_sex) as independent variable. 
head (CCHS$dhh_sex)
class(CCHS$dhh_sex)      
summary(CCHS$dhh_sex)
sex <- as.factor(CCHS$dhh_sex)   #transform into factor
summary(sex)#shows the frequencies
class(sex)
model_sex <- lm(hwtgwtk ~ sex, data= CCHS)
summary(model_sex)
#the category that is not showing is the reference group

# (3)	Conduct an OLS regression model using weight (hwtgwtk) as dependent variable and marital status (dhhgms) as independent variable. 
head (CCHS$dhhgms)
class(CCHS$dhhgms)
ms <- as.factor(CCHS$dhhgms)   #transform into factor
summary(ms)
model_ms <- lm(hwtgwtk ~ ms, data= CCHS)
summary(model_ms)

# (4)	Conduct an OLS regression model using weight (hwtgwtk) as dependent variable, marital status (dhhgms) as independent variable, 
# and frequency of exercise (pacdfm) and marital status (dhhgms) as control variables. 
model_all <- lm(hwtgwtk ~ pacdfm + sex + ms, data= CCHS)
summary(model_all)

# (5) Relevel ms to have a reference category of 2
levels(ms)
ms_releveled <- relevel(ms, ref=2)
levels(ms_releveled)  #check if it's releveled
##repeat the regression model using the new variable ms_releveled
model_ms2 <- lm(hwtgwtk ~ ms_releveled, data= CCHS)
summary(model_ms2)

#Assignment7 
#1.1 total work hours (lbsghpw) as dependent variable and (past week) average daily alcohol consumption (alwddly) as independent variable
CCHScleaned <- CCHS
summary(CCHScleaned$alwddly)  #has missing values
missed_alwddly <- which(CCHScleaned$alwddly==996)
CCHScleaned <- CCHScleaned[-missed_alwddly,] 
summary(CCHScleaned$lbsghpw)   #also has missing
missed_lbsghpw <- which(CCHScleaned$lbsghpw==996)
CCHScleaned <- CCHScleaned[-missed_lbsghpw,]       #we are only left with 492 observations
clamodel_alcohol <- lm(lbsghpw ~ alwddly , data= CCHScleaned)   #for cleaned model
#model_alcohol <- lm(lbsghpw ~ alwddly , data= CCHS)   #for non-cleaned model
summary(clamodel_alcohol)
#1.2
CCHScleaned <- CCHS
missed_lbsghpw <- which(CCHScleaned$lbsghpw==996)
CCHScleaned <- CCHScleaned[-missed_lbsghpw,]
summary(CCHScleaned$edudr04)
head (CCHScleaned$edudr04)
class(CCHScleaned$edudr04)      
edu <- as.factor(CCHScleaned$edudr04)  
summary(edu)
class(edu)
levels(edu)
edu_releveled <- relevel(edu, ref=3)
levels(edu_releveled)
clamodel_edu <- lm(lbsghpw ~ edu_releveled , data= CCHScleaned)
summary(clamodel_edu)
#1.3
model_all <- lm(lbsghpw ~ edu_releveled + alwddly, data= CCHScleaned)
summary(model_all)
