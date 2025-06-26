# make_topTables.R

# One single table for all chr arms
mypvals <- my.fdr <- my.ann <- NULL
for(xj in mychrs)
  {
  load(paste(mydir.output,"/",effect.name," annotation outcome ",my.out,xj,".RData",sep=""))    # ann.mat
  load(paste(mydir.output,"/",effect.name," all_pvalues outcome ",my.out,xj,".RData",sep=""))   # all.pvals
  mypvals <- rbind(mypvals,all.pvals)
  load(paste(mydir.output,"/",effect.name," all_FDR BH outcome ",my.out,xj,".RData",sep=""))   # fdr.table
  my.fdr <- rbind(my.fdr,fdr.table)
  my.ann <- rbind(my.ann,ann.mat)
  }

fdr.ann <- data.frame(my.ann,my.fdr,check.names=F)
pvals.ann <- data.frame(my.ann,mypvals,check.names=F)
save(fdr.ann,file=paste(mydir.output,"/",effect.name," BHfdr table with annotation outcome ",my.out,".RData",sep=""))
save(pvals.ann,file=paste(mydir.output,"/",effect.name," pvalues table with annotation outcome ",my.out,".RData",sep=""))

write.table(fdr.ann,file=paste(mydir.output,"/",effect.name," BHfdr table with annotation outcome ",my.out,".txt",sep=""),row.names=F,sep="\t")
write.table(pvals.ann,file=paste(mydir.output,"/",effect.name," pvalues table with annotation outcome ",my.out,".txt",sep=""),row.names=F,sep="\t")

# Or a separate table per chr arm

for(xj in mychrs)
  {
  load(paste(mydir.output,"/",effect.name," annotation outcome ",my.out,xj,".RData",sep=""))    # ann.mat
  load(paste(mydir.output,"/",effect.name," all_pvalues outcome ",my.out,xj,".RData",sep=""))   # all.pvals
  pvals <- data.frame(ann.mat,all.pvals)
  load(paste(mydir.output,"/",effect.name," all_FDR BH outcome ",my.out,xj,".RData",sep=""))   # fdr.table
  fdr <- data.frame(ann.mat,fdr.table)
  write.table(pvals,file=paste(mydir.output,"/",effect.name," pvalues table with annotation outcome ",my.out,xj,".txt",sep=""),row.names=F,sep="\t")
  write.table(fdr,file=paste(mydir.output,"/",effect.name," fdr table with annotation outcome ",my.out,xj,".txt",sep=""),row.names=F,sep="\t")
  }
