# test2gs.R
# This file computes an object with the results of Leila's test for two gene sets
# Here permutations are used to estimate the p-value (number taken is nperm)

# my.y: outcome, here a vector with length n (number of samples)
# my.x: data matrix with p rows and n columns - each row corresponds to a different variable
#     Note: Leila originally thought of my.x as being a matrix with n rows and p columns but,
#           since it appears everywhere in the formulae below as t(x), I changed it around
# my.z: data matrix with q rows and n columns
# nperm: number of permutations of the values of my.y to be considered when computing the p-values
#        This is taken as the minimum between the max number of permutations possible and nperm

test2gs <- function(my.y,my.x,my.z, nperm=1000)
{
n <- length(my.y)
nperm <- min(factorial(n),nperm)
perm.y <- replicate(nperm, my.y[sample(n)])
M <- diag(n) - matrix(1/n, n, n)
# M as computed here is a projection operator, and thus idempotent
# originally this formulae had my.x %*% t(M) %*% M within the parenthesis, but M being symmetric simplifies things
nc.x <- sum( (my.x %*% M ) * my.x)/100
nc.z <- sum( (my.z %*% M ) * my.z)/100
t.x <- sfunc1(t(my.y),my.x,m=M) #* nc.x
t.z <- sfunc1(t(my.y),my.z,m=M) #* nc.z
# Test statistic applied to each permutation of the elemensts of Y
s.perm.x <- sfunc1( t(perm.y), my.x,m=M)
s.perm.z <- sfunc1( t(perm.y), my.z,m=M)
# Correlation and test statistic
rho12=cor(s.perm.x,s.perm.z)
test.xz<-sqrt((t.x^2+t.z^2-2*t.x*t.z*rho12)/(1-rho12^2))
# Under the null hypothesis - using permutations
test.perm= sqrt((s.perm.x^2 +s.perm.z^2 -2*s.perm.x*s.perm.z*rho12)/(1-rho12^2))
p.t1 <- mean(test.xz <= test.perm)

# Two other test statistics to compute
t2 <- t.x + t.z
p.t2 <- mean(t2 <= (s.perm.x+s.perm.z) )
t3 <- sqrt( t.x^2 + t.z^2)
p.t3 <- mean( t3 <= sqrt(s.perm.x^2 + s.perm.z^2) )
# give back
#res.mat <- matrix(c(test.xz,p.t1,t2,p.t2,t3,p.t3),nrow=3,ncol=2)
res.mat <- c(p.t1,p.t2,p.t3)
res.mat
}


# M as computed here is a projection operator, and thus idempotent
# originally this formulae had my.x %*% t(M) %*% M within the parenthesis, but M being symmetric simplifies things
# Below the formulae with M %*% M, which is now simplified due to it being idempotent
#nc.x <- sum( (my.x %*% M %*% M) * my.x)/100
#nc.z <- sum( (my.z %*% M %*% M) * my.z)/100
