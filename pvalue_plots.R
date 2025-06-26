# pvalue_plots.R

  my.loci <- 1:my.n
  my.cols <- rainbow(n.regions,start=0.1,end=0.9)
  my.colsv <- rep(my.cols,each=my.r*2)
  my.pchs <- c(0,1,2,6)
  mean.y <- apply(ymat,1,mean)
  mean.x <- apply(xmat,1,mean)
  mean.z <- apply(zmat,1,mean)
  pdf(paste(mydir.output,"/pvalues1_ssize",xn,effect.name,".pdf",sep=""),width=10,height=6)
  for(xp in 1:ncol(pvals.mat))
    {
    par(mfrow=c(2,1),mar=c(3,3,3,1))
    plot(my.loci,pvals.mat[,xp],pch=20,col=my.colsv,xlab="",ylab="pvalues",main=paste(colnames(pvals.mat)[xp]))
    plot(my.loci,mean.x,pch=3,col=my.colsv,xlab="",ylab="",ylim=c(0,max(mean.y)),cex=0.7)
    points(my.loci,mean.y,pch=1,col=my.colsv,cex=0.7)
    points(my.loci,mean.z,pch=2,col=my.colsv,cex=0.7)
    legend("bottomright",legend=c("Y","X","Z"),pch=c(1,3,2),cex=.5)
    }
    par(mfrow=c(1,1),mar=c(5,4,4,2)+0.1)
   plot(my.loci,pvals.mat[,1],pch=my.pchs[1],col=my.colsv,xlab="loci",ylab="pvalues",main="P-values computed",cex=0.7)
   for(xp in 2:ncol(pvals.mat))
    {
    points(my.loci,pvals.mat[,xp],pch=my.pchs[xp],col=my.colsv,xlab="loci",ylab="pvalues",main=paste(colnames(pvals.mat)[xp]),cex=0.7)
    }
    for(xi in (1:ncol(pvals.mat))[-2])
    {
    plot(pvals.mat[,2],pvals.mat[,xi],pch=20,col="blue",xlab=paste(colnames(pvals.mat)[2]),ylab=paste(colnames(pvals.mat)[xi]),main="Comparison of p-values")
    segments(0,0,1,1,lty="dotted",col="gray")
    }
    for(xi in (1:ncol(pvals.mat))[-2])
    {
    plot(-log(pvals.mat[,2]),-log(pvals.mat[,xi]),pch=20,col="blue",xlab=paste(colnames(pvals.mat)[2]),ylab=paste(colnames(pvals.mat)[xi]),main="Comparison of -log p-values")
    segments(0,0,8,8,lty="dotted",col="gray")
    }
  dev.off()
