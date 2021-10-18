
<!-- README.md is generated from README.Rmd. Please edit that file -->

# BVML

<!-- badges: start -->

<!-- badges: end -->

BVML is a patient stratification package for Bacteriosis Vaginalis
disease. This package through a pre-trained Random Forest model and
metagenomic profile of 8 bacterial species is able to classify patients
into three classes:

  - Class C1: patients with incipient dysbiosis.
  - Class C2: patients with a BV+ profile.
  - Class C3: patients with a BV- profile.

## Installation

To install the BVML, install from github using devtools:

``` r
install.packages("devtools")
library(devtools)
devtools::install_github("DiegoFE94/BVML")
```

## Functionalities

This section explains the different functionalities that constitute the
package.

  - convert\_ncbi\_ID: This function has as input a dataframe in which
    the columns correspond to the NCBI IDs of the 8 species and the rows
    to the samples. The function converts the NCBI IDs to the species
    names in the correct format for prediction.

  - check\_sps: This function has as input a dataframe whose columns
    correspond to the selected species and rows correspond to the
    samples. This function checks that all the required species are
    present in the dataframe. It also checks that the species are in the
    correct format.

  - normdataset: This function has as input a dataframe whose columns
    correspond to the selected species and rows correspond to the
    samples.This function performs the log2 normalization of the
    species, a preprocessing necessary to perform the prediction.

  - BVClassify: This function has as input a dataframe whose columns
    correspond to the selected species (in the correct format) and rows
    correspond to the samples. It also has as input a logical value
    TRUE/FALSE. This function performs the classification of the samples
    into the three corresponding classes of the algorithm. The output is
    a dataframe where the columns correspond to the samples, the columns
    correspond to the probability of belonging to each class and to
    which class it corresponds according to the algorithm. In addition,
    if TRUE is selected in the input, it returns a Heatmap with the
    metagenomic profile of the dataframe.

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

## Questions?

If you have any questions, please feel free to contact
(<diego.fedreira@udc.es>).
