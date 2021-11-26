#' Check that species names are correct and there are the 8 species required. Also try to put the species names in the required format.
#' names have to be like this: Genero.species, i.e: "Lactobacillus.crispatus"
#'
#' @param dataset dataframe:The columns correspond to the species used for classification and the rows correspond to the samples.
#'
#' @return dataframe
#' @export
#'
#' @examples check_sps(sample_data)
check_sps <- function(dataset){
  out <- tryCatch(
    {
      features = modelC$features
      nms = make.names(colnames(dataset))
      lapply(nms, str_to_title)
      colnames(dataset) = nms
      dataset <- dataset[features]
      return(dataset)
    },error=function(cond) {
      message(paste("Incorrect species names or not enough species,check them and try again"))
      message("Specific Error Message:")
      message(cond)
      return(NA)
    }
  )
  return(out)
}
