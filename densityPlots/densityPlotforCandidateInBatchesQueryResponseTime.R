
library(ggplot2)

dataBatches2 <- as.data.frame(read.csv(file="D:\\sourcecode\\smart-search-functional-test\\src\\test\\resources\\testIndexMillion.csv", header = T, sep = ",", row.names=NULL))
nrow(dataBatches2)

quantile(dataBatches2$responseTime, .95 )
quantile(dataBatches2$responseTime, .05 )

dataBatches2[,"coreSize"]<-cut(dataBatches2$batchSize, breaks=c(0,200000,400000,600000,800000, 1000000), labels=c("1-2", "2-4", "4-6","6-8","8-10"))

ggplot(data=dataBatches2,aes(responseTime, group=coreSize, fill=coreSize)) +
  ggtitle("Density of Response Time for Increasing Core Size")+
  geom_density(bw = 1, alpha = .5) + scale_x_continuous(limits = c(19, 28)) 
