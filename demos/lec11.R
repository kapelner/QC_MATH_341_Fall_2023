#which has more power? The theta_shared? Or the standard 2-prop z test?

set.seed(1)
theta_1 = 0.25
theta_2 = 0.27
n1 = 500
n2 = 500
Nsim = 1e6

rejections_shared = array(NA, Nsim)
rejections_standard = array(NA, Nsim)
for (nsim in 1 : Nsim){
  sum_x1 = rbinom(1, n1, theta_1)
  xbar1 =  sum_x1 / n1
  sum_x2 = rbinom(1, n2, theta_2)
  xbar2 = sum_x2 / n2
  thetahat_s = (sum_x1 + sum_x2) / (n1 + n2)
  xbar_diff = xbar1 - xbar2
  z_shared = xbar_diff / (sqrt(1 / n1 + 1 / n2) * sqrt(thetahat_s * (1 - thetahat_s)))
  z_standard = xbar_diff / sqrt(xbar1 * (1 - xbar1) / n1 + xbar2 * (1 - xbar2) / n2)
  rejections_shared[nsim] = abs(z_shared) > 1.96
  rejections_standard[nsim] = abs(z_standard) > 1.96
}
mean(rejections_shared, na.rm = TRUE)
mean(rejections_standard, na.rm = TRUE)
