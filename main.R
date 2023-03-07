suppressPackageStartupMessages(expr = {
  library(Seurat)
  library(tidyr)
  library(dplyr)
  library(tercen)
})

source("./utils.R")

ctx = tercenCtx()

obj <- as_Seurat(ctx)

selection.method <- ctx$op.value("selection.method", as.character, "vst")
nfeatures <- ctx$op.value("nfeatures", as.double, 2000)
loess.span <- ctx$op.value("loess.span", as.double, 0.3)

obj <- FindVariableFeatures(
  obj, 
  selection.method = selection.method,
  loess.span = loess.span,
  nfeatures = nfeatures,
  verbose = FALSE
)

HVFInfo(obj) %>%
  as_tibble() %>%
  rename(dispersion = ends_with("variance"), dispersion.scaled = matches("variance.standardized")) %>%
  mutate(.ri = as.integer(rownames(obj))) %>%
  mutate(
    dispersion_rank = as.double(dense_rank(desc(dispersion))),
    dispersion.scaled_rank = as.double(dense_rank(desc(dispersion.scaled)))
  ) %>%
  ctx$addNamespace() %>%
  ctx$save()
