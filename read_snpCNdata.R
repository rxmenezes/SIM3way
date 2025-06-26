# read_snpCNdata.R

data.name <- "SNP"

load(paste(mydir.data,"/",data.name,"/SNP_profiles sources5_matrix nk 30000.RData",sep="")) #  pheno.SNP.uniq

load(paste(mydir.data,"/",data.name,"/data_unique_ann.RData",sep=""))  # data.snp, data and annotation with chr and start

# column ids: SNPid chr start  - samples start in column 4

snp.vars <- colnames(data.snp)[1:3]

samples.snp <- colnames(data.snp)[-(1:3)]

# chr and start need to be numeric

chr.ch <- as.character(data.snp[,snp.vars[2]])
chr.ch[chr.ch=="X"] <- 23
chr.ch[chr.ch=="Y"] <- 24
data.snp[,snp.vars[2]] <- as.numeric(chr.ch)

