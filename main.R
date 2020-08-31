library(scRNAseq)
library(SingleCellExperiment)
library(scran)
library(tidyr)
library(dplyr)
library(tercen)

(ctx = tercenCtx())

count_matrix <- ctx$as.matrix()

dec <- trendVar(count_matrix)

variance_pvalues <- testVar(dec$vars, dec$trend(dec$vars), dec$df2)
variance_logged_pvalues <- -log10(variance_pvalues)

output <- tibble(.ri = as.numeric(0:(nrow(count_matrix) - 1)),
                 mean_expression = dec$means,
                 variance = dec$vars,
                 trend = dec$trend(dec$means),
                 variance_pvalues,
                 variance_logged_pvalues,
                 variance_rank = as.numeric(dense_rank(variance))) %>%
  mutate(variance_rank = max(variance_rank) - variance_rank + 1,
         FDR = p.adjust(variance_pvalues))



ctx$addNamespace(output) %>%
  ctx$save()