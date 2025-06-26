# read_GEdata.R

data.name <- "Expression-Genes"

load(paste(mydir.data,"/",data.name,"/gene_expression",my.study," data matrix plus ann.RData",sep="")) # expression data matrix and annotation, 1st col is Probe IDs

# Join the two objects

samples.exp <- colnames(data.exp)[-(1:3)]
exp.vars <- colnames(data.exp)[1:3]

# column ids: ProbeID  chr  Start

sum(samples.snp==samples.exp)   # 19

chr.ch <- as.character(data.exp[,exp.vars[2]])
chr.ch[chr.ch=="X"] <- 23
chr.ch[chr.ch=="Y"] <- 24
data.exp[,exp.vars[2]] <- as.numeric(chr.ch)



