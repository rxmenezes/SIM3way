# read_methdata.R

data.name <- "DNA Methylation"

load(paste(mydir.data,"/",data.name,"/data_logit_scale with Ann.RData",sep="")) # data.meth,


samples.meth <- colnames(data.meth)[-(1:3)]
meth.vars <- colnames(data.meth)[1:3]

# column ids:  IlmnID  Chr  MapInfo

sum(samples.snp==samples.meth)  # 19

chr.ch <- as.character(data.meth[,meth.vars[2]])
chr.ch[chr.ch=="X"] <- 23
chr.ch[chr.ch=="Y"] <- 24
data.meth[,meth.vars[2]] <- as.numeric(chr.ch)

