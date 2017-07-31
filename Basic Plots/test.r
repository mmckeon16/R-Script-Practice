# My first program in R Programming

# data <- read.table("D:/sourcecode/smart-search-functional-test/src/test/resources/testR.csv", header=T,sep=",")
# plot(data)

# read.csv(file="D:/sourcecode/smart-search-functional-test/src/test/resources/testR.csv", sep=",", colClasses=c("NULL", "NULL", NA, NA))
# data2 <- read.csv(file="D:\\sourcecode\\smart-search-functional-test\\src\\test\\resources\\test1.csv", header = T, sep = ",", colClasses=c("NULL", "NULL", NA, NA))

# qplot(data=data2 ,color=blue, geom=point, ylim=c(0,100))

# p2 <- ggplot(data2, aes(x = responseTime))
# p2 + geom_histogram()

library(ggplot)

data <- read.csv(file="D:\\sourcecode\\smart-search-functional-test\\src\\test\\resources\\test1.csv", header = T, sep = ",")[,3:4]
p2 <- ggplot(data, aes(x = responseTime))
p2 + geom_histogram()

#attempted methods
library(ggplot2)
library(dplyr)
data <- read.csv(file="D:\\sourcecode\\smart-search-functional-test\\src\\test\\resources\\testHistGraphing.csv", header = T, sep = ",", row.names=NULL)

data$responseTime <- cut(data$income, breaks=c(2,5,7,10))
library(dplyr)

data2 <- data %>% 
  group_by(responseTime)

quantile(data2$responseTime, .95 )
quantile(data2$responseTime, .05 )

ggplot(data=data2,aes(responseTime, fill = factor(responseTime)) + #, group=numOfCandidateSkills)) +
  coord_cartesian(xlim=c(117, 136)) +
  geom_histogram(stat = "bin", binwidth=1) +
  geom_density(alpha = 0.1, col=3) +
  geom_vline(aes(xintercept=mean(responseTime, responseTime.rm=T)),   # Ignore NA values for mean
             color="red", linetype="dashed", size=1)

#more attempted methods

##other method for generating graph; supposed to separate by colors but it hates me
library(ggplot2)
library(dplyr)
data <- read.csv(file="D:\\sourcecode\\smart-search-functional-test\\src\\test\\resources\\testHistGraphing.csv", header = T, sep = ",", row.names=NULL)

stacks2 <-data %>% group_by(numOfCandidateSkills, responseTime)

quantile(data$responseTime, .95 )
quantile(data$responseTime, .05 )

ggplot(stacks2,aes(x=responseTime, fill = numOfCandidateSkills, colour=numOfCandidateSkills)) +
  coord_cartesian(xlim=c(117, 136)) +
  geom_histogram(stat = "bin", binwidth=1, aes(fill = numOfCandidateSkills), position='stack') +
  geom_density(alpha = 0.1, col=3) +
  geom_vline(aes(xintercept=mean(responseTime, responseTime.rm=T)),   # Ignore NA values for mean
             color="red", linetype="dashed", size=1)
