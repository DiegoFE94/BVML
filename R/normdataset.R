#' Make log2 Normalization of a given dataframe
#'
#' @param dataset dataframe: The columns correspond to the species raw counts used for classification and the rows correspond to the samples
#'
#' @return dataframe: Return a dataframe with the same structure but with log2 normalised counts
#'
#'
#' @examples
normdataset = function(dataset){
  # Retain only numerics variables
  cols <- sapply(dataset, is.numeric)

  # Normalize that variables
  dataset[cols] <- apply(X = dataset[cols], FUN = function(x) log2(x+1), MARGIN = 2)
  return(dataset)
}
