
<!-- README.md is generated from README.Rmd. Please edit that file -->

# BVML

<!-- badges: start -->

<!-- badges: end -->

BVML is a patient stratification package for Bacteriosis Vaginalis
disease. This package through a pre-trained Random Forest model and
metagenomic profile of 8 bacterial species is able to classify patients
into three classes:

  - Class C1: patients with incipient dysbiosis.
  - Class C2: Patients with a BV+ profile.
  - Class C3: patients with a BV- profile.

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
