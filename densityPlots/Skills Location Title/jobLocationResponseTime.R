
library(ggplot2)

datatitle <- as.data.frame(read.csv(file="D:\\sourcecode\\smart-search-functional-test\\src\\test\\resources\\testJobLocations3.csv", header = T, sep = ",", row.names=NULL))

quantile(datatitle$responseTime, .95 )
quantile(datatitle$responseTime, .05 )

#datatitle[,"query"]<-cut(datatitle$numOfCandidateSkills, breaks=c(0,1,2), labels=c("skills", "locations"))

ggplot(data=datatitle,aes(responseTime)) +
  ggtitle("Job Location Candidate Query Response Times")+
  #coord_cartesian(xlim=c(21, 50)) +
  #geom_histogram(stat = "bin", binwidth=1) 
  geom_density(alpha = 0.2, fill=5, bw = 1) + scale_x_continuous(limits = c(20,28))