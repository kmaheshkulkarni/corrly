# ===================================================== corr_coef_spearman =====================================================

#' corr_coef_spearman
#' correlation Coeficient using spearman Method
#' @param variable1 is a column or Numeric vector
#' @param variable2 is a column or Numeric vector
#' @param decimal is a Numeric Argument
#' @importFrom stats cor
#' @return correlation coeficient
#' @export
#' @examples
#' corr_coef_spearman(variable1= cars$speed, variable2=cars$dist, decimal = 2)
corr_coef_spearman<- function(variable1=NULL, variable2=NULL, decimal=NULL){
  spearman<- round(cor(variable1, variable2, use = "everything", method = "spearman"), decimal)
  return(spearman)
}
