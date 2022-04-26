library(SingleCellExperiment)
library(scran)
library(tidyr)
library(dplyr)
library(tercen)

ctx <- tercenCtx()

count_matrix <- ctx$as.matrix()

gv <- modelGeneVar(count_matrix)
gv <- as.data.frame(gv)

df_out <- tibble(.ri = as.numeric(0:(nrow(count_matrix) - 1))) %>%
  cbind(gv) %>%
  mutate(variance_rank = as.numeric(dense_rank(p.value)))

df_out %>%
  ctx$addNamespace() %>%
  ctx$save()