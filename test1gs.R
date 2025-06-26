# test1gs.R

# This file computes an object with the results of Leila's test for a single gene set
# Here permutations are used to estimate the p-value (number taken is nperm)

# my.y: outcome, here a vector with length n (number of samples)
# my.x: data matrix with p rows and n columns - each row corresponds to a different variable
#     Note: Leila originally thought of my.x as being a matrix with n rows and p columns but,
#           since it appears everywhere in the formulae below as t(x), I changed it around
# nperm: number of permutations of the values of my.y to be considered when computing the p-values
#        This is taken as the minimum between the max number of permutations possible and nperm

#####################
# computing simply the test statistic of the global test
sfunc1<-function(o,x,m)
{
rowSums((o %*% m %*% crossprod(x) %*% m )*o)/rowSums((o %*% m)*o)
}

#####################
# test statistic calculation and p-values using permutations
# gives back only p-value
test1gs <- function(my.y,my.x,nperm=1000)
{
n <- length(my.y)
nperm <- min(factorial(n),nperm)
perm.y <- replicate(nperm, my.y[sample(n)])
M <- diag(n) - matrix(1/n, n, n)

# originally this formulae had my.x %*% t(M) %*% M within the parenthesis, but M being symmetric simplifies things
# also M is idempotent, so M %*% M = M
norm.const <- sum( (my.x %*% M) * my.x)/100

# Observed test statistic
S<-sfunc1(t(my.y),my.x,M)
# Test statistic applied to each permutation of the elemensts of Y
permS <- apply(t(perm.y),1,sfunc1,x=my.x,m=M)
# source("mean_var_S.R")
# calculate the p-value
p.value <- mean(permS-S>=0)#mean(S <= permS)
# give back
p.value
}

#####################
# test statistic calculation and p-values using permutations
# gives back both test statistic and p-value
test1gs.tp <- function(my.y,my.x,nperm=1000)
{
n <- length(my.y)
nperm <- min(factorial(n),nperm)
perm.y <- replicate(nperm, my.y[sample(n)])
M <- diag(n) - matrix(1/n, n, n)

# originally this formulae had my.x %*% t(M) %*% M within the parenthesis, but M being symmetric simplifies things
norm.const <- sum( (my.x %*% M) * my.x)/100

# Observed test statistic
S<-sfunc1(my.x,t(my.y))
# Test statistic applied to each permutation of the elemensts of Y
permS<-sfunc1(my.x,t(perm.y))
  # mean and variance of S for z-score
ES <- mean(permS)
VarS <- var(permS)

# repair for case all(X == 0)
if (norm.const == 0)
  norm.const <- 1

# calculate the p-value
p.value <- mean(permS-S>=0)#mean(S <= permS)
# give back
c(S,p.value)
}


