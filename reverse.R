# writes test files
colHeads <- c("Name","DD","MM","YYYY")
colTypes <- c("character64","integer","integer","integer")

textdata <- file("./testHeads.o",open="w")
writeLines(paste(colHeads,collapse=" "),con=textdata)
writeLines(paste(colTypes,collapse=" "),con=textdata)
close(textdata)

bindata <- file("./testbin.o","wb")
for (tar in c('Carl A. B. Pearson','Juliet R. C. Pulliam','Theodore Bones')) {
  writeChar(c(rep(' ',64-nchar(tar)),strsplit(tar,split=''),recursive=T),con=bindata,nchar=rep(1,64),eos=NULL)
  writeBin(sample(1:31,size=1), bindata)
  writeBin(sample(1:12,size=1), bindata)
  writeBin(sample(1970:2013,size=1), bindata)
}
close(bindata)

bindata <- file("./testbin.o","rb")
readChar(bindata,nchars=64)
readBin(bindata,integer(),1)
readBin(bindata,integer(),1)
readBin(bindata,integer(),1)
close(bindata)