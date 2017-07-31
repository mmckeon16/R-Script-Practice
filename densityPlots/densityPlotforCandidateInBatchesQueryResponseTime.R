
library(ggplot2)

dataBatches2 <- as.data.frame(read.csv(file="D:\\sourcecode\\smart-search-functional-test\\src\\test\\resources\\testIndexMillion.csv", header = T, sep = ",", row.names=NULL))
nrow(dataBatches2)

quantile(dataBatches2$responseTime, .95 )
quantile(dataBatches2$responseTime, .05 )

dataBatches2[,"batch"]<-cut(dataBatches2$batchSize, breaks=c(0,20000,40000,60000,80000, 100000), labels=c("1-2", "2-4", "4-6","6-8","8-10"))

ggplot(data=dataBatches2,aes(responseTime, group=batch, fill=batch)) +
  ggtitle("Density of Increasing Batch Size (100000 Candidates)")+
  geom_density() + scale_x_continuous(limits = c(20, 28)) 
