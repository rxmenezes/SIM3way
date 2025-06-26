# run_SIM.R

dep.data <- cbind(my.ann,cn.data)
indep.data <- cbind(my.ann,exp.data)
ann.cols <- c("Probe IDs", "Chr","chrloc")

assemble.data(dep.data = dep.data, indep.data = indep.data, dep.ann = ann.cols, indep.ann = ann.cols,
          dep.id = ann.cols[1], dep.chr = ann.cols[2], dep.pos = ann.cols[3],
          indep.id = ann.cols[1], indep.chr = ann.cols[2], indep.pos = ann.cols[3],  overwrite=T, run.name = sim.run.name)

integrated.analysis(samples = colnames(cn.data), input.regions = "1", zscores=F, method="full", run.name = sim.run.name)

# Result

sim.pvals[,xk] <- dget(paste(mydir.scripts,"/",sim.run.name,"/full/gpvals.pat.c.1",sep=""))

