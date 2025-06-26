# compute_tests_sizes.R

# Simulate data for 1 chr, 1000 probes, under H0
# compute all tests p-values, then count how many are less than alpha for many alpha values

source("simul_data_h0.R")

source("compute_pvals_h0.R")

source("compute_condTest_h0.R")

source("graphs_pvals_h0.R")

# Do the ridge regression residuals of fitting Y = X beta  + error have zero mean?

pdf(paste(mydir.output,"/residuals_hist",effect.name,"ssize",xn,".pdf",sep=""),width=10,height=6)
hist(apply(res.mat,1,mean),main="Residuals mean after fitting first model")
dev.off()





