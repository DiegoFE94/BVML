% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_sps.R
\name{check_sps}
\alias{check_sps}
\title{Check that species names are correct and there are the 8 species required. Also try to put the species names in the required format.
names have to be like this: Genero.species, i.e: "Lactobacillus.crispatus"}
\usage{
check_sps(dataset)
}
\arguments{
\item{dataset}{dataframe:The columns correspond to the species used for classification and the rows correspond to the samples.}
}
\value{
dataframe
}
\description{
Check that species names are correct and there are the 8 species required. Also try to put the species names in the required format.
names have to be like this: Genero.species, i.e: "Lactobacillus.crispatus"
}
