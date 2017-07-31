
library(ggplot2)

data2 <- as.data.frame(read.csv(file="D:\\sourcecode\\smart-search-functional-test\\src\\test\\resources\\testGraphing.csv", header = T, sep = ",", row.names=NULL))

quantile(data2$responseTime, .975 )
quantile(data2$responseTime, .025 )

ggplot(data=data2,aes(responseTime)) +
  ggtitle("Density of JobTitle Candidate Query Response Times")+
  geom_density(alpha = 0.2) + scale_x_continuous(limits = c(20, 50.4)) 