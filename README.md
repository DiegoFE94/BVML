
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

This is a basic example which shows you how to solve a common problem:

``` r
library(BVML)

data(sample_data)

norm_sample_data <- normdataset(sample_data)
results <- BVClassify(norm_sample_data)
```
