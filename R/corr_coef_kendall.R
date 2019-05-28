# ===================================================== corr_coef_kendall =====================================================

#' corr_coef_kendall
#' correlation Coeficient using kendall Method
#' @param variable1 is a column or Numeric vector
#' @param variable2 is a column or Numeric vector
#' @param decimal is a Numeric Argument
#' @importFrom stats cor
#' @return correlation coeficient
#' @export
#' @examples
#' corr_coef_kendall(variable1= mtcars$cyl, variable2=mtcars$carb, decimal = 2)

corr_coef_kendall<- function(variable1=NULL, variable2=NULL, decimal=NULL){
  kendall<- round(cor(variable1, variable2, use = "everything", method = "kendall"), decimal)
  return(kendall)
}
