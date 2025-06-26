get.data.region <- function(mydata,myvars,r.delim,myregion)
{
  mydel <- r.delim[myregion,]
  dat.chr <- mydata[ (mydata[,myvars[2]]==as.numeric(mydel[1]))&(mydata[,myvars[3]]>=as.numeric(mydel[3]))
                                                               &(mydata[,myvars[3]]<=as.numeric(mydel[4])) ,]
  as.matrix(dat.chr[,-(1:3)])
}

get.data.ann <- function(mydata,myvars,r.delim,myregion)
{
  mydel <- r.delim[myregion,]
  dat.chr <- mydata[ (mydata[,myvars[2]]==as.numeric(mydel[1]))&(mydata[,myvars[3]]>=as.numeric(mydel[3]))
                                                               &(mydata[,myvars[3]]<=as.numeric(mydel[4])) ,]
  dat.chr[,1:3]
}



                                                               
                                                               