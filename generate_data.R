# generate data
N <- 10

source('simul_functions.R')

xx <- replicate(N, simul_data(), simplify = FALSE)
datadirs <- file.path('in', seq.int(0,N-1))
deleteme <- sapply(datadirs, dir.create, recursive = TRUE)
deleteme <- mapply(saveRDS, xx, file.path(datadirs, 'data.rds'))
