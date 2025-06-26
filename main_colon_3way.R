# Here we want to compare p-values obtained with Leila's test statistic for 2 gene sets, X and Z
# with those computed by simply joining the two gene sets into 1 (Melle's approach).
# We apply this model to a colon cancer data set from the TCGA data portal

# Previously I applied this model to a simulation study
# For results, see folder
# "C:/Documents and Settings/Renee Menezes/renee/Projects/integration/CN exp LOH/global test 2 sets/binary1"

mydir <- "C:/Documents and Settings/Renee Menezes/renee/Projects/integration/CN exp LOH/colon TCGA 3way"
mydir.scripts <- paste(mydir,"/scripts",sep="")
mydir.output <- paste(mydir,"/output",sep="")
mydir.data <- "C:/Documents and Settings/Renee Menezes/renee/Projects/integration/colonTCGA/output"

setwd(mydir.scripts)
memory.limit(size=4000)

# left out
#effect.name <- "eff size similar"
#source("simul_3data.R")
# for results with those, see folder "model with cis in 3 cons loci"

source("test1gs.R")   # test for one gene set
source("test2gs.R")   # test for 2 gene sets
library(SIM)
source("prepare_regions.R")
effect.name <- "TCGA colon"
source("read_data.R")
source("functions_wilcoxon_t_logistic_fdr.R")
source("run_ge_outcome.R")

save.image("simulations_and_ROCcurves.RData")

# Up to here I had been running scripts on R 2.12.2
# Conditional test
# This part is running on R 2.14.0
library(penalized)
source("condtest.R")
source("graphs_pvals.R")

# Estimate test sizes, in each case
effect.name <- "h0"
source("compute_tests_sizes.R")

# Old, not tested and not what I now decided to do
#source("testcond.R")
#source("compute_cond_tests.R")  # compute conditional statistics




