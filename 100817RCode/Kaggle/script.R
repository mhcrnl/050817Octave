# This R environment comes with all of CRAN preinstalled, as well as many other helpful packages
# The environment is defined by the kaggle/rstats docker image: https://github.com/kaggle/docker-rstats
# For example, here's several helpful packages to load in 

library(ggplot2) # Data visualization
library(readr) # CSV file I/O, e.g. the read_csv function
library(randomForest)
library(mice) 
# Input data files are available in the "../input/" directory.
# For example, running this (by clicking run or pressing Shift+Enter) will list the files in the input directory

list.files("../input")

# Any results you write to the current directory are saved as output.
library(dplyr)

# load data
train <- read.csv('../input/train.csv', stringsAsFactors = F)
str(train)       #891 obervations; 12 variables
test  <- read.csv('../input/test.csv', stringsAsFactors = F)
str(test)        #418 obervations; 12 variables
alldata <- bind_rows(train,test)
str(alldata)     #1309 obervations; 12 variables


# explore data---------------------------------------------------------------------
summary(train)

# There are 12 variables;
# 'PassengerId', 'Name' , 'Ticket' and 'Cabin' don't seem to be relevant to survival

# want to examine whether 'Pclass', 'Sex' and 'Age' relate to survival 
# Convert 'Pclass', 'Sex', 'Survived' to factors
train$Pclass <- as.factor(train$Pclass)
train$Sex <- as.factor(train$Sex)
train$Survived <- factor(train$Survived,levels=c(0,1),labels=c("Not surv","Surv"))
counts <- table(train$Survived, train$Pclass)
barplot(counts, main="Survival by Pclass",
  xlab="Pclass", col=c("red","blue"),
 	legend = rownames(counts), beside=TRUE)

ggplot(train, aes(x=Age, y=Pclass, color=Survived)) +
    geom_jitter(position = position_jitter(height = .2)) +
    scale_color_manual(values=c("red", "blue")) + facet_grid(Sex ~ .) +
    ggtitle("Age, Sex, and Pclass as Survival Factors") 
    
# From the plot, it looks like    
# 'Sex' Female has higher chance of survival than male; 
# 'Pclass' Pclass 1 has higher chance of survival than Pclass 2 or 3; 
# 'Age' Child also has higher chance of survival

# To examine the relationship between 'Fare' and 'Survived'

library(psych)
summary_fare <- describeBy(train$Fare, train$Pclass)

boxplot(train$Fare~train$Pclass, main="Fare and Pclass", 
  	xlab="Pclass", ylab="Fare")

ggplot(train, aes(x=Fare, y=Pclass, color=Survived)) +
    geom_jitter(position = position_jitter(height = .2)) +
    scale_color_manual(values=c("red", "blue")) + 
    ggtitle("Fare and Pclass as Survival Factors") 

# From the barplot, median and range of Pclass 1 are much higher fares compared to Pclass 2 and Pclass 3; 
# so higher fare passengers has higher chance of survival as they are most likely in Pclass 1 

# To examine whether 'SibSp' and 'Parch' relates to survival
# Define a new variable 'famsize' which incorporates 'SibSp' and 'Parch'
train$famsize <- train$SibSp + train$Parch + 1
ggplot(train, aes(x = famsize, fill = Survived)) +
  geom_bar(stat='count', position='dodge') +
  scale_x_continuous(breaks=c(1:11)) +
  labs(x = 'Family Size') 
# It seems that there is a survival penalty for singletons and also for families with size >=5.

# last variable 'Embarked'
train$Embarked <- as.factor(train$Embarked)

ggplot(train, aes(x=Embarked, y=Pclass, color=Survived)) +
    geom_jitter(position = position_jitter(height = .2)) +
    scale_color_manual(values=c("red", "blue")) + 
    ggtitle("Embarked and Pclass as Survival Factors") 
# Not so clear how 'Embarked' relates to survival 
#---------------------------------------------------------------------------------
# Use logistic regression to do prediction of survival
# Independent variables could possibly include 'Pclass', 'Sex', 'Age','Fare','famsize','Enbarked'
#---------------------------------------------------------------------------------
# Define a new variable 'Dfamsize' to discretize 'famsize'
alldata$famsize <- alldata$SibSp + alldata$Parch + 1
alldata$Dfamsize[alldata$famsize==1] <- 'Single'
alldata$Dfamsize[alldata$famsize>1 & alldata$famsize<5] <- 'Small'
alldata$Dfamsize[alldata$famsize>4] <- 'Large'
factor_vars <- c('Pclass','Sex','Embarked','Dfamsize','Survived')
alldata[factor_vars] <- lapply(alldata[factor_vars], function(x) as.factor(x))

sapply(alldata,function(x) sum(is.na(x)))
# Impute Age for train and test by random sampling

set.seed(200)
#sum(is.na(alldata$Age)) #263 missing values for 'Age'
#mean_all <- mean(alldata$Age,na.rm=TRUE)
#sd_all <- sd(alldata$Age,na.rm=TRUE)
#set.seed(100)
#rnumbs <- sample((mean_all-sd_all):(mean_all+sd_all),263,replace=T)
#alldata$Age[is.na(alldata$Age)] <- rnumbs
#sum(is.na(alldata$Age))

# Use MICE to impute Age
mice_mod <- mice(alldata[, !names(alldata) %in% c('PassengerId','Name','Ticket','Cabin','Dfamsize','Survived')], method='rf') 
mice_output <- complete(mice_mod)

#Let's compare the results we get with the original distribution of passenger ages to ensure that nothing has gone completely awry.

#summary(mice_output)
# Plot age distributions
#par(mfrow=c(1,2))
#hist(alldata$Age, freq=F, main='Age: Original Data', 
#  col='darkgreen', ylim=c(0,0.04))
#hist(mice_output$Age, freq=F, main='Age: MICE Output', 
#  col='lightgreen', ylim=c(0,0.04))

# Replace Age variable from the mice model.
alldata$Age <- mice_output$Age

# Show new number of missing Age values
#sum(is.na(alldata$Age))

which(is.na(alldata$Fare)) #1044. 
#This passenger is in Pclass 3 and so impute it using mean of the fare of Pclass 3.
tempdata<-alldata[alldata[,"Pclass"]==3,]
mean(tempdata$Fare,na.rm=T)
alldata[1044,]$Fare<-mean(tempdata$Fare,na.rm=T)

#Create the column S3, which identify passenger who embarked at Southampton and was in Pclsss 3
alldata$S3[alldata$Embarked == 'S' & alldata$Pclass == 3] <- 'S3'
alldata$S3[alldata$Embarked != 'S' | alldata$Pclass != 3] <- 'Not S3'
alldata$S3  <- factor(alldata$S3)
table(alldata$S3, alldata$Survived)

# Create the column child, and indicate whether child or adult
alldata$Child[alldata$Age < 18] <- 'Child'
alldata$Child[alldata$Age >= 18] <- 'Adult'

# Show counts
table(alldata$Child, alldata$Survived)
#Looks like being a child doesn't hurt, but it's not going to necessarily save you either! 

# Adding Mother variable
alldata$Mother <- 'Not Mother'
alldata$Mother[alldata$Sex == 'female' & alldata$Parch > 0 & alldata$Age > 18] <- 'Mother'

# Show counts
table(alldata$Mother, alldata$Survived)

# Finish by factorizing our two new factor variables
alldata$Child  <- factor(alldata$Child)
alldata$Mother <- factor(alldata$Mother)
# Separate the training data into two parts for a test

#train_new1 <- alldata[1:800,]
#train_new2 <- alldata[801:891,]
train <- alldata[1:891,]
test <- alldata[892:1309,]

#model_titanic <- glm(Survived ~ Pclass + Sex + Embarked + Dfamsize + Age + Fare,
#                family=binomial(link='logit'),data=train_new1)

#summary(model_titanic)
#fitted.results <- predict(model_titanic,newdata=train_new2,type='response')
#fitted.results
#fitted.results <- ifelse(fitted.results > 0.5,1,0)
#accuracy <- mean(fitted.results == train_new2$Survived)
#print(paste('Accuracy',accuracy))

# "Accuracy 0.835164835164835"
# From the model summary, 'Pclass','Sex','Age' and 'Dfamsize'have very small p-values
# The p-value for 'Embarked' is very large
# Let's drop 'Embarked' and fit a new model to check any improvement of accuracy

#model_titanic_1 <- glm(Survived ~ Pclass + Sex + Dfamsize + Age + Fare,
#                family=binomial(link='logit'),data=train_new1)

#summary(model_titanic_1)
#fitted.results <- predict(model_titanic_1,newdata=train_new2,type='response')
#fitted.results <- ifelse(fitted.results > 0.5,1,0)
#accuracy <- mean(fitted.results == train_new2$Survived)
#print(paste('Accuracy',accuracy))

# "Accuracy 0.813186813186813"
# Null deviance, residual deviance and AIC are roughly the same between these two models

# Prefer the second model without 'Embarked' as predictor
#titanic_model <- glm(Survived ~ Pclass + Sex + Dfamsize + Age + Fare,
#                family=binomial(link='logit'),data=train_new)
                
#fitted.results <- predict(titanic_model,newdata=test_new,type='response')
#fitted.results <- ifelse(fitted.results > 0.5,1,0)
#accuracy <- mean(fitted.results == test_new$Survived)
#print(paste('Accuracy',accuracy))
 
#titanic_model <- glm(Survived ~ Pclass + Sex + Dfamsize + Age + Fare,
#                family=binomial(link='logit'),data=train)
                
#fitted.results <- predict(titanic_model,newdata=test,type='response')
#fitted.results <- ifelse(fitted.results > 0.5,1,0)
#solution <- data.frame(PassengerId = test$PassengerId, Survived = fitted.results)
#write.csv(solution, file = 'logit_titanic.csv', row.names = F) 
  
# Use randomForest to predict
titanic_rf <- randomForest(Survived ~ Pclass + Sex + Dfamsize + Age + Fare + S3 + SibSp + Parch + Child,data=train)
importance(titanic_rf)

fitted.results <- predict(titanic_rf,newdata=test,type='response')
solution <- data.frame(PassengerId = test$PassengerId, Survived = fitted.results)
write.csv(solution, file = 'rf_titanic.csv', row.names = F) 
  
  
  
  
  
  
  
  
  
  
  