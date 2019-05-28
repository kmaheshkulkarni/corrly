#============================================================ Group Function ====================================================================


#' grouping_function
#'
#' @param parameter_value is a column of Data Frame
#' @param subgroup_size is group size of vector
#' @return grouped data frame
#' @export
#' @examples
#' grouping_function(parameter_value = cars$speed, subgroup_size = 2)
grouping_function <- function(parameter_value = NULL, subgroup_size = NULL) {
  grouping <- data.frame()
  subgroup_size <- as.numeric(as.character(subgroup_size))
  groups <- matrix(parameter_value, nrow=subgroup_size)
  groups <- t(groups)
  grouping <- rbind(grouping, data.frame(groups))
  grouping$groups <- rep(1:nrow(grouping), each=1)
  grouping$Range <- apply(grouping,1,max) - apply(grouping,1,min)
  grouping$Mean <- rowMeans(grouping[, c(1:subgroup_size)])
  return(grouping)
}
