# compute_pvals_h0.R

for(xn in s.size)
{
  load(paste(mydir.output,"/xvar_ssize",xn,effect.name,"pX",my.p,".RData",sep="")) # xmat
  load(paste(mydir.output,"/zvar_ssize",xn,effect.name,"pX",my.p,".RData",sep="")) # zmat
  load(paste(mydir.output,"/yvar_ssize",xn,effect.name,"pX",my.p,".RData",sep="")) # ymat
  xzmat <- rbind(xmat,zmat)
  all.pvals1 <- apply(ymat,1,test1gs,my.x=xzmat)
  all.pvals2 <- apply(ymat,1,test2gs,my.x=xmat,my.z=zmat)
  save(all.pvals1,file=paste(mydir.output,"/all_pvalues melle ssize ",xn,effect.name,"pX",my.p,".RData",sep=""))
  save(all.pvals2,file=paste(mydir.output,"/all_pvalues leilaNullCorr ssize ",xn,effect.name,"pX",my.p,".RData",sep=""))
}

