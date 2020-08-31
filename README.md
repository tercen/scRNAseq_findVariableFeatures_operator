# scRNA-seq feature selection operator

##### Description
`scRNA-seq feature selection` models the variance of the expression of each gene and outputs the variance and variance-related metrics to perform feature (cell) selection for downstream analysis.

##### Usage

Input projection|.
---|---
`y-axis`              | numeric, normalized count data, per cell 
`column names`        | character, cell ID
`row names`           | character, gene ID

Output relations|
---|---
`mean_expression`         | numeric, mean expression of a gene across all cells 
`variance`                | numeric, variance of expression of a gene across all cells
`trend`                   | numeric, expected variance of a gene given it's expression level
`variance_pvalues`        | numeric, p-value of observed variance
`variance_logged_pvalues` | numeric, minus logged-10 of p-value
`variance_rank`           | numeric, rank of observed variance (1 is highest variance)
`FDR`                     | numeric, False Discovery Rate of observed variance.



##### Details
The operator uses the QC worklfow described in the corresponding chapter of the ["Orchestrating Single-Cell Analysis"](https://osca.bioconductor.org/feature-selection.html) book. For this it uses the _scRNAseq_ BioConductor package.

#### References
Amezquita, et. al. ["Orchestrating single-cell analysis with BioConductor"](https://www.nature.com/articles/s41592-019-0654-x), Nature Methods (2019)

##### See Also

#### Examples