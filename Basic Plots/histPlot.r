
library(ggplot2)

data2 <- as.data.frame(read.csv(file="D:\\sourcecode\\smart-search-functional-test\\src\\test\\resources\\testHistGraphing.csv", header = T, sep = ",", row.names=NULL))

quantile(data2$responseTime, .95 )
quantile(data2$responseTime, .05 )

data2[,"skills"]<-cut(data2$numOfCandidateSkills, breaks=c(0,5,10,15,20), labels=c("1-5", "5-10", "10-15","15-20"))

ggplot(data=data2,aes(responseTime, fill = skills, group=skills)) +
  coord_cartesian(xlim=c(26, 180)) +
  geom_histogram(stat = "bin", binwidth=1) +
  ggtitle("Histogram of Multi Skills Query Response Times")+
  geom_vline(aes(xintercept=mean(responseTime, responseTime.rm=T)),   # Ignore NA values for mean
             color="red", linetype="dashed", size=1)
