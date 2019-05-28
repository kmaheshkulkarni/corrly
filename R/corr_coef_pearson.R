# ===================================================== corr_coef_pearson =====================================================

#' corr_coef_pearson
#' correlation Coeficient using pearson Method
#' @param variable1 is a column or Numeric vector
#' @param variable2 is a column or Numeric vector
#' @param decimal is a Numeric Argument
#' @importFrom stats cor
#' @return correlation coeficient
#' @export
#' @examples
#' corr_coef_pearson(variable1= mtcars$disp, variable2=mtcars$hp, decimal = 2)
corr_coef_pearson<- function(variable1=NULL, variable2=NULL, decimal=NULL){
  pearson<- round(cor(variable1, variable2, use = "everything", method = "pearson"), decimal)
  return(pearson)
}
