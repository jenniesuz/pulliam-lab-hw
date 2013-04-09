# wrapper
# parse CL args, pass file names to script function

colnames <- 'parsedfromargs'
colvals <- 'parsedfromotherargs'

source('./colReader.R')

res <- colReader(colnames, colvals)