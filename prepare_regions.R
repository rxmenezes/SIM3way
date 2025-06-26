# prepare_regions.R

data(chrom.table)
region.delim <- NULL
mychrs <- c(paste(1:20,"p",sep="")[-(13:15)],paste(1:22,"q",sep=""))
for(xi in mychrs)
{
 chrn <- substr(xi,1,nchar(xi)-1)
 armn <- substr(xi,nchar(xi),nchar(xi))
 mydat <- chrom.table[(as.character(chrom.table$chr)==chrn)&(as.character(chrom.table$arm)==armn),]
 llim <- min(mydat$start)
 ulim <- max(mydat$end)
 region.delim <- rbind(region.delim,c(chrn,armn,llim,ulim))
}

region.delim <- data.frame(region.delim,stringsAsFactors=F)
colnames(region.delim) <- c("chr","arm","start","end")
rownames(region.delim) <- mychrs
region.delim$chr <- as.numeric(region.delim$chr)
region.delim$start <- as.numeric(region.delim$start)
region.delim$end <- as.numeric(region.delim$end)


source("get_data_region.R")

