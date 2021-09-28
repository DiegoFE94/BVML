#' Convert NCBI IDs on Species names
#'
#' @param dataset dataframe: The columns correspond to the species raw counts used for classification and the rows correspond to the samples
#'
#' @return dataframe: same dataframe but with column names changed
#' @export
#'
#' @examples
convert_ncbi_ID <- function(dataset){
  out <- tryCatch(
    {
      features = df_annotation$ncbi_ids
      dataset <- dataset[features]
      m = match(df_annotation$ncbi_ids, colnames(dataset))
      colnames(dataset) = df_annotation$names_sps[m]
      return(dataset)
    },error=function(cond) {
      message(paste("Incorrect species IDs,check them and try again"))
      message("Specific Error Message:")
      message(cond)
      return(NA)
    }
  )
  return(out)
}
