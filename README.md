
<!-- README.md is generated from README.Rmd. Please edit that file -->

# BVML

<!-- badges: start -->

<!-- badges: end -->

The goal of BVML is to classify patients from BV disease

## Installation

To install the BVML, install from github using devtools:

``` r
install.packages("devtools")
library(devtools)
devtools::install_github("DiegoFE94/BVML")
```

## Example

This is a basic example which shows you how to use the package:

``` r
library(BVML)
# First charge a demo dataset
data(sample_data)
# Second step: check that we have all needed species and select them
s_data_checked <- check_sps(sample_data)
# Third step: normalise your data
norm_sample_data <- normdataset(s_data_checked)
# Final step: make class prediction
results <- BVClassify(norm_sample_data)
```
