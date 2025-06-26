# get_ridge_residuals.R

# Note: Y is a matrix, with one row per feature and one column per sample; so
# we need to fit the model per feature, and extract residuals accordingly
# ymat is the outcome matrix
# xmat contains the variables for the null model
# zmat contains the additional variables under the alternative model

for(xn in s.size)
{
  cond.pvals <- NULL
  load(paste(mydir.output,"/xvar_ssize",xn,effect.name,".RData",sep="")) # xmat
  load(paste(mydir.output,"/zvar_ssize",xn,effect.name,".RData",sep="")) # zmat
  load(paste(mydir.output,"/yvar_ssize",xn,effect.name,".RData",sep="")) # ymat
  res.mat <- matrix(0,nrow=nrow(ymat),ncol=ncol(ymat))
#  xzmat <- rbind(xmat,zmat)
  # divide the regions
  for(xj in 1:n.regions)
    {
    my.lims <- region.delim[xj,1:2]
    my.y <- ymat[my.lims[1]:my.lims[2],]
    my.x <- xmat[my.lims[1]:my.lims[2],]
    my.z <- zmat[my.lims[1]:my.lims[2],]
    my.res <- matrix(0,nrow=nrow(my.y),ncol=ncol(my.y))
    for(xi in 1:nrow(my.y))
    {
       optl2 <- optL2(my.y[xi,] ~ t(my.x), lambda1=0, approximate=T,minlambda2=0.5,maxlambda2=1000,standardize=T,trace=F)$lambda # use LOOCV
       my.res[xi,] <- residuals(penalized(my.y[xi,] ~ t(my.x), lambda1=0, lambda2=optl2,standardize=T))
    }
    cond.pvals <- c(cond.pvals, apply(my.res,1,test1gs,my.x=my.z))
    res.mat[my.lims[1]:my.lims[2],] <- my.res
    }
  save(cond.pvals,file=paste(mydir.output,"/cond_pvalues gt ssize ",xn,effect.name," nbases ",my.n,".RData",sep=""))
  save(res.mat,file=paste(mydir.output,"/residuals_ridge ssize ",xn,effect.name," nbases ",my.n,".RData",sep=""))
}
