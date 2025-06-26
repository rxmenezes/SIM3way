# plot_pvals_on_genome.R

for(xj in mychrs)
  {
  load(paste(mydir.output,"/",effect.name," all_pvalues outcome ",my.out,xj,".RData",sep=""))   # all.pvals
  fdr.table <- matrix(0,nrow=nrow(all.pvals),ncol=ncol(all.pvals))
  pdf(paste(mydir.output,"/",effect.name," pvalue plots BY 3-way outcome ",my.out," chr",xj,".pdf",sep=""),width=10,height=6)
  for(xi in 1:ncol(all.pvals)) fdr.table[,xi] <- adj.byfdr(all.pvals[,xi],colnames(all.pvals)[xi],0.10)
  dev.off()
  colnames(fdr.table) <- colnames(all.pvals)
  save(fdr.table,file=paste(mydir.output,"/",effect.name," all_FDR BY outcome ",my.out,xj,".RData",sep=""))
  }

for(xj in mychrs)
  {
  load(paste(mydir.output,"/",effect.name," all_pvalues outcome ",my.out,xj,".RData",sep=""))   # all.pvals
  fdr.table <- matrix(0,nrow=nrow(all.pvals),ncol=ncol(all.pvals))
  pdf(paste(mydir.output,"/",effect.name," pvalue plots BH 3-way outcome ",my.out," chr",xj,".pdf",sep=""),width=10,height=6)
  for(xi in 1:ncol(all.pvals)) fdr.table[,xi] <- adj.bhfdr(all.pvals[,xi],colnames(all.pvals)[xi],0.10)
  dev.off()
  colnames(fdr.table) <- colnames(all.pvals)
  save(fdr.table,file=paste(mydir.output,"/",effect.name," all_FDR BH outcome ",my.out,xj,".RData",sep=""))
  }

# Below we use BH instead of BY, as the outcome being gene expression leads to little association between tests
  mycols <- rainbow(ncol(fdr.table),start=0.1,end=0.9)
pdf(paste(mydir.output,"/",effect.name," pvalues on region BH 3-way outcome ",my.out,".pdf",sep=""),width=10,height=6)
for(xj in mychrs)
  {
  load(paste(mydir.output,"/",effect.name," annotation outcome ",my.out,xj,".RData",sep=""))    # ann.mat
  load(paste(mydir.output,"/",effect.name," all_FDR BH outcome ",my.out,xj,".RData",sep=""))   # fdr.table
  plot(ann.mat[,3]/10^6,fdr.table[,1],pch=20,col=mycols[1],main=paste("Associations for",my.out," with Meth and CN, ",xj),xlab="location (Mb)",ylab="BH-FDR",ylim=c(0,1))
  for(xi in 2:ncol(fdr.table)) points(ann.mat[,3]/10^6,fdr.table[,xi],pch=20,col=mycols[xi])
  legend("bottomright",legend=colnames(fdr.table),pch=20,col=mycols,cex=0.7)
  }
dev.off()

my.pch=c(1,2,4,6) # 1=open circle, 2=triangle up, 3=cross, 4=x, 6=triangle down

pdf(paste(mydir.output,"/",effect.name," pvalues on region BH 3-way outcome ",my.out,"other pch.pdf",sep=""),width=10,height=6)
for(xj in mychrs)
  {
  load(paste(mydir.output,"/",effect.name," annotation outcome ",my.out,xj,".RData",sep=""))    # ann.mat
  load(paste(mydir.output,"/",effect.name," all_FDR BH outcome ",my.out,xj,".RData",sep=""))   # fdr.table
  plot(ann.mat[,3]/10^6,fdr.table[,1],pch=my.pch[1],cex=.7,col=mycols[1],main=paste("Associations for",my.out," with Meth and CN, ",xj),xlab="location (Mb)",ylab="BH-FDR",ylim=c(0,1))
  for(xi in 2:ncol(fdr.table)) points(ann.mat[,3]/10^6,fdr.table[,xi],pch=my.pch[xi],col=mycols[xi],cex=.7)
  legend("bottomright",legend=colnames(fdr.table),pch=my.pch,col=mycols,cex=0.7)
  }
dev.off()

my.pch=c(0,5,3,4) # 0=square, 5=losange, 1=open circle, 2=triangle up, 3=cross, 4=x, 6=triangle down

pdf(paste(mydir.output,"/",effect.name," pvalues on region BH 3-way outcome ",my.out,"other pch2.pdf",sep=""),width=10,height=6)
for(xj in mychrs)
  {
  load(paste(mydir.output,"/",effect.name," annotation outcome ",my.out,xj,".RData",sep=""))    # ann.mat
  load(paste(mydir.output,"/",effect.name," all_FDR BH outcome ",my.out,xj,".RData",sep=""))   # fdr.table
  plot(ann.mat[,3]/10^6,fdr.table[,1],pch=my.pch[1],cex=.7,col=mycols[1],main=paste("Associations for",my.out," with Meth and CN, ",xj),xlab="location (Mb)",ylab="BH-FDR",ylim=c(0,1))
  for(xi in 2:ncol(fdr.table)) points(ann.mat[,3]/10^6,fdr.table[,xi],pch=my.pch[xi],col=mycols[xi],cex=.7)
  legend("bottomright",legend=colnames(fdr.table),pch=my.pch,col=mycols,cex=0.7)
  }
dev.off()

my.pch=c(3,4,0,5) # 0=square, 5=losange, 1=open circle, 2=triangle up, 3=cross, 4=x, 6=triangle down

pdf(paste(mydir.output,"/",effect.name," pvalues on region BH 3-way outcome ",my.out,"other pch3.pdf",sep=""),width=10,height=6)
for(xj in mychrs)
  {
  load(paste(mydir.output,"/",effect.name," annotation outcome ",my.out,xj,".RData",sep=""))    # ann.mat
  load(paste(mydir.output,"/",effect.name," all_FDR BH outcome ",my.out,xj,".RData",sep=""))   # fdr.table
  plot(ann.mat[,3]/10^6,fdr.table[,1],pch=my.pch[1],cex=.7,col=mycols[1],main=paste("Associations for",my.out," with Meth and CN, ",xj),xlab="location (Mb)",ylab="BH-FDR",ylim=c(0,1))
  for(xi in 2:ncol(fdr.table)) points(ann.mat[,3]/10^6,fdr.table[,xi],pch=my.pch[xi],col=mycols[xi],cex=.7)
  legend("bottomright",legend=colnames(fdr.table),pch=my.pch,col=mycols,cex=0.7)
  }
dev.off()


mypvals <- my.fdr <- NULL
for(xj in mychrs)
  {
  load(paste(mydir.output,"/",effect.name," all_pvalues outcome ",my.out,xj,".RData",sep=""))   # all.pvals
  mypvals <- rbind(mypvals,all.pvals)
  load(paste(mydir.output,"/",effect.name," all_FDR BH outcome ",my.out,xj,".RData",sep=""))   # fdr.table
  my.fdr <- rbind(my.fdr,fdr.table)
  }

pdf(paste(mydir.output,"/",effect.name," pvalues scatterplot 3-way outcome ",my.out,"other pch.pdf",sep=""),width=10,height=6)
plot(mypvals[,2],mypvals[,1],pch=20,cex=.5,col=mycols[1],main=paste("Raw p-values for",my.out,"outcome, with Meth and CN"),xlab=paste(colnames(mypvals)[2]),ylab="p-values alternative test",ylim=c(0,1))
for(xi in 3:ncol(mypvals)) points(mypvals[,2],mypvals[,xi],pch=20,col=mycols[xi],cex=.5)
legend("bottomright",legend=colnames(mypvals)[-2],pch=20,col=mycols[-2],cex=0.5)
dev.off()
pdf(paste(mydir.output,"/",effect.name," -log pvalues scatterplot 3-way outcome ",my.out,"other pch.pdf",sep=""),width=10,height=6)
for(xi in (1:4)[-2])
  {
    plot(-log(mypvals[,2]),-log(mypvals[,xi]),pch=20,cex=.5,col=mycols[xi],main=paste("Raw -log p-values for",my.out,"outcome, with Meth and CN"),xlab=paste(colnames(mypvals)[2]),ylab=paste(colnames(mypvals)[xi]))
    segments(0,0,10,10,lty="dashed",col="gray")
  }
dev.off()

pdf(paste(mydir.output,"/",effect.name," BH FDR scatterplot 3-way outcome ",my.out,"other pch.pdf",sep=""),width=10,height=6)
plot(my.fdr[,2],my.fdr[,1],pch=20,cex=.5,col=mycols[1],main=paste("BH-FDR for",my.out,"outcome, with Meth and CN"),xlab=paste(colnames(my.fdr)[2]),ylab="p-values alternative test",ylim=c(0,1))
for(xi in 3:ncol(my.fdr)) points(my.fdr[,2],my.fdr[,xi],pch=20,col=mycols[xi],cex=.5)
legend("bottomright",legend=colnames(my.fdr)[-2],pch=20,col=mycols[-2],cex=0.5)
dev.off()
