# graphs_pvals.R
# Here we make graphs of the p-values, and plot also the mean of x, z and y per locus

for(xn in s.size)
{
  load(paste(mydir.output,"/xvar_ssize",xn,effect.name,"pX",my.p,".RData",sep="")) # xmat
  load(paste(mydir.output,"/zvar_ssize",xn,effect.name,"pX",my.p,".RData",sep="")) # zmat
  load(paste(mydir.output,"/yvar_ssize",xn,effect.name,"pX",my.p,".RData",sep="")) # ymat
  load(paste(mydir.output,"/all_pvalues melle ssize ",xn,effect.name,"pX",my.p,".RData",sep="")) # all.pvals1
  load(paste(mydir.output,"/all_pvalues leilaNullCorr ssize ",xn,effect.name,"pX",my.p,".RData",sep=""))  # all.pvals2
  load(paste(mydir.output,"/cond_pvalues gt ssize ",xn,effect.name,"pX",my.p,".RData",sep="")) # cond.pvals
  # all.pvals1 is a vector containing the p-values for the test statistic considering X,Z as forming a single gene set (Melle)
  # all.pvals2 is a vector containing 3 sorts of p-values  (Leila's with correlation, X+Z and X2+Z2, the latter the most similar to Leila's)
  # we reshape the vector to extract the separate p-values
  # cond.pvals is a vector containing tests for conditional effect of z, given x
  pvals2.mat <- matrix(all.pvals2,nrow=my.n,ncol=3,byrow=T)
  pvals.mat <- cbind(all.pvals1,pvals2.mat,cond.pvals)
  colnames(pvals.mat) <- c("jointXZ","XZapart","XplusZ","XsqPlusZsq","ZgivenX")
  source("pvalue_plots_h0.R")
  source(paste(mydir.scripts,"/plot_sizes.R",sep=""))
}

