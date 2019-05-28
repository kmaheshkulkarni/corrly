#============================================================ Correlation Matrix Plot ====================================================================


#' matrixly
#' Correlation matrix Plot using R Plotly
#' @param data is a Data Frame
#' @import plotly
#' @importFrom stats cor
#' @return plot
#' @export
#' @examples
#' matrixly(data = mtcars)
matrixly <- function(data= NULL){
  correlation <- round(cor(data, use = "everything", method = "pearson"), 2)
  nms <- names(data)
  return(
    plotly::plot_ly(x=nms, y=nms, z = correlation, color = ~correlation, key = correlation, type = "heatmap", source = "heatplot") %>%
      plotly::layout(xaxis = list(title = ""),
             yaxis = list(title = "")) %>%
      plotly::layout(legend = list(orientation = "h",   # show entries horizontally
                           xanchor = "bottom",  # use center of legend as anchor
                           x = 0.45, y = -0.3,
                           bordercolor = "#333",
                           borderwidth = 2)) %>%
      plotly::config(displaylogo = FALSE, collaborate = FALSE)
  )
}
