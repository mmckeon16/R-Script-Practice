
library(ggplot2)

data2 <- as.data.frame(read.csv(file="D:\\sourcecode\\smart-search-functional-test\\src\\test\\resources\\testFacetsSkillsWCache.csv", header = T, sep = ",", row.names=NULL))

quantile(data2$responseTime, .95 )
quantile(data2$responseTime, .05 )

data2[,"skills"]<-cut(data2$index, breaks=c(0,5,10,15,20), labels=c("1-5", "5-10", "10-15","15-20"))

ggplot(data=data2,aes(responseTime, fill = skills, group=skills)) +
  ggtitle("Density of Multi Skills Query Response Times W Cache")+
  geom_density(alpha = 0.2) + scale_x_continuous(limits = c(20, 32)) 