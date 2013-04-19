# writes test files
colHeads <- c("Name","DD-MM-YYYY","Classy?","Scores")
colTypes <- c("character32","integer3","logical","numeric5")

textdata <- file("./testHeads.o",open="w")
writeLines(paste(colHeads,collapse=" "),con=textdata)
writeLines(paste(colTypes,collapse=" "),con=textdata)
close(textdata)
charWid<-32
people <- c('CAB Pearson','JRC Pulliam','Theodore Bones','J Lord','J Rowland','O Saucedo','B Dhar','L Trimmer-Smith','B Borgert','D Hayman')
bindata <- file("./testbin.o","wb")
for (x in 1:length(people)) {
  tar<-people[x]
  writeChar(c(rep(' ',charWid-nchar(tar)),strsplit(tar,split=''),recursive=T),con=bindata,nchar=rep(1,charWid),eos=NULL)
  writeBin(sample(1:31,size=1), bindata)
  writeBin(sample(1:12,size=1), bindata)
  writeBin(sample(1970:2013,size=1), bindata)
  writeBin(runif(1)<0.5,bindata)
  writeBin(runif(5),bindata)
}
close(bindata)

bindata <- file("./testbin.o","rb")
for (x in 1:length(people)) {
  print(readChar(bindata,nchars=charWid))
  print(readBin(bindata,integer(),3))
  print(readBin(bindata,logical(),1))
  print(readBin(bindata,numeric(),5))
}
close(bindata)