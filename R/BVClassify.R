#' Predict Bacterial Vaginosis classes from a given dataframe
#'
#' @param dataset dataframe: The columns correspond to the species used for classification and the rows correspond to the samples.
#' @param plot_HM logical: TRUE to plot the heatmap and FALSE to avoid plotting
#' @param type character string: "species" if you have species names or "NCBI" if you have NCBI_IDs instead of species names
#' @return dataframe/list: if plot_HM is FALSE return a dataframe where the first three columns correspond to the probability of belonging to each of the classes and the last one to the label of the class you belong to. If plot_HM is TRUE return a list with the dataframe and heatmap.
#' @export
#' @importFrom stats predict
#' @importFrom stats hclust
#' @importFrom stringr str_to_title
#' @importFrom utils data
#' @importFrom mlr normalizeFeatures
#' @importFrom pheatmap pheatmap
#' @examples
#' BVClassify(sample_data, type = "species")
BVClassify <- function(dataset, type = "species", plot_HM = FALSE){

  # Type data
  if (type == "NCBI"){
    data = convert_ncbi_ID(dataset) # Convert NCBI IDs to species names
  }else if(type == "species"){
    data = check_sps(dataset) # Chaeck that have enough species and check their names
  }

  # Normalize Features
  data = normdataset(data)

  # Scale for Machine Learning
  features = modelC$features
  data <- data[features]
  test_task = mlr::normalizeFeatures(
    data,
    method = "range",
    cols = NULL,
    range = c(0,1),
    on.constant = "quiet"
  )
  pred = predict(modelC, newdata = test_task, type = "prob")
  results = pred$data
  if (plot_HM == FALSE){
    return(results)
  }else if (plot_HM == TRUE){
    Clusters = results$response
    all_data = cbind(data, Clusters)
    identical(rownames(data), rownames(results))
    all_data = all_data[order(all_data[,9]),]
    mat = all_data[1:8]
    # scale on OTUs
    mat.scale <- scale(mat, center = T, scale = T)
    # scale on samples
    mat.scale <- scale(t(mat.scale), center = T, scale = T)
    col <- data.frame(Clusters = all_data[9])
    colors <- list(Clusters =c("C1" ="#21908CFF", "C2"= "#440154FF", "C3" = "#FDE725FF"))

    hmap = pheatmap::pheatmap(mat.scale,
                    scale = 'none',
                    cluster_rows = F,
                    cluster_cols = F,
                    fontsize_row = 8, fontsize_col = 8,
                    fontsize = 8,
                    show_colnames = FALSE,
                    clustering_distance_rows = 'euclidean',
                    clustering_method = 'ward.D',
                    treeheight_row = 30,
                    annotation_col = col,
                    annotation_colors = colors,
                    border_color = 'NA',
                    main = 'Heatmap 8 Species')
    nms = c("results", "heatmap")
    l_results = list(results, hmap)
    names(l_results) = nms
    return(l_results)
  }
  }


