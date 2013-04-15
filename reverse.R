# writes test files
colHeads <- c("Name","DoB")
colTypes <- c("char64","date")

textdata <- file("./testHeads.o",open="w")
writeLines(paste(colHeads,collapse=" "),con=textdata)
writeLines(paste(colTypes,collapse=" "),con=textdata)
close(textdata)