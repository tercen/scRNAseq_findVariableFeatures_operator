# scRNA-seq feature selection

##### Description

`scRNA-seq feature selection` models the variance of the expression of each gene and outputs the variance and variance-related metrics to perform feature (cell) selection for downstream analysis.

##### Usage

Input projection|.
---|---
`y-axis`              | numeric, normalized count data, per cell 
`columns`        | character, cell ID
`rows`           | character, gene ID

Output relations|.
---|---
`mean`         | numeric, mean expression of a gene across all cells 
`dispersion`                | numeric, variance of expression of a gene across all cells
`dispersion.scaled`                   | numeric, scaled variance or dispersion values
`dispersion_rank`           | numeric, rank of observed variance (1 is highest variance)
`dispersion.scaled_rank`           | numeric, rank of observed scaled variance (1 is highest variance)


##### Details

The operator uses the `Seurat` R package and the preprocessing workflow described in the ["package website"](https://satijalab.org/seurat/).

##### References

> Hao, Y., Hao, S., Andersen-Nissen, E., Mauck, W. M., Zheng, S., Butler, A., ... & Satija, R. (2021). Integrated analysis of multimodal single-cell data. Cell, 184(13), 3573-3587.

[Link to Seurat reference](https://doi.org/10.1016/j.cell.2021.04.048)
