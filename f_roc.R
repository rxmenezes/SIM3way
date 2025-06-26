# Function to make ROC curves for a matrix of p-values, one column per test type, one row per feature
#
# Inputs:
#     pvmat =  matrix of p-values, one column per test type, one row per feature
#     effectv = binary vector indicating which featues do (value=0) or do not follow the null hypothesis (value=1)
#     myname = string to be added to the title
f.roc <- function(pvmat,effectv,myname)
{
  x.p <- seq(0,1,by=0.001)
  sens.all <- pow.all <- matrix(0,nrow=length(x.p),ncol=ncol(pvmat))
  p.eff <- pvmat[which(effectv==1),]
  p.null <- pvmat[which(effectv==0),]
  for(xu in 1:length(x.p))
  {
   sens.all[xu,] <- apply(p.null<=x.p[xu],2,sum)/sum(1-effectv)
   pow.all[xu,] <- apply(p.eff<=x.p[xu],2,sum)/sum(effectv)
  }
  mycols <- rainbow(ncol(pvmat),start=0.1,end=0.9)
  plot(sens.all[,1],pow.all[,1],pch=20,col=mycols[1],main=paste("ROC curves",myname),xlab="Sensitivity",ylab="1-specificity",xlim=c(0,1),ylim=c(0,1))
  for(xj in 2:ncol(pvals.mat)) points(sens.all[,xj],pow.all[,xj],pch=20,col=mycols[xj])
  segments(0,0,1,1,lty="dotted",col="black")
  legend("bottomright",legend=colnames(pvmat),pch=20,col=mycols)
}
