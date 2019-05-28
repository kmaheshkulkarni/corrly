# ===================================================== Correlation Scatter Plot =====================================================


#' corr_scatterly
#' Correlation Scatter Plot using R Plotly
#' @param data is a Data Frame
#' @param x is a column of Data Frame
#' @param y is a column of Data Frame
#' @param corr_coef is a Correlation Coeficient
#' @param xname is a string and Name of X-axis
#' @param yname is a string and Name of Y-axis
#' @import plotly
#' @importFrom stats fitted lm
#' @return plot
#' @export
#' @examples
#' spearman<- corr_coef_spearman(variable1= cars$speed, variable2=cars$dist, decimal = 2)
#' corr_scatterly(data=cars,x=cars$speed,y=cars$dist,corr_coef=spearman,xname="speed",yname="dist")

corr_scatterly <- function(data=NULL, x=NULL, y=NULL, corr_coef=NULL, xname="", yname=""){
  fit<- lm(y ~ x)
  return(
    plotly::plot_ly(x = x, y = y) %>%
      plotly::add_markers(marker = list(size = 15, opacity = 0.8), showlegend = TRUE, text = paste0(x, y), name = "") %>%
      plotly::add_lines(y = fitted(fit), line = list(color = 'rgb(250,128,114)', width = 3), showlegend = TRUE,
                     text = ~paste0("Correlation Coefitient R = ", corr_coef), name = "Best Fit Line") %>%
      plotly::layout(xaxis = list(title = paste0(unique(xname))),
                  yaxis = list(title = paste0(unique(yname)), showlegend = TRUE)) %>%
      plotly::layout(legend = list(orientation = "h",   # show entries horizontally
                                xanchor = "bottom",  # use center of legend as anchor
                                x = 0.40, y = -0.3,
                                bordercolor = "#333",
                                borderwidth = 2)) %>% plotly::layout(paste0('Correlation Coefficient =', corr_coef))%>%
      plotly::config(displaylogo = FALSE, collaborate = FALSE))
}
