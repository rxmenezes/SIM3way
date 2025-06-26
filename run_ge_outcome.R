# run_ge_outcome.R

my.out <- "gexp"

ymat <- data.exp
yvars <- exp.vars
xmat <- data.snp
xvars <- snp.vars
zmat <- data.meth
zvars <- meth.vars

source("compute_tests.R")

source("plot_pvals_on_genome.R")

source("make_topTables.R")


