library(scRNAseq)
library(SingleCellExperiment)
library(scran)
library(tidyr)
library(dplyr)
library(tercen)

options("tercen.workflowId" = "7d6077b7fa4df6315a718714de00346e")
options("tercen.stepId"     = "e8df35d9-2f50-45e0-a192-671c49c34418")

getOption("tercen.workflowId")
getOption("tercen.stepId")

(ctx = tercenCtx())

count_matrix <- ctx$as.matrix()

dec <- trendVar(count_matrix)

output <- tibble(.ri = 0:(nrow(count_matrix) - 1),
                 mean_expression = dec$means,
                 variance = dec$vars,
                 trend = dec$trend(dec$means))

ctx$addNamespace(output) %>%
  ctx$save()
