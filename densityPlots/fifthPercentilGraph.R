
library(ggplot2)

data2 <- read.csv(file="D:\\sourcecode\\smart-search-functional-test\\src\\test\\resources\\testSkillsGraphing.csv", header = T, sep = ",", row.names=NULL,
                  stringsAsFactors = FALSE)
#sorted <- data2[order(rtime),]

max(data2$responseTime)

outliers<- data2[data2$responseTime > quantile(data2$responseTime, probs = c(.95)), ]



ggplot(data=outliers,aes(responseTime, fill = batchSize, group=batchSize)) +
  #coord_cartesian(xlim=c(0, 50)) +
  #geom_histogram(stat = "bin", binwidth=1) +
  ggtitle("5% Outliers Skills Candidate Query Response Times")+
  geom_density()