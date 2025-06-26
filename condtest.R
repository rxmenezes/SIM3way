# condtest.R

# fit Y ~ X using ridge regression (penalized) and get residuals R
# Then: fit R ~ Z using SIM

# NOTE: PENALIZED ASSUMES THAT GENES ARE IN COLUMNS, AND SAMPLES ARE IN ROWS

# ymat is the outcome matrix
# xmat contains the variables for the null model
# zmat contains the additional variables under the alternative model

# first: estimate the value of lambda to be used
source("lambda_est.R")

# then: fit models with lambda(s) estimated and extract residuals

source("get_ridge_residuals.R")


