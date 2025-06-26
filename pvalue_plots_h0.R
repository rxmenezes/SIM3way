# pvalue_plots.R

  my.loci <- 1:my.n
  my.cols <- rainbow(n.regions,start=0.1,end=0.9)
  my.pchs <- c(0,1,2,6)
  mean.y <- apply(ymat,1,mean)
  mean.x <- apply(xmat,1,mean)
  mean.z <- apply(zmat,1,mean)
  pdf(paste(mydir.output,"/pvalues1_ssize",xn,effect.name,"pX",my.p,".pdf",sep=""),width=10,height=6)
  for(xp in 1:ncol(pvals.mat))
    {
    par(mfrow=c(2,1),mar=c(3,3,3,1))
    plot(my.loci,pvals.mat[,xp],pch=20,col=my.cols,xlab="",ylab="pvalues",main=paste(colnames(pvals.mat)[xp]))
    plot(my.loci,mean.x,pch=3,col=my.cols,xlab="",ylab="",ylim=c(0,max(mean.y)),cex=0.7)
    points(my.loci,mean.y,pch=1,col=my.cols,cex=0.7)
    points(my.loci,mean.z,pch=2,col=my.cols,cex=0.7)
    legend("bottomright",legend=c("Y","X","Z"),pch=c(1,3,2),cex=.5)
    }
  dev.off()
