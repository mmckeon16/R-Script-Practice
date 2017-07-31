
library(ggplot2)

data2 <- as.data.frame(read.csv(file="D:\\sourcecode\\smart-search-functional-test\\src\\test\\resources\\testSkillsFacet2.csv", header = T, sep = ",", row.names=NULL))

quantile(data2$responseTime, .95 )
quantile(data2$responseTime, .05 )

boxplot(split(data2$responseTime, data2$batchSize))