# compute_condTest_h0.R

my.xi <- c(101,151,240)
# To visualize profiles
pdf(paste(mydir.output,"/plots_profL2_standardized",effect.name,".pdf",sep=""),width=10,height=6)
for(xi in 1:length(my.xi))  profL2(ymat[my.xi[xi],] ~ t(xmat), lambda1=0, approximate=T,steps=10,plot=T,minlambda2=0.5,maxlambda2=10000,standardize=T) # use LOOCV
dev.off()
# Computing optimal lambda's for a selection of features from each region
myls <- myp.test <- NULL
for(xi in 1:length(my.xi))
  {
    myls <-      c(myls,      optL2(ymat[my.xi[xi],] ~ t(xmat), lambda1=0, approximate=T,minlambda2=0.5,maxlambda2=10000,standardize=T)$lambda) # use LOOCV
    myp.test <-  c(myp.test,test1gs(ymat[my.xi[xi],],    xmat))
  }
myres.test <- data.frame(my.xi,myls,myp.test)
colnames(myres.test) <- c("features","optimLambda","GTpvalue")
myres.test
# Here check what we get out
#  features optimLambda GTpvalue
#1      101       1e+05    0.558
#2      151       1e+05    0.787
#3      240       1e+05    0.425
# These results are reasonable, as no effect is present in the data, so both lambda
# should be large as the p-values should be not significant

# We fix lambda = 10^3 which from the graphs was large enough

for(xn in s.size)
{
  load(paste(mydir.output,"/xvar_ssize",xn,effect.name,"pX",my.p,".RData",sep="")) # xmat
  load(paste(mydir.output,"/zvar_ssize",xn,effect.name,"pX",my.p,".RData",sep="")) # zmat
  load(paste(mydir.output,"/yvar_ssize",xn,effect.name,"pX",my.p,".RData",sep="")) # ymat
  res.mat <- matrix(0,nrow=nrow(ymat),ncol=ncol(ymat))
  for(xi in 1:nrow(ymat))
  {
#     optl2 <- optL2(ymat[xi,] ~ t(xmat), lambda1=0, approximate=T,minlambda2=0.5,maxlambda2=1000,standardize=T,trace=F)$lambda # use LOOCV
     res.mat[xi,] <- residuals(penalized(ymat[xi,] ~ t(xmat), lambda1=0, lambda2=10^3,standardize=T))
  }
    cond.pvals <- apply(res.mat,1,test1gs,my.x=zmat)
  save(cond.pvals,file=paste(mydir.output,"/cond_pvalues gt ssize ",xn,effect.name,"pX",my.p,".RData",sep=""))
  save(res.mat,file=paste(mydir.output,"/residuals_ridge ssize ",xn,effect.name,"pX",my.p,".RData",sep=""))
}

