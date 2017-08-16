
library(ggplot2)

data2 <- as.data.frame(read.csv(file="D:\\sourcecode\\smart-search-functional-test\\src\\test\\resources\\testJobtitlesGraphing.csv", header = T, sep = ",", row.names=NULL))
dataSkills <- as.data.frame(read.csv(file="D:\\sourcecode\\smart-search-functional-test\\src\\test\\resources\\testSkillsGraphing.csv", header = T, sep = ",", row.names=NULL))
quantile(data2$responseTime, .95 )
quantile(data2$responseTime, .05 )

#data2[,"skills"]<-cut(data2$numOfCandidateSkills, breaks=c(0,5,10,15,20), labels=c("1-5", "5-10", "10-15","15-20"))

p2 <- ggplot(data=data2,aes(responseTime)) +
  coord_cartesian(xlim=c(20, 30)) +
  geom_histogram(stat = "bin", binwidth=1, color = "blue") +
  #ggtitle("Histogram of Multi Skills Query Response Times")+
  geom_vline(aes(xintercept=mean(responseTime, responseTime.rm=T)),   # Ignore NA values for mean
             color="red", linetype="dashed", size=1)


ps <- ggplot(data=dataSkills,aes(responseTime)) +
  coord_cartesian(xlim=c(20, 30)) +
  geom_histogram(stat = "bin", binwidth=1, color = "red") +
  ggtitle("Histogram of Multi Skills Query Response Times")+
  geom_vline(aes(xintercept=mean(responseTime, responseTime.rm=T)),   # Ignore NA values for mean
             color="red", linetype="dashed", size=1)


