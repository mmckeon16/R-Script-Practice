library(ggplot2)
data <- read.csv(file="D:\\sourcecode\\smart-search-functional-test\\src\\test\\resources\\testHistGraphing.csv", header = T, sep = ",", row.names=NULL)

quantile(data$responseTime, .95 )
quantile(data$responseTime, .05 )

ggplot(data[data$numOfCandidateSkills == "1", ],
       aes(x = responseTime, colour = numOfCandidateSkills)) +
  coord_cartesian(xlim=c(117, 136)) +
  geom_histogram(stat = "bin", binwidth=1, aes(fill=..count..)) +
  geom_density(alpha = 0.1, col=3) +
  geom_vline(aes(xintercept=mean(responseTime, responseTime.rm=T)),   # Ignore NA values for mean
             color="red", linetype="dashed", size=1)