# compute_tests.R

# Tests I wish to compute
# Leila's test - consider separate test statistics and their association
#            HOWEVER: note that she evaluates the correlation under the null hypothesis!
# SIM's test: join the two together (like the sum) - melle's test
# association between test stat for Y ~ Z, per value of X (look at differences between test statistics)


zmat.new <- zmat
names(zmat.new) <- names(xmat)
xzmat <- rbind(xmat,zmat.new)
# divide the regions
for(xj in mychrs)
  {
  my.y <- get.data.region(ymat,yvars,region.delim,xj)
  my.x <- get.data.region(xmat,xvars,region.delim,xj)
  my.z <- get.data.region(zmat,zvars,region.delim,xj)
  my.xz <- get.data.region(xzmat,xvars,region.delim,xj)
  ann.mat <- get.data.ann(ymat,yvars,region.delim,xj)
  pvals1 <- apply(my.y,1,test1gs,my.x=my.xz)
  pvals2 <- apply(my.y,1,test2gs,my.x=my.x,my.z=my.z)
  all.pvals <- cbind(pvals1, matrix(pvals2,nrow=nrow(my.y),byrow=T))
  colnames(all.pvals) <- c("GT.XZ.Melle","GT2geneSets","SumGT1geneSet","SumGT1geneSetSq")
  save(ann.mat,file=paste(mydir.output,"/",effect.name," annotation outcome ",my.out,xj,".RData",sep=""))
  save(all.pvals,file=paste(mydir.output,"/",effect.name," all_pvalues outcome ",my.out,xj,".RData",sep=""))
  }




