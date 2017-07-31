library(ggplot2)

data <- read.csv(file="D:\\sourcecode\\smart-search-functional-test\\src\\test\\resources\\testHistGraphing.csv", header = T, sep = ",", row.names=NULL)
p2 <- ggplot(data=data, aes(x = responseTime, colour = numOfCandidateSkills))
p2 + geom_histogram(stat = "bin", binwidth=10)+
  geom_density()

