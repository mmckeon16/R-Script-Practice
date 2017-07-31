
library(ggplot2)

data2 <- as.data.frame(read.csv(file="D:\\sourcecode\\smart-search-functional-test\\src\\test\\resources\\testSkillsFacet2.csv", header = T, sep = ",", row.names=NULL))

quantile(data2$responseTime, .95 )
quantile(data2$responseTime, .05 )

#data2[,"batchSize"]<-cut(data2$batchSize, )

ggplot(data=data2,aes(responseTime, fill = batchSize, group=batchSize)) +
  coord_cartesian(xlim=c(0, 50)) +
  #geom_histogram(stat = "bin", binwidth=1) +
  ggtitle("Density of Skills Facet Query Response Times")+
  geom_density(alpha = 0.2, fill=5)
  #geom_vline(aes(xintercept=mean(responseTime, responseTime.rm=T)),   # Ignore NA values for mean
            # color="red", linetype="dashed", size=1)
