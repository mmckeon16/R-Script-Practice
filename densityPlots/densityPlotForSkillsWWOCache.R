
library(ggplot2)

data2 <- as.data.frame(read.csv(file="D:\\sourcecode\\smart-search-functional-test\\src\\test\\resources\\testSkillsWOCache3.csv", header = T, sep = ",", row.names=NULL))

quantile(data2$responseTime, .95 )
quantile(data2$responseTime, .05 )

data2[,"skill"]<-cut(data2$index, breaks=c(0,5,10, 15, 20), labels=c("1-5", "5-10", "10-15", "15-20"))

ggplot(data=data2,aes(responseTime, group=skill, fill=skill)) +
  coord_cartesian(xlim=c(24, 58)) +
  #geom_histogram(stat = "bin", binwidth=1) +
  ggtitle("Density of Skills Facet Query Without Caching Response Times")+
  geom_density(alpha = 0.7)
  #geom_vline(aes(xintercept=mean(responseTime, responseTime.rm=T)),   # Ignore NA values for mean
            # color="red", linetype="dashed", size=1)
