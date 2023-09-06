library(ggplot2)

n = 21
theta = .524
pmf_theta = dbinom(0 : n, n, theta)
cbind(0 : 21, pmf_theta)

ggplot(data.frame(thetahathat = as.factor(round((0 : n) / n, 4)), pmf_theta = pmf_theta)) + 
  geom_bar(aes(x = thetahathat, y = pmf_theta), stat = "identity")
