# generate data
N <- 10000

library(dplyr)
source('simul_functions.R')

datadirs <- 'in'

dir.create(datadirs, showWarnings=FALSE)
xx <- replicate(N, simul_data(H0=TRUE), simplify = FALSE)
for (i in seq.int(N)) {
  saveRDS(xx[[i]], paste0(datadirs,'/data_true_', i, '.rds'))
}
rm(xx)
xx <- replicate(N, simul_data(H0=FALSE), simplify = FALSE)
for (i in seq.int(N)) {
	saveRDS(xx[[i]], paste0(datadirs,'/data_false_', i, '.rds'))
}
