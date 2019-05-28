#============================================================ Cross Correlation ====================================================================


#' ccf_ly
#' Cross Correlation Plot using R Plotly
#' @param series1 is numeric vector
#' @param series2 is numeric vector
#' @import plotly
#' @importFrom stats acf ccf qnorm
#' @return plot
#' @export
#' @examples
#' ccfq<- c(mtcars$mpg, mtcars$gear)
#' ccfa<- c(mtcars$hp, mtcars$cyl)
#' ccf_ly(series1=ccfq, series2=ccfa)
ccf_ly <- function(series1= NULL, series2= NULL) {
  series <- c(series1, series2)
  significance_level <- qnorm((1 + 0.95)/2)/sqrt(sum(!is.na(series)))
  p_ccf <-ccf(series1, series2, plot=F)
  df_ccf <- with(p_ccf, data.frame(lag, acf))
  ccf_plotly <- plotly::plot_ly(df_ccf, x = ~lag, y = ~acf, color = ~acf, type = "bar", showlegend = FALSE, mode='markers', name = "LAG, ACF") %>%
    plotly::add_markers(y = significance_level, marker=list(colorbar=list(title='Correlation Coeficient')), name = "Positive Significance Level") %>%
    plotly::add_markers(y = -significance_level, marker=list(colorbar=list(title='Correlation Coeficient')), name = "Negative Significance Level") %>%
    plotly::layout(xaxis = list( title = 'LAG'), yaxis = list( title = 'CCF')) %>%
    plotly::add_lines(y = significance_level,
              line = list(color = 'rgb(22, 96, 167)'),
              name = "Positive Significance Level", showlegend = TRUE) %>%
    plotly::add_lines(y = -significance_level, line = list(color = '#07A4B5'),
              name = "Negative Significance Level", showlegend = TRUE) %>%
    plotly::config(displaylogo = FALSE, collaborate = FALSE);
  ccf_plotly <- ccf_plotly %>% plotly::colorbar(title="Correlation Coeficient")
  ccf_plotly
  return(ccf_plotly);
}
