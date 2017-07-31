
library(ggplot2)

data2 <- as.data.frame(read.csv(file="D:\\sourcecode\\smart-search-functional-test\\src\\test\\resources\\testJobtitlesGraphing.csv", header = T, sep = ",", row.names=NULL))

quantile(data2$responseTime, .95 )
quantile(data2$responseTime, .05 )

data2[,"query"]<-cut(data2$numOfCandidateSkills, breaks=c(0,1,2), labels=c("skills", "locations"))

ggplot(data=data2,aes(responseTime, fill = query, group=query)) +
  coord_cartesian(xlim=c(3, 27)) +
  geom_histogram(stat = "bin", binwidth=1) +
  ggtitle("Skills VS Location Query Response Times Comparison")+
  
  geom_vline(aes(xintercept=mean(responseTime, responseTime.rm=T)),   # Ignore NA values for mean
             color="red", linetype="dashed", size=1)
